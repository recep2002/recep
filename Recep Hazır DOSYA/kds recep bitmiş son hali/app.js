const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const session = require('express-session');
const mysql = require('mysql2');

const app = express();
const port = 3000;

// Veritabanı bağlantısı
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root', // Veritabanı kullanıcı adı
    password: '', // Veritabanı şifresi
    database: 'togg' // Veritabanı adı
});

// Veritabanına bağlan
db.connect((err) => {
    if (err) {
        console.error('Veritabanı bağlantı hatası:', err);
        process.exit(1);
    }
    console.log('Veritabanına başarıyla bağlanıldı!');
});

// Statik dosyaları public klasöründen sunma
app.use(express.static(path.join(__dirname, 'public')));

// Middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(session({
    secret: 'your-secret-key', // Session şifresi
    resave: false,
    saveUninitialized: true
}));

// Giriş sayfası
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html')); // Public klasöründeki index.html dosyasını gönder
});

// Dashboard sayfası
app.get('/dashboard', (req, res) => {
    if (!req.session.loggedIn) {
        // Eğer kullanıcı giriş yapmamışsa, ana sayfaya yönlendirilir
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'public', 'dashboard.html')); // Public klasöründeki dashboard.html dosyasını gönder
});

// Giriş işlemi
app.post('/login', (req, res) => {
    const { username, password } = req.body;

    // Veritabanında kullanıcı doğrulama
    const query = 'SELECT * FROM kullanicilar WHERE kullanici_adi = ? AND kullanici_parolasi = ?';
    db.query(query, [username, password], (err, results) => {
        if (err) {
            console.error('Sorgu hatası:', err);
            return res.status(500).send('Bir hata oluştu, lütfen tekrar deneyin.');
        }

        if (results.length > 0) {
            req.session.loggedIn = true; // Oturumu başlat
            return res.redirect('/dashboard'); // Başarılı giriş sonrası yönlendirme
        } else {
            return res.send('<h1>Giriş başarısız! Kullanıcı adı veya şifre yanlış.</h1>');
        }
    });
});

// Çıkış işlemi
app.get('/logout', (req, res) => {
    req.session.destroy((err) => {
        if (err) {
            return res.send('Çıkış yapılırken bir hata oluştu.');
        }
        res.redirect('/');
    });
});

// Satış verileri API'si
app.get('/api/satislar', (req, res) => {
    const query = 'SELECT ay_id, satis_miktari FROM satislar ORDER BY FIELD(ay_id, "Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık")';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Veri çekme hatası:', err);
            res.status(500).send('Veritabanı hatası');
        } else {
            res.json(results); // Satış verilerini JSON formatında gönder
        }
    });
});

// /api/iller-en-fazla-satis API'si
app.get('/api/iller-en-fazla-satis', (req, res) => {
    const query = 'SELECT il_adi, satis_sayisi FROM iller ORDER BY satis_sayisi DESC LIMIT 6';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Veri çekme hatası:', err);
            res.status(500).send('Veritabanı hatası');
        } else {
            res.json(results); // İlk 6 ilin satış verilerini JSON formatında gönder
        }
    });
});

app.listen(port, () => {
    console.log(`Server çalışıyor: http://localhost:${port}`);
});

// Chart verilerini almak için bir API
app.get('/api/chart-data', (req, res) => {
    const query = 'SELECT yil_id, sarj_sayisi FROM şarj'; // Tablo adınızı doğru girin
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Yıla göre talepleri getiren endpoint
app.get('/api/talepler/:yil', (req, res) => {
    const yil = req.params.yil;
    const query = 'SELECT il_adi, talep_sayisi FROM talepler WHERE yil_id = ?';
    db.query(query, [yil], (err, results) => {
        if (err) {
            console.error('Veritabanı sorgu hatası:', err);
            res.status(500).json({ error: 'Veritabanı hatası' });
            return;
        }
        res.json(results);
    });
});

// İle göre tüm yılların verilerini getiren endpoint
app.get('/api/talepler/il/:ilAdi/tumYillar', (req, res) => {
    const ilAdi = req.params.ilAdi;
    const query = 'SELECT il_adi, yil_id, talep_sayisi FROM talepler WHERE il_adi = ? ORDER BY yil_id';
    db.query(query, [ilAdi], (err, results) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        res.json(results);
    });
});

app.get('/api/satislar/:yil', (req, res) => {
    const yil = req.params.yil;
    const query = 'SELECT ay_id, satis_miktari FROM satislar WHERE yil_id = ? ORDER BY ay_id';
    db.query(query, [yil], (err, results) => {
        if (err) {
            res.status(500).json({ error: err.message });
            return;
        }
        res.json(results);
    });
});

// Tahminleme API'si
app.get('/api/predictions', (req, res) => {
    const { city, month, year } = req.query;
    
    const query = 'SELECT il_adi, satis_sayisi FROM iller WHERE il_id = ?';
    
    db.query(query, [city], (err, results) => {
        if (err) {
            console.error('Veri çekme hatası:', err);
            return res.status(500).json({ error: 'Veritabanı hatası' });
        }

        if (results.length === 0) {
            return res.status(404).json({ error: 'Veri bulunamadı' });
        }

        const currentSales = results[0].satis_sayisi;
        const monthIndex = parseInt(month) - 1;
        const monthLabels = ['Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran', 
                           'Temmuz', 'Ağustos', 'Eylül', 'Ekim', 'Kasım', 'Aralık'];

        // Ay bazlı etki faktörleri (mevsimsel etkiler)
        const monthlyFactors = {
            0: 0.8,  // Ocak
            1: 0.9,  // Şubat
            2: 1.1,  // Mart
            3: 1.2,  // Nisan
            4: 1.3,  // Mayıs
            5: 1.4,  // Haziran
            6: 1.5,  // Temmuz
            7: 1.4,  // Ağustos
            8: 1.2,  // Eylül
            9: 1.1,  // Ekim
            10: 0.9, // Kasım
            11: 0.8  // Aralık
        };
        
        const predictions = [];
        const labels = [];

        // Yıla göre farklı tahmin parametreleri
        const baseGrowth2025 = 0.08; // 2025 için temel büyüme oranı
        const baseGrowth2026 = 0.15; // 2026 için temel büyüme oranı
        
        for (let i = 0; i < 6; i++) {
            const monthIdx = (monthIndex + i) % 12;
            labels.push(`${monthLabels[monthIdx]} ${year}`);
            
            // Yeni tahmin formülü
            let prediction;
            const monthFactor = monthlyFactors[monthIdx];
            const progressiveFactor = 1 + (i * 0.1); // Her ay için artan etki

            if (year === '2025') {
                prediction = currentSales * 
                           monthFactor * 
                           (1 + baseGrowth2025 * progressiveFactor);
            } else {
                prediction = currentSales * 
                           monthFactor * 
                           2.2 * // 2026 baz çarpanı
                           (1 + baseGrowth2026 * progressiveFactor);
            }
            
            predictions.push(Math.round(prediction));
        }

        res.json({
            labels,
            predictions,
            cityName: results[0].il_adi,
            year: year,
            startMonth: monthLabels[monthIndex]
        });
    });
});
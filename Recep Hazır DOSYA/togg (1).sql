-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 30 Ara 2024, 15:38:53
-- Sunucu sürümü: 9.1.0
-- PHP Sürümü: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `togg`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `aylar`
--

DROP TABLE IF EXISTS `aylar`;
CREATE TABLE IF NOT EXISTS `aylar` (
  `ay_id` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `ay_numarasi` int NOT NULL,
  PRIMARY KEY (`ay_id`),
  KEY `ay_numarasi` (`ay_numarasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `aylar`
--

INSERT INTO `aylar` (`ay_id`, `ay_numarasi`) VALUES
('Ocak', 1),
('Şubat', 2),
('Mart', 3),
('Nisan', 4),
('Mayıs', 5),
('Haziran', 6),
('Temmuz', 7),
('Ağustos', 8),
('Eylül', 9),
('Ekim', 10),
('Kasım', 11),
('Aralık', 12);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `iller`
--

DROP TABLE IF EXISTS `iller`;
CREATE TABLE IF NOT EXISTS `iller` (
  `il_id` int NOT NULL AUTO_INCREMENT,
  `il_adi` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
  `koordinatlar` varchar(255) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `nufus` varchar(255) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `bilgi` text COLLATE utf8mb4_turkish_ci,
  `satis_sayisi` int NOT NULL,
  PRIMARY KEY (`il_id`),
  UNIQUE KEY `il_adi` (`il_adi`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `iller`
--

INSERT INTO `iller` (`il_id`, `il_adi`, `koordinatlar`, `nufus`, `bilgi`, `satis_sayisi`) VALUES
(1, 'Adana', '37.0, 35.3213', '2.2 milyon', 'Adana kebaplarıyla ünlüdür.', 1150),
(2, 'Adıyaman', '37.7648, 38.2786', '0.6 milyon', 'Nemrut Dağı ile ünlüdür.', 453),
(3, 'Afyonkarahisar', '38.7638, 30.5404', '0.7 milyon', 'Termal kaplıcalarıyla ünlüdür.', 512),
(4, 'Ağrı', '39.7191, 43.0503', '0.5 milyon', 'Ağrı Dağı ile tanınır.', 121),
(5, 'Amasya', '40.6539, 35.8353', '0.3 milyon', 'Tarihi evleri ve Ferhat ile Şirin efsanesiyle bilinir.', 111),
(6, 'Ankara', '39.9208, 32.8541', '5.1 milyon', 'Türkiye\'nin başkenti.', 2870),
(7, 'Antalya', '36.8841, 30.7056', '2.6 milyon', 'Turizmin başkenti.', 1148),
(8, 'Artvin', '41.1825, 41.8212', '0.2 milyon', 'Doğal güzellikleriyle ünlüdür.', 54),
(9, 'Aydın', '37.8450, 27.8396', '1.1 milyon', 'Tarihi Didim ve Kuşadası ile bilinir.', 620),
(10, 'Balıkesir', '39.6533, 27.8917', '1.2 milyon', 'Kaz Dağları ile tanınır.', 643),
(11, 'Bilecik', '40.1574, 29.9793', '0.2 milyon', 'Osmanlı Devleti\'nin kuruluş yeri.', 43),
(12, 'Bingöl', '38.8847, 40.4939', '0.3 milyon', 'Doğal güzellikleri ile bilinir.', 41),
(13, 'Bitlis', '38.4011, 42.1078', '0.3 milyon', 'Nemrut Krater Gölü ile ünlüdür.', 53),
(14, 'Bolu', '40.7350, 31.6060', '0.3 milyon', 'Abant Gölü ve Yedigöller ile bilinir.', 57),
(15, 'Burdur', '37.7203, 30.2903', '0.2 milyon', 'Salda Gölü ile ünlüdür.', 49),
(16, 'Bursa', '40.1826, 29.0661', '3.1 milyon', 'Osmanlı\'nın ilk başkenti.', 1565),
(17, 'Çanakkale', '40.1553, 26.4142', '0.5 milyon', 'Tarihi Gelibolu yarımadası ve Truva ile ünlüdür.', 78),
(18, 'Çankırı', '40.6013, 33.6134', '0.2 milyon', 'Tuz Mağarası ile tanınır.', 21),
(19, 'Çorum', '40.5506, 34.9556', '0.5 milyon', 'Hititlerin başkenti Hattuşa.', 34),
(20, 'Denizli', '37.7765, 29.0864', '1.0 milyon', 'Pamukkale travertenleri ile ünlüdür.', 215),
(21, 'Diyarbakır', '37.9158, 40.2189', '1.7 milyon', 'Tarihi surları ile tanınır.', 432),
(22, 'Edirne', '41.6772, 26.5554', '0.4 milyon', 'Selimiye Camii ile ünlüdür.', 17),
(23, 'Elazığ', '38.6809, 39.2266', '0.6 milyon', 'Harput Kalesi ile bilinir.', 32),
(24, 'Erzincan', '39.7464, 39.4919', '0.2 milyon', 'Kemaliye Kanyonu ile tanınır.', 16),
(25, 'Erzurum', '39.9057, 41.2655', '0.8 milyon', 'Kış turizmi ile ünlüdür.', 78),
(26, 'Eskişehir', '39.7667, 30.5256', '0.9 milyon', 'Odunpazarı evleri ve Porsuk Çayı ile bilinir.', 0),
(27, 'Gaziantep', '37.0662, 37.3833', '2.1 milyon', 'Baklava ve yemek kültürü ile ünlüdür.', 876),
(28, 'Giresun', '40.9128, 38.3895', '0.4 milyon', 'Fındık üretimi ile bilinir.', 57),
(29, 'Gümüşhane', '40.4600, 39.4814', '0.2 milyon', 'Doğal güzellikleri ile bilinir.', 22),
(30, 'Hakkari', '37.5744, 43.7408', '0.3 milyon', 'Cilo Dağları ile ünlüdür.', 0),
(31, 'Hatay', '36.2028, 36.1600', '1.6 milyon', 'Mozaikleriyle ünlü Antakya.', 0),
(32, 'Iğdır', '39.9166, 44.0450', '0.2 milyon', 'Ağrı Dağı manzarasıyla bilinir.', 0),
(33, 'Isparta', '37.7648, 30.5563', '0.4 milyon', 'Gül üretimi ile tanınır.', 0),
(34, 'Mersin', '36.8121, 34.6415', '1.9 milyon', 'Liman kenti ve Cennet-Cehennem mağaraları ile bilinir.', 0),
(35, 'İstanbul', '41.0082, 28.9784', '15.8 milyon', 'Türkiye\'nin en büyük şehri.', 8348),
(36, 'İzmir', '38.4192, 27.1287', '4.4 milyon', 'Ege\'nin incisi.', 2504),
(37, 'Kahramanmaraş', '37.5774, 36.9371', '1.1 milyon', 'Dondurması ile meşhur.', 218),
(38, 'Karabük', '41.2061, 32.6204', '0.2 milyon', 'Safranbolu evleri ile bilinir.', 28),
(39, 'Karaman', '37.1811, 33.2150', '0.2 milyon', 'Tarihi mekanları ile bilinir.', 21),
(40, 'Kars', '40.6014, 43.0970', '0.3 milyon', 'Ani Harabeleri ile bilinir.', 33),
(41, 'Kastamonu', '41.3887, 33.7827', '0.4 milyon', 'Doğal güzellikleri ile tanınır.', 76),
(42, 'Kayseri', '38.7312, 35.4787', '1.4 milyon', 'Erciyes Dağı ile ünlüdür.', 316),
(43, 'Kırıkkale', '39.8468, 33.5152', '0.2 milyon', 'Sanayi şehri.', 21),
(44, 'Kırklareli', '41.7355, 27.2255', '0.3 milyon', 'Doğal güzellikleri ile bilinir.', 27),
(45, 'Kırşehir', '39.1458, 34.1600', '0.2 milyon', 'Ahi Evran ile bilinir.', 20),
(46, 'Kilis', '36.7167, 37.1150', '0.1 milyon', 'Zeytinyağı üretimi ile ünlüdür.', 2),
(47, 'Kocaeli', '40.8533, 29.8815', '1.9 milyon', 'Sanayi şehri.', 419),
(48, 'Konya', '37.8715, 32.4847', '2.2 milyon', 'Mevlana ile ünlüdür.', 1038),
(49, 'Kütahya', '39.4242, 29.9833', '0.6 milyon', 'Çinicilik ile tanınır.', 219),
(50, 'Malatya', '38.3552, 38.3095', '0.8 milyon', 'Kayısısı ile ünlüdür.', 318),
(51, 'Manisa', '38.6133, 27.4265', '1.4 milyon', 'Spil Dağı ve üzümü ile tanınır.', 512),
(52, 'Mardin', '37.3122, 40.7350', '0.8 milyon', 'Tarihi taş evleri ile bilinir.', 128),
(53, 'Muğla', '37.2153, 28.3636', '1.0 milyon', 'Bodrum, Fethiye ve Marmaris ile bilinir.', 270),
(54, 'Muş', '38.9462, 41.7539', '0.4 milyon', 'Tarihi eserleriyle bilinir.', 78),
(55, 'Nevşehir', '38.6247, 34.7141', '0.3 milyon', 'Kapadokya bölgesi ile ünlüdür.', 41),
(56, 'Niğde', '37.9683, 34.6914', '0.3 milyon', 'Tarihi eserleri ile tanınır.', 45),
(57, 'Ordu', '40.9838, 37.8769', '0.7 milyon', 'Fındık üretimi ile bilinir.', 168),
(58, 'Osmaniye', '37.0745, 36.2473', '0.5 milyon', 'Tarihi eserleriyle bilinir.', 102),
(59, 'Rize', '41.0201, 40.5235', '0.3 milyon', 'Çay üretimi ile ünlüdür.', 78),
(60, 'Sakarya', '40.7565, 30.3789', '1.0 milyon', 'Sapanca Gölü ile tanınır.', 315),
(61, 'Samsun', '41.2867, 36.33', '1.4 milyon', 'Karadeniz\'in incisi.', 389),
(62, 'Siirt', '37.9333, 41.95', '0.3 milyon', 'Doğal güzellikleriyle tanınır.', 65),
(63, 'Sinop', '42.0271, 35.1545', '0.2 milyon', 'En kuzey noktamız.', 15),
(64, 'Sivas', '39.7477, 37.0179', '0.6 milyon', 'Tarihi eserleriyle tanınır.', 200),
(65, 'Şanlıurfa', '37.1676, 38.7955', '2.1 milyon', 'Peygamberler şehri.', 310),
(66, 'Şırnak', '37.4187, 42.4918', '0.5 milyon', 'Doğal güzellikleriyle bilinir.', 241),
(67, 'Tekirdağ', '40.9789, 27.5110', '1.1 milyon', 'Marmara\'nın güzellikleri.', 312),
(68, 'Tokat', '40.3140, 36.5544', '0.6 milyon', 'Tarihi dokusuyla tanınır.', 122);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `istasyon`
--

DROP TABLE IF EXISTS `istasyon`;
CREATE TABLE IF NOT EXISTS `istasyon` (
  `istasyon_miktari` int NOT NULL,
  `yil_id` int NOT NULL,
  `il_adi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `istasyon_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`istasyon_id`),
  KEY `yil_id` (`yil_id`,`il_adi`),
  KEY `il_adi` (`il_adi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

DROP TABLE IF EXISTS `kullanicilar`;
CREATE TABLE IF NOT EXISTS `kullanicilar` (
  `kullanici_id` int NOT NULL AUTO_INCREMENT,
  `kullanici_adi` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `kullanici_parolasi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`kullanici_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`kullanici_id`, `kullanici_adi`, `kullanici_parolasi`) VALUES
(1, 'admin', '1234');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `satislar`
--

DROP TABLE IF EXISTS `satislar`;
CREATE TABLE IF NOT EXISTS `satislar` (
  `yil_id` int NOT NULL,
  `satis_id` int NOT NULL AUTO_INCREMENT,
  `satis_miktari` int NOT NULL,
  `ay_id` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`satis_id`),
  KEY `yil_id` (`yil_id`),
  KEY `ay_id` (`ay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=202413 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `satislar`
--

INSERT INTO `satislar` (`yil_id`, `satis_id`, `satis_miktari`, `ay_id`) VALUES
(2023, 20231, 0, 'Ocak'),
(2023, 20232, 0, 'Şubat'),
(2023, 20233, 860, 'Mart'),
(2023, 20234, 2548, 'Nisan'),
(2023, 20235, 1681, 'Mayıs'),
(2023, 20236, 1745, 'Haziran'),
(2023, 20237, 1568, 'Temmuz'),
(2023, 20238, 2591, 'Ağustos'),
(2023, 20239, 2402, 'Eylül'),
(2024, 20241, 2000, 'Ocak'),
(2024, 20242, 2200, 'Şubat'),
(2024, 20243, 2500, 'Mart'),
(2024, 20244, 2800, 'Nisan'),
(2024, 20245, 3100, 'Mayıs'),
(2024, 20246, 3500, 'Haziran'),
(2024, 20247, 2900, 'Temmuz'),
(2024, 20248, 3000, 'Ağustos'),
(2024, 20249, 3200, 'Eylül'),
(2023, 202310, 1876, 'Ekim'),
(2023, 202311, 1984, 'Kasım'),
(2023, 202312, 1988, 'Aralık'),
(2024, 202410, 3500, 'Ekim'),
(2024, 202411, 3700, 'Kasım'),
(2024, 202412, 4000, 'Aralık');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `talepler`
--

DROP TABLE IF EXISTS `talepler`;
CREATE TABLE IF NOT EXISTS `talepler` (
  `talep_id` int NOT NULL AUTO_INCREMENT,
  `talep_sayisi` int NOT NULL,
  `il_adi` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `yil_id` int NOT NULL,
  PRIMARY KEY (`talep_id`),
  KEY `il_adi` (`il_adi`,`yil_id`),
  KEY `yil_id` (`yil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20246 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `talepler`
--

INSERT INTO `talepler` (`talep_id`, `talep_sayisi`, `il_adi`, `yil_id`) VALUES
(20231, 1317, 'İstanbul', 2023),
(20232, 842, 'Ankara', 2023),
(20233, 663, 'İzmir', 2023),
(20234, 532, 'Bursa', 2023),
(20235, 417, 'Antalya', 2023),
(20241, 3148, 'İstanbul', 2024),
(20242, 1789, 'Ankara', 2024),
(20243, 1226, 'İzmir', 2024),
(20244, 1114, 'Bursa', 2024),
(20245, 902, 'Antalya', 2024);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yil`
--

DROP TABLE IF EXISTS `yil`;
CREATE TABLE IF NOT EXISTS `yil` (
  `yil_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`yil_id`),
  KEY `yil_id` (`yil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2026 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `yil`
--

INSERT INTO `yil` (`yil_id`) VALUES
(2023),
(2024),
(2025);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `şarj`
--

DROP TABLE IF EXISTS `şarj`;
CREATE TABLE IF NOT EXISTS `şarj` (
  `sarj_sayisi` int NOT NULL AUTO_INCREMENT,
  `yil_id` int NOT NULL,
  PRIMARY KEY (`sarj_sayisi`),
  KEY `yil_id` (`yil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `şarj`
--

INSERT INTO `şarj` (`sarj_sayisi`, `yil_id`) VALUES
(798, 2023),
(1151, 2024);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `istasyon`
--
ALTER TABLE `istasyon`
  ADD CONSTRAINT `istasyon_ibfk_1` FOREIGN KEY (`yil_id`) REFERENCES `yil` (`yil_id`),
  ADD CONSTRAINT `istasyon_ibfk_2` FOREIGN KEY (`il_adi`) REFERENCES `iller` (`il_adi`);

--
-- Tablo kısıtlamaları `satislar`
--
ALTER TABLE `satislar`
  ADD CONSTRAINT `satislar_ibfk_1` FOREIGN KEY (`yil_id`) REFERENCES `yil` (`yil_id`),
  ADD CONSTRAINT `satislar_ibfk_2` FOREIGN KEY (`ay_id`) REFERENCES `aylar` (`ay_id`);

--
-- Tablo kısıtlamaları `talepler`
--
ALTER TABLE `talepler`
  ADD CONSTRAINT `talepler_ibfk_1` FOREIGN KEY (`yil_id`) REFERENCES `yil` (`yil_id`),
  ADD CONSTRAINT `talepler_ibfk_2` FOREIGN KEY (`il_adi`) REFERENCES `iller` (`il_adi`);

--
-- Tablo kısıtlamaları `şarj`
--
ALTER TABLE `şarj`
  ADD CONSTRAINT `şarj_ibfk_1` FOREIGN KEY (`yil_id`) REFERENCES `yil` (`yil_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

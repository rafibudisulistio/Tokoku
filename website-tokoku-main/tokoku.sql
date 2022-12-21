-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Okt 2022 pada 15.48
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokoku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `brand`
--

CREATE TABLE `brand` (
  `idbrand` int(11) NOT NULL,
  `namabrand` varchar(100) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `brand`
--

INSERT INTO `brand` (`idbrand`, `namabrand`, `tgldibuat`) VALUES
(1, 'Acer', '2021-08-08 05:06:19'),
(2, 'Asus', '2021-08-08 05:06:19'),
(3, 'Lenovo', '2021-08-08 05:06:50'),
(4, 'Samsung', '2021-08-08 05:06:50'),
(5, 'Xiaomi', '2021-08-08 05:07:24'),
(6, 'Realme', '2021-08-08 05:07:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `idcart` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `tglorder` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL DEFAULT 'Cart'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`idcart`, `orderid`, `userid`, `tglorder`, `status`) VALUES
(1, '16T39JCODjUas', 2, '2022-06-23 06:46:44', 'Selesai'),
(2, '16vFrdzFasVZg', 2, '2022-06-23 09:47:46', 'Selesai'),
(3, '16m3zh0vcECds', 2, '2022-06-23 11:48:07', 'Pengiriman'),
(4, '16LEN.0tb2OH2', 2, '2022-06-23 18:55:18', 'Confirmed'),
(5, '16gOi02H1R5G2', 2, '2022-06-23 19:16:00', 'Confirmed'),
(6, '16081Vfnh4g3c', 2, '2022-06-24 05:10:33', 'Cart');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailorder`
--

CREATE TABLE `detailorder` (
  `detailid` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detailorder`
--

INSERT INTO `detailorder` (`detailid`, `orderid`, `idproduk`, `qty`) VALUES
(1, '16T39JCODjUas', 1, 1),
(3, '16vFrdzFasVZg', 1, 1),
(4, '16m3zh0vcECds', 3, 2),
(5, '16LEN.0tb2OH2', 1, 1),
(6, '16gOi02H1R5G2', 1, 1),
(7, '16081Vfnh4g3c', 3, 1),
(8, '16081Vfnh4g3c', 20, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `namakategori` varchar(100) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`idkategori`, `namakategori`, `tgldibuat`) VALUES
(1, 'Laptop', '2021-08-08 05:04:40'),
(2, 'Phone', '2021-08-08 05:04:40'),
(3, 'Watch', '2021-08-08 05:04:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `idkonfirmasi` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `payment` varchar(10) NOT NULL,
  `namarekening` varchar(25) NOT NULL,
  `tglbayar` date NOT NULL,
  `tglsubmit` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `konfirmasi`
--

INSERT INTO `konfirmasi` (`idkonfirmasi`, `orderid`, `userid`, `payment`, `namarekening`, `tglbayar`, `tglsubmit`) VALUES
(34, '16LEN.0tb2OH2', 2, 'DANA', 'Muhamad Faisal', '2022-06-24', '2022-06-23 19:05:41'),
(35, '16gOi02H1R5G2', 2, 'Bank BCA', 'Rafi', '2022-06-24', '2022-06-24 04:55:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `no` int(11) NOT NULL,
  `metode` varchar(25) NOT NULL,
  `norek` varchar(25) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `an` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`no`, `metode`, `norek`, `logo`, `an`) VALUES
(1, 'Bank BCA', '13131231231', 'bca.png', 'Tokoku'),
(2, 'DANA', '943248844843', 'dana.png', 'Tokoku'),
(3, 'GOPAY', '0882313132123', 'gopay.png', 'Tokoku');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `idbrand` int(11) NOT NULL,
  `namaproduk` varchar(100) NOT NULL,
  `gambar1` varchar(200) NOT NULL,
  `gambar2` varchar(200) NOT NULL,
  `gambar3` varchar(200) NOT NULL,
  `deskripsi` varchar(512) NOT NULL,
  `hargabefore` int(11) NOT NULL,
  `hargaafter` int(11) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`idproduk`, `idkategori`, `idbrand`, `namaproduk`, `gambar1`, `gambar2`, `gambar3`, `deskripsi`, `hargabefore`, `hargaafter`, `tgldibuat`) VALUES
(1, 1, 1, 'Aspire 3 Slim', 'Aspire 3 Slim Depan.png', 'Aspire 3 Slim Samping.png', 'Aspire 3 Slim Belakang.png', '• AMD Ryzen™ 3-3250U dual-core processor <br>\r\n• Windows 10 Home & Office Home Student 2019 <br>\r\n• 4GB DDR4 memory <br>\r\n• 256 GB PCIe Gen3, 8 Gb/s, NVMe <br>\r\n• 14\" Full HD (1920 x 1080) LED-backlit TFT LCD <br>\r\n• AMD Radeon™ Graphics <br>\r\n• Bluelight Shield Technology', 6299000, 5999000, '2021-08-08 05:09:36'),
(2, 1, 1, 'Aspire 5', 'Aspire 5 Depan.png', 'Aspire 5 Samping.png', 'Aspire 5 Belakang.png', '• Processor : AMD® Ryzen™ 5 5500U processor <br>\r\n• OS : Windows 10 Home <br>\r\n• Memory : 8 GB DDR4, upgradeable using 1x Memory Slot <br>\r\n• Storage : 512 GB SSD PCIe Gen3 NVMe, with HDD Upgrade Kit <br>\r\n• Inch, Res, Ratio, Panel : 15.6\" HD (1366 x 768), high-brightness Acer  ComfyView™ LED-backlit TFT LCD <br>\r\n• Graphics : AMD Radeon Graphics <br>\r\n• Features : - Alternative Thermal Modes (Fn+F)', 10300000, 9300000, '2021-08-08 05:09:36'),
(3, 1, 1, 'Nitro 5 AN515 44', 'Nitro 5 AN515 Depan.png', 'Nitro 5 AN515 Samping.png', 'Nitro 5 AN515 Belakang.png', '• Processor : AMD Ryzen™ 5 4600H processor <br>\r\n• OS : Windows 10 Home <br>\r\n• Memory : 1*8GB DDR4 <br>\r\n• Storage : 512GB SSD NVMe <br>\r\n• Inch, Res, Ratio, Panel : 15.6\" Full HD (1920x1080) IPS 144Hz <br>\r\n• Graphics : NVIDIA® GeForce® GTX 1650Ti with 4GB of GDDR6 <br>\r\n• Features : Nitro Sense, Acer CoolBoost (quad exhaust fan), Dual Slot NVMe, max 2TB SSD, RGB 4 Zones keyboard, Refresh Rate 144Hz.', 13999000, 13499000, '2021-08-08 05:11:54'),
(4, 1, 1, 'Nitro 5 AN517 41', 'Nitro 5 AN517 Depan.png', 'Nitro 5 AN517 Samping.png', 'Nitro 5 AN517 Belakang.png', '• Processor : AMD® Ryzen™ 7 5800H processor <br>\r\n• OS : Windows 10 Pro <br>\r\n• Memory : 16 GB DDR4 <br>\r\n• Storage : 512 GB SSD PCIe Gen3 NVMe <br>\r\n• Inch, Res, Ratio, Panel : FHD (1920 x 1080),ComfyView In-plane Switching (IPS) Technology <br>\r\n• Graphics : NVIDIA® GeForce® RTX™ 3060 6GB GDDR6 ', 14999000, 14399000, '2021-08-08 05:11:54'),
(5, 1, 1, 'Swift 3', 'Swift 3 Depan.png', 'Swift 3 Samping.png', 'Swift 3 Belakang.png', '• Processor : AMD Ryzen™ 5 5500U processor <br>\r\n• OS : Windows 10 Home <br>\r\n• Memory : 16GB LPDDR4X Dual Channel Memory <br>\r\n• Storage : 512 GB PCIe Gen3, NVMe, with HDD Upgrade Kit <br>\r\n• Inch, Res, Ratio, Panel : 14\" IPS Full HD (1920 x 1080), 100% sRGB, high-brightness (300nits), Acer ComfyView™ LED-backlit TFT LCD, 16:9. <br>\r\n• Graphics : AMD Radeon™ Graphics <br>\r\n• Features : Fingerprint, Backlight Keyboard, Multiple Cooling Modes <br>\r\n• Accessories : Sleeve Case', 11499000, 10999000, '2021-08-08 11:28:16'),
(6, 1, 1, 'Swift 5', 'Swift 5 Depan.png', 'Swift 5 Samping.png', 'Swift 5 Belakang.png', '• Processor : Intel® Core™ i5-1035G1 processor <br>\r\n• OS : Windows 10 Home <br>\r\n• Memory : 8GB onboard LPDDR4 Dual Channel <br>\r\n• Storage : 512 GB SSD PCIe Gen3, 8 Gb/s, NVMe <br>\r\n• Inch, Res, Ratio, Panel : 14.0\" IPS Full HD 1920 x 1080, Acer ComfyViewTM LED-backlit TFT LCD <br>\r\n• Graphics : Nvidia GeForce MX350 (2GB GDDR5 VRAM) <br>\r\n• Features : Touchscreen, Thunderbolt 3™, Fingerprint, Backlight <br>\r\n• Accessories : Sleeve Case', 16499000, 13599000, '2021-08-08 11:28:16'),
(7, 1, 2, 'ROG Flow X13 GV301', 'ROG Flow X13 Depan.png', 'ROG Flow X13 Samping.png', 'ROG Flow X13 Belakang.png', '• Processor : AMD Ryzen™ 9 5900HS <br>\r\n• Operating System : Windows 10 <br>\r\n• Graphics : NVIDIA® GeForce RTX™ 3050 Ti Laptop GPU 4GB GDDR6 <br>\r\n• Display : 13.4-inch (1920 × 1200) IPS-level Touch Screen, Refresh Rate 120Hz <br>\r\n• Memory : 16GB LPDDR4X <br>\r\n• Storage : 1TB M.2 2230 NVMe™ PCIe® 3.0 SSD <br>\r\n• Keyboard : Backlit Chiclet Keyboard <br>\r\n• WIFI : Intel Wi-Fi 6(Gig+)(802.11ax) <br>\r\n• Speaker : 2x 1W speaker with Smart Amp Technology <br>', 30499000, 27499000, '2021-08-08 11:31:53'),
(8, 1, 2, 'ROG Zephyrus G14', 'ROG G14 Depan.png', 'ROG G14 Samping.png', 'assets/img/produk/ROG G14 Belakang.png', '• Processor : AMD Ryzen™ 7 4800HS <br>\r\n• Operating System : Windows 10 Home <br>\r\n• Graphics : NVIDIA® GeForce GTX™ 1650 Ti 4GB <br>\r\n• Display : 14-inch Non-glare Full HD (1920 x 1080) IPS-level panel, up to 120Hz <br>\r\n• Memory : 8GB DDR4 <br>\r\n• Storage : 512GB M.2 NVMe™ PCIe® 3.0 SSD <br>\r\n• Keyboard : Backlit Chiclet Keyboard <br>\r\n• WIFI : Intel Wi-Fi 6(Gig+)(802.11ax) <br>\r\n• Speaker : 2x 1W speaker with Smart Amp Technology <br>', 24999000, 18599000, '2021-08-08 11:31:53'),
(9, 1, 2, 'Zenbook 14 UX435', 'Zenbook 14 Depan.png', 'Zenbook 14 Samping.png', 'Zenbook 14 Belakang.png', '• Processor : Intel® Core™ i7-1165G7 <br>\r\n• Operating System : Windows 10 Home + OHS 2019 <br>\r\n• Graphics : NVIDIA® GeForce® MX450 <br>\r\n• Display : 14.0-inch LED Backlit FHD (1920 x 1080) 16:9 300nits anti-glare IPS-level panel <br>\r\n• Memory : 16GB LPDDR4X <br>\r\n• Storage : 512GB M.2 NVMe™ PCIe® 3.0 SSD <br>\r\n• Garansi Resmi ASUS Indonesia dan tambahan 1 Tahun dari Service Center Datascrip', 20000000, 19699000, '2021-08-08 11:34:42'),
(10, 1, 2, 'Zenbook Pro Duo', 'Zenbook Pro Depan.png', 'Zenbook Pro Samping.png', 'Zenbook Pro Belakang.png', '• Processor : Intel® Core™ i7-10870H <br>\r\n• Operating System : Windows 10 Home + OHS 2019 <br>\r\n• Graphics : NVIDIA® GeForce® RTX 3070 <br>\r\n• Display : 15.6-inch OLED 4K UHD (3840 x 2160) 16:9 440nits glossy Pantone validated touch panel <br>\r\n• Memory : 32GB DDR4 <br>\r\n• Storage : 1TB M.2 NVMe™ PCIe® 3.0 SSD <br>\r\n• Garansi Resmi ASUS Indonesia dan tambahan 1 Tahun dari Service Center Datascrip', 42999000, 41499000, '2021-08-08 11:34:42'),
(11, 1, 2, 'Vivobook 14 A413', 'Vivobook 14 A413 Depan.png', 'Vivobook 14 A413 Samping.png', 'Vivobook 14 A413 Belakang.png', '• Processor : Intel® Core™ i5-1135G7 <br>\r\n• Operating System : Windows 10 Home + OHS 2019 <br>\r\n• Graphics : Intel® Iris Xe Graphics + NVIDIA® GeForce® MX330 <br>\r\n• Display : 14.0-inch LED Backlit FHD (1920 x 1080) 16:9 250nits anti-glare panel <br>\r\n• Memory : 8GB DDR4 <br>\r\n• Storage : 512GB M.2 NVMe™ PCIe® 3.0 SSD <br>\r\n• Garansi Resmi ASUS Indonesia dan tambahan 1 Tahun dari Service Center Datascrip', 11399000, 10999000, '2021-08-08 11:38:42'),
(12, 1, 2, 'Vivobook 14 M413', 'Vivobook 14 M413 Depan.png', 'Vivobook 14 M413 Samping.png', 'Vivobook 14 M413 Belakang.png', '• Processor : AMD Ryzen™ 7 3700U <br>\r\n• Operating System : Windows 10 Home + OHS 2019 <br>\r\n• Graphics : AMD Radeon™ Graphics <br>\r\n• Display : 14.0-inch LED Backlit FHD (1920 x 1080) 16:9 250nits anti-glare IPS-level panel <br>\r\n• Memory : 8GB DDR4 <br>\r\n• Storage : 512GB M.2 NVMe™ PCIe® 3.0 SSD <br>\r\n• Garansi Resmi ASUS Indonesia dan tambahan 1 Tahun dari Service Center Datascrip', 11999000, 11399000, '2021-08-08 11:38:42'),
(13, 1, 3, 'Ideapad S340', 'Ideapad S340 Depan.png', 'Ideapad S340 Samping.png', 'Ideapad S340 Belakang.png', '• Processor : Intel® Core™ i5-10210U <br>\r\n• Operating System : Windows 10 Home <br>\r\n• Graphics : AMD Integrated <br>\r\n• Display : 14” IPS, FHD (1920 x 1080) <br>\r\n• Memory : 8GB DDR4 <br>\r\n• Storage : 512GB M.2 PCIe SSD <br>\r\n• Keyboard : Optional backlit keyboard', 9000000, 8099000, '2021-08-08 11:50:39'),
(14, 1, 3, 'Ideapad Slim 5', 'Ideapad Slim 5 Depan.png', 'Ideapad Slim 5 Samping.png', 'Ideapad Slim 5 Belakang.png', '• Processor : AMD Ryzen 5 5500U <br>\r\n• Operating System : Windows 10 Home <br>\r\n• Graphics : Integrated AMD Radeon Graphics  <br>\r\n• Display : 14\" FHD (1920x1080) IPS 300nits Anti-glare, 45% NTSC  <br>\r\n• Memory : 8GB Soldered DDR4-3200 <br>\r\n• Storage : 512GB SSD M.2 2242 PCIe 3.0x4 NVMe <br>\r\n• Keyboard : Backlit', 11399000, 10799000, '2021-08-08 11:50:39'),
(15, 1, 3, 'Legion Gaming 3I', 'Gaming 3I Depan.png', 'Gaming 3I Samping.png', 'Gaming 3I Belakang.png', '• Processor : AMD Ryzen 5 4600H <br>\r\n• Operating System : Windows 10 Home + OHS 2019 <br>\r\n• Graphics : NVIDIA® GeForce® GTX 1650 TI 4GB GDDR6 <br>\r\n• Display : 15.6\" FHD (1920x1080) IPS 250nits Anti-glare, 60Hz <br>\r\n• Memory : 8GB DDR4 <br>\r\n• Storage : 512GB SSD M.2 2280 PCIe 3.0x4 NVMe <br>\r\n• Keyboard : Keyboard Blue LED Backlit', 14999000, 12999000, '2021-08-08 11:52:26'),
(16, 1, 3, 'Legion Y540', 'Y540 Depan.png', 'Y540 Samping.png', 'Y540 Belakang.png', '• Processor : Intel® Core™ i7-9750H <br>\r\n• Operating System : Windows 10 Home <br>\r\n• Graphics : NVIDIA® GeForce® RTX 2060 6 GB GDDR6X <br>\r\n• Display : 15.6\" FHD (1920 x 1080) IPS <br>\r\n• Memory : 16GB DDR4 <br>\r\n• Storage : 1TB M.2 NVMe™ PCIe® 3.0 SSD <br>\r\n• Keyboard : White-backlit', 22399000, 20999000, '2021-08-08 11:52:26'),
(17, 1, 3, 'Yoga Slim 7I', 'Yoga Slim 7I Depan.png', 'Yoga Slim 7I Samping.png', 'Yoga Slim 7I Belakang.png', '• Processor : Intel® Core™ i5-1135G7 <br>\r\n• Operating System : Windows 10 Home + OHS 2019 <br>\r\n• Graphics : Integrated Intel Iris Xe <br>\r\n• Display : 13.3\" QHD (2560x1600) Low power IPS 300nits Anti-glare, 100% sRGB, Dolby Vision <br>\r\n• Memory : 8GB DDR4 <br>\r\n• Storage : 512GB SSD M.2 2280 PCIe 4.0x4 NVMe <br>\r\n• Keyboard : Backlit', 18999000, 15799000, '2021-08-08 12:01:04'),
(18, 1, 3, 'Yoga Slim 9I', 'Yoga Slim 9I Depan.png', 'Yoga Slim 9I Samping.png', 'Yoga Slim 9I Belakang.png', '• Processor : Intel® Core™ i7-1185G7 <br>\r\n• Operating System : Windows 10 Home + OHS 2019 <br>\r\n• Graphics :  Integrated Intel Iris Xe <br>\r\n• Display : 14\" UHD (3840x2160) IPS 500nits Glossy, Glass, 90% DCI-P3, VESA HDR 400, Touchscreen <br>\r\n• Memory : 16GB DDR4 <br>\r\n• Storage : 1TB SSD M.2 2280 PCIe NVMe <br>\r\n• Keyboard : Backlit', 30999000, 29999000, '2021-08-08 12:01:04'),
(19, 2, 4, 'Galaxy A52', 'a52blue.png', 'a522hite.png', 'a52black.png', '• CPU : Snapdragon 720G <br>\r\n• Display : 6.5\" FHD+ Super Amoled <br>\r\n• Rear Camera Resolution : 64.0 MP + 12.0 MP + 5.0 MP + 5.0 MP <br>\r\n• Front Camera Resolution : 32.0 MP <br>\r\n• RAM : 8GB <br>\r\n• ROM : 256GB <br>\r\n• Battery Capacity : 4500mAh <br>\r\n• USB Interface : USB Type-C', 6399000, 5399000, '2021-08-08 12:06:59'),
(20, 2, 4, 'Galaxy A72', 'a72violet.png', 'a72white.png', 'a72blue.png', '• CPU : Snapdragon 720G <br>\r\n• Display : 6.7\" FHD+ Super Amoled <br>\r\n• Rear Camera Resolution : 64.0 MP + 12.0 MP + 8.0 MP + 5.0 MP <br>\r\n• Front Camera Resolution : 32.0 MP <br>\r\n• RAM : 8GB <br>\r\n• ROM : 256GB <br>\r\n• Battery Capacity : 5000mAh <br>\r\n• USB Interface : USB Type-C', 7399000, 6399000, '2021-08-08 12:06:59'),
(21, 2, 4, 'Galaxy S21 5G', 'Phantom Gray.png', 'Phantom Pink.png', 'Phantom White.png', '• CPU : Exynos 2100 <br>\r\n• Display : 6.2\" FHD+ Dynamic AMOLED 2X <br>\r\n• Rear Camera Resolution : 12.0 MP + 64.0 MP + 12.0 MP <br>\r\n• Front Camera Resolution : 10.0 MP <br>\r\n• RAM : 8GB <br>\r\n• ROM : 256GB <br>\r\n• Battery Capacity : 4000mAh <br>\r\n• USB Interface : USB Type-C', 14999000, 13999000, '2021-08-08 12:09:48'),
(22, 2, 5, 'MI 11 Ultra', 'mi11Midnight Gray.png', 'mi11Horizon Blue.png', '', '• CPU : Snapdragon 888 <br>\r\n• Display : 6.8\" Amoled <br>\r\n• Rear Camera Resolution : 50.0 MP + 48.0 MP + 48.0 MP <br>\r\n• Front Camera Resolution : 20.0 MP <br>\r\n• RAM : 12GB <br>\r\n• ROM : 256GB <br>\r\n• Battery Capacity : 5000mAh <br>\r\n• USB Interface : USB Type-C', 18000000, 17000000, '2021-08-08 12:09:48'),
(23, 2, 5, 'Poco X3 Pro', 'pocoMetal Bronze.png', 'pocoPhantom Black.png', 'pocoFrost Blue.png', '• CPU : Snapdragon 860 <br>\r\n• Display : 6.67\" FHD+ 120Hz <br>\r\n• Rear Camera Resolution : 48.0 MP + 8.0 MP + 2.0 MP + 2.0 MP <br>\r\n• Front Camera Resolution : 20.0 MP <br>\r\n• RAM : 8GB <br>\r\n• ROM : 256GB <br>\r\n• Battery Capacity : 5160mAh <br>\r\n• USB Interface : USB Type-C', 4099000, 3999000, '2021-08-08 12:11:26'),
(24, 2, 5, 'Redmi Note 10 Pro', 'noteGlacier Blue.png', 'noteOnyx Gray.png', 'noteGradient Bronze.png', '• CPU : Snapdragon 732G <br>\r\n• Display : 6.67\" Super Amoled <br>\r\n• Rear Camera Resolution : 108.0 MP + 8.0 MP + 5.0 MP + 2.0 MP <br>\r\n• Front Camera Resolution : 16.0 MP <br>\r\n• RAM : 8GB <br>\r\n• ROM : 128GB <br>\r\n• Battery Capacity : 5020mAh <br>\r\n• USB Interface : USB Type-C', 3999000, 3899000, '2021-08-08 12:11:26'),
(25, 3, 5, 'Mi Smart Band 5', 'Mi Smart Band 5.png', '', '', '• Display : 1\" AMOLED <br>\r\n• Sensor : High-precision six-axis sensor + PPG heart rate sensor, low-power three-axis acceleration sensor + three-axis gyroscope, PPG heart rate sensor <br>\r\n• Sports : outdoor running, walking, cycling, indoor running, pool swimming, exercise, indoor cycling, elliptical machine, skipping rope, yoga, rowing machine <br>\r\n• Battery Capacity : 14 days long battery life, magnetic charging', 449000, 418000, '2021-08-08 12:14:21'),
(26, 3, 5, 'Mi Watch Lite', 'militeblack.png', 'militenavy blue.png', 'militeivory.png', '• Display : 1.4\" LCD <br>\r\n• Sensor : 6 -axis sensor: \"\"3-axis accelerometer dan 3-axis gyroscope\"\"\r\nSensor Detak Jantung: L-Sensor <br>\r\n• Sports : outdoor running, walking, cycling, indoor running, pool swimming, exercise, indoor cycling, elliptical machine, skipping rope, yoga, rowing machine <br>\r\n• Battery Capacity : 230 mAh, magnetic charging', 999000, 899000, '2021-08-08 12:14:21'),
(27, 3, 5, 'Mi Watch', 'mibegie.png', 'miblack.png', 'minavy blue.png', '• Display : 1.39\" AMOLED <br>\r\n• Sensor : Sensor detak jantung, Sensor akselerasi, Gyroscope,\r\nSensor Geomagnetik, Baraceptor, Sensor cahaya sekitar, SpO2 <br>\r\n• Sports : 117 Indoor Outdoor Sports Mode<br>\r\n• Battery Capacity : 420mAh, magnetic charging', 1799000, 1659000, '2021-08-08 12:16:19'),
(28, 3, 6, 'Realme Watch Pro 2', 'realmeWhite.png', 'realmeBlack.png', '', '• Display : 1.75\" LCD <br>\r\n• Sensor : Blood Oxygen & Heart Rate Monitor, Advanced PPG sensor, Real-time Heart Rate Monitor, Blood Oxygen Monitor, IP68 Water Resistant <br>\r\n• Sports : 90 Indoor Outdoor Sports Mode <br>\r\n• Battery Capacity : 14 days long battery life, magnetic charging <br>', 999000, 799000, '2021-08-08 12:16:19'),
(29, 3, 6, 'Realme Watch', 'Realme Watch.png', '', '', '• Display : 1.4\" LCD <br>\r\n• Sensor : 3-axis Accelerometer, Heart Rate Sensor, Rotor Vibration Motor, IP68(1.5m) Water Resistance Rating <br>\r\n• Sports : Outdoor Run, Walk, Indoor Run, Outdoor Cycle, Aerobic Capacity, Strength Training, Football, Basketball, Pingpong, Badminton, Indoor Cycle, Elliptical, Yoga, and Cricket <br>\r\n• Battery Capacity : 160mAh, 9 days long battery life, magnetic charging', 1099000, 999000, '2021-08-08 12:17:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `role` varchar(7) NOT NULL DEFAULT 'member'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`userid`, `email`, `username`, `password`, `alamat`, `role`) VALUES
(2, 'test@gmail.com', 'user', '$2y$10$6DsHr5F1JFDYGDCI2nMTQ.7DOum5rSQEsd.RK1fzN9D4JPLZhiA0m', 'bogor', 'member'),
(4, 'muhamadfaisal280201@gmail.com', 'faisal', '$2y$10$Hronyh50/jOyBNkXCbCyRuF4WA3STW8HkcNu.xFLsCk01YgUnHUQK', 'padurenan 3, bogor', 'admin'),
(5, 'test2@gmail.com', 'user2', '$2y$10$pDymK65cTyDQGpwc5DSk2ekx1wGfMrdBPrX2W88vk7p1DFnIw7IZi', 'Jakarta', 'member'),
(6, 'test3@gmail.com', 'user3', '$2y$10$fQNmwe/IbwG2u99TfRGcWuz3h2ccVDkXHQna3qjVTjbWyhjOtxIKm', 'Bogor', 'member'),
(7, 'test4@gmail.com', 'user4', '$2y$10$Knmwt0tt1GrdFB8AXgKCfuZo4XdPx2J9YPf9Y1Kp1MWKH37SXQFWC', 'Jakarta', 'member'),
(8, 'test5@gmail.com', 'user5', '$2y$10$nsv4DQ7Ne1FX3mR39tr6sONyK2.qRY1yi8ZtE9kX3hsYuYhbwh4W.', 'Sukabumi', 'member'),
(9, 'test6@gmail.com', 'user6', '$2y$10$apj8Z.IWTbLPV0azZpAq3O9/oS8MrZs7qsTD42xMG2JmlKiITokfm', 'Jakarta', 'member'),
(10, 'test7@gmail.com', 'user7', '$2y$10$PDPdzGbME7b9.PIVmaG07eTPDxnSQYXwBehGcQmSUufrlPpDq4XG6', 'Bogor', 'member'),
(11, 'test8@gmail.com', 'user8', '$2y$10$Z7n5epLdJkqD1qBR1SiGMOLzAn8D6svzb8G1avC09ETP2DBRZiwRm', 'Bogor', 'member'),
(12, 'test9@gmail.com', 'user9', '$2y$10$CWtWiRZeMUsaxjaJTbibZuViLdlFU8.Qb3ZNFKxzWoRmBkbH6BXnK', 'Jakarta', 'member'),
(13, 'rafibudisulistio@gmail.com', 'rafi', '$2y$10$WKgzky95IspnMo5v6pDK6emxtYpDRPPMF8aQDOg/RCkq/fCvgMyEC', 'Tangerang', 'admin'),
(14, 'test10@gmail.com', 'tes10', '$2y$10$.0Sz97qPdBjq1l2E4TSGaeZDgrZ6NBrnTi/QFL9rezZjKExAEkZBC', 'bogor', 'member');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`idbrand`);

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`idcart`),
  ADD UNIQUE KEY `orderid` (`orderid`),
  ADD KEY `orderid_2` (`orderid`);

--
-- Indeks untuk tabel `detailorder`
--
ALTER TABLE `detailorder`
  ADD PRIMARY KEY (`detailid`),
  ADD KEY `orderid` (`orderid`),
  ADD KEY `idproduk` (`idproduk`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indeks untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`idkonfirmasi`),
  ADD KEY `userid` (`userid`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`),
  ADD KEY `idkategori` (`idkategori`),
  ADD KEY `idbrand` (`idbrand`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `brand`
--
ALTER TABLE `brand`
  MODIFY `idbrand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `idcart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `detailorder`
--
ALTER TABLE `detailorder`
  MODIFY `detailid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `idkonfirmasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detailorder`
--
ALTER TABLE `detailorder`
  ADD CONSTRAINT `idproduk` FOREIGN KEY (`idproduk`) REFERENCES `produk` (`idproduk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `cart` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `idbrand` FOREIGN KEY (`idbrand`) REFERENCES `brand` (`idbrand`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idkategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

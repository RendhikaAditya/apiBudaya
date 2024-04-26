-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Apr 2024 pada 10.53
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kebudayaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_kebudayaan_bali`
--

CREATE TABLE `data_kebudayaan_bali` (
  `id` int(11) NOT NULL,
  `nama_kebudayaan` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_kebudayaan_bali`
--

INSERT INTO `data_kebudayaan_bali` (`id`, `nama_kebudayaan`, `deskripsi`, `foto`) VALUES
(1, 'Pendet', 'Tarian penyambutan yang dilakukan dengan membawa bunga dalam sebuah wadah kecil yang disebut jauk, kemudian ditaburkan di atas lantai sebagai bentuk rasa syukur kepada dewa.', 'foto_pendet.jpg'),
(2, 'Barong', 'Tarian tradisional Bali yang melibatkan kostum hewan mitologis, seperti Barong yang mewakili kebaikan dan Rangda yang mewakili kejahatan.', 'foto_barong.jpg'),
(3, 'Kecak', 'Tarian yang menggunakan suara \"cak\" yang dihasilkan oleh para penari yang duduk melingkar, menggambarkan cerita dari Ramayana.', 'foto_kecak.jpg'),
(4, 'Legong', 'Tarian klasik Bali yang dianggap sebagai tarian istana, menampilkan gerakan-gerakan halus dan cerita-cerita romantis dari Bali.', 'foto_legong.jpg'),
(5, 'Wayang Kulit', 'Pertunjukan boneka kulit tradisional yang menceritakan cerita-cerita epik seperti Mahabharata dan Ramayana.', 'foto_wayang_kulit.jpg'),
(6, 'Ogoh-ogoh', 'Patung raksasa yang dibuat untuk perayaan Nyepi sebagai simbol pemurnian diri dari kejahatan.', 'foto_ogoh_ogoh.jpg'),
(7, 'Topeng', 'Pertunjukan teater tradisional Bali yang menggunakan topeng untuk menceritakan cerita-cerita mitologi dan sejarah.', 'foto_topeng.jpg'),
(8, 'Rejang', 'Tarian sakral yang dilakukan oleh para penari wanita dengan gerakan-gerakan yang lemah gemulai, seringkali sebagai bagian dari upacara keagamaan.', 'foto_rejang.jpg'),
(9, 'Gamelan', 'Ansambel musik tradisional Bali yang terdiri dari berbagai instrumen seperti gong, kendang, suling, dan metalofon.', 'foto_gamelan.jpg'),
(10, 'Janger', 'Tarian pergaulan yang dilakukan oleh para pemuda dan pemudi dengan gerakan yang ceria dan penuh semangat.', 'foto_janger.jpg'),
(11, 'Pengibing', 'Upacara kematian tradisional Bali yang melibatkan persembahan makanan dan minuman kepada roh yang meninggal.', 'foto_pengibing.jpg'),
(12, 'Ngedebong', 'Upacara tradisional yang dilakukan setelah selesai panen sebagai bentuk rasa syukur kepada dewa.', 'foto_ngedebong.jpg'),
(13, 'Tumpek Wayang', 'Upacara penghormatan kepada dewa dalam bentuk pertunjukan wayang kulit sebagai rasa syukur atas keselamatan dan keberlimpahan.', 'foto_tumpek_wayang.jpg'),
(14, 'Tumpek Uduh', 'Upacara yang dilakukan untuk memberkati tanaman-tanaman pertanian seperti padi dan buah-buahan.', 'foto_tumpek_uduh.jpg'),
(15, 'Tumpek Krulut', 'Upacara penghormatan kepada alat-alat musik tradisional Bali, seperti gamelan, sebagai rasa syukur atas keberadaan seni dan budaya.', 'foto_tumpek_krulut.jpg'),
(16, 'Tumpek Landep', 'Upacara yang dilakukan untuk memberkati senjata-senjata tradisional dan perkakas tani.', 'foto_tumpek_landep.jpg'),
(17, 'Tumpek Kandang', 'Upacara yang dilakukan untuk memberkati hewan ternak, seperti sapi, kambing, dan ayam.', 'foto_tumpek_kandang.jpg'),
(18, 'Tumpek Pengatag', 'Upacara yang dilakukan untuk memberkati alat-alat pertanian dan perkebunan, seperti cangkul, sabit, dan keranjang.', 'foto_tumpek_pengatag.jpg'),
(19, 'Tumpek Wayang', 'Upacara yang dilakukan untuk memberkati segala macam peralatan dan benda-benda yang terkait dengan seni dan budaya Bali.', 'foto_tumpek_sanghyang.jpg'),
(20, 'Tumpek Wariga', 'Upacara yang dilakukan untuk memberkati tanaman-tanaman obat dan rempah-rempah.', 'foto_tumpek_wariga.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sejarawan`
--

CREATE TABLE `sejarawan` (
  `id` int(11) NOT NULL,
  `nama_sejarawan` varchar(100) DEFAULT NULL,
  `foto_sejarawan` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `asal` varchar(100) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_galeri`
--

CREATE TABLE `tb_galeri` (
  `id_galeri` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_galeri`
--

INSERT INTO `tb_galeri` (`id_galeri`, `foto`) VALUES
(1, '1.jpg'),
(2, '2.jpg'),
(3, '3.jpg'),
(4, '4.jpg'),
(5, '5.jpg'),
(6, '6.jpg'),
(7, '7.jpg'),
(8, '8.jpg'),
(9, '9.jpg'),
(10, '10.jpg'),
(11, '11.jpg'),
(12, '12.jpg'),
(13, '13.jpg'),
(14, '14.jpg'),
(15, '15.jpg'),
(16, '16.jpg'),
(17, '17.jpg'),
(18, '18.jpg'),
(19, '19.jpg'),
(20, '20.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(255) DEFAULT NULL,
  `alamat_user` varchar(255) DEFAULT NULL,
  `nohp_user` varchar(15) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama_user`, `alamat_user`, `nohp_user`, `username`, `password`) VALUES
(1, 'John Doe', 'Jl. Merdeka No. 123', '081234567890', 'john.doe', '$2y$10$ybI9aKXxK0CBpC1g6hWx9ugaYOuEQtHxpr1rTHh7Uy48xASLsmk0i'),
(2, 'Jane Smith', 'Jl. Jenderal Sudirman No. 456', '082345678901', 'jane.smith', '$2y$10$ybI9aKXxK0CBpC1g6hWx9ugaYOuEQtHxpr1rTHh7Uy48xASLsmk0i'),
(3, 'Ahmad Abdullah', 'Jl. Gatot Subroto No. 789', '083456789012', 'ahmad.abdullah', '$2y$10$ybI9aKXxK0CBpC1g6hWx9ugaYOuEQtHxpr1rTHh7Uy48xASLsmk0i'),
(4, 'Siti Rahayu', 'Jl. Asia Afrika No. 321', '084567890123', 'siti.rahayu', '$2y$10$ybI9aKXxK0CBpC1g6hWx9ugaYOuEQtHxpr1rTHh7Uy48xASLsmk0i'),
(5, 'Budi Santoso', 'Jl. Diponegoro No. 555', '085678901234', 'budi.santoso', '$2y$10$ybI9aKXxK0CBpC1g6hWx9ugaYOuEQtHxpr1rTHh7Uy48xASLsmk0i'),
(6, 'Rendhika aditya', 'padng', '082112211', 'aditya', '$2y$10$oc/6YP80X7gtsXp3AwKSRugIhtHkFrt.mbp4R8cb9lP57LZt9Zl2C'),
(7, 'Yulianti', 'pekanbaru', '081266673375', 'yuli', '$2y$10$jwRKIsXcG5r4ibXxKaJVFulOQW1Rxo2khTMF0cit4uEPbf6/8JorW');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_kebudayaan_bali`
--
ALTER TABLE `data_kebudayaan_bali`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sejarawan`
--
ALTER TABLE `sejarawan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_kebudayaan_bali`
--
ALTER TABLE `data_kebudayaan_bali`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `sejarawan`
--
ALTER TABLE `sejarawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

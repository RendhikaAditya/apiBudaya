-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2024 at 08:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_edukasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_berita`
--

CREATE TABLE `tb_berita` (
  `id_berita` int(11) NOT NULL,
  `judul_berita` varchar(255) DEFAULT NULL,
  `konten_berita` text DEFAULT NULL,
  `gambar_berita` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_berita`
--

INSERT INTO `tb_berita` (`id_berita`, `judul_berita`, `konten_berita`, `gambar_berita`) VALUES
(1, 'Pembangunan Jalan Tol Baru Dimulai', 'Pemerintah telah memulai pembangunan jalan tol baru yang akan menghubungkan dua kota besar di wilayah tersebut. Proyek ini diharapkan dapat mempercepat arus transportasi dan mengurangi kemacetan.', 'pembangunan_tol.jpg'),
(2, 'Perekonomian Indonesia Menguat di Kuartal Pertama', 'Bank Indonesia melaporkan bahwa perekonomian Indonesia mengalami pertumbuhan yang positif di kuartal pertama tahun ini. Hal ini didukung oleh peningkatan aktivitas perdagangan dan investasi.', 'perekonomian.jpg'),
(3, 'Penemuan Obat Baru untuk Penyakit Langka', 'Sebuah tim peneliti telah berhasil menemukan obat baru yang efektif untuk mengobati penyakit langka yang selama ini sulit diatasi. Penemuan ini diharapkan dapat memberikan harapan baru bagi para penderita.', 'obat_baru.jpg'),
(4, 'Kebakaran Hutan Mengancam Ekosistem', 'Kebakaran hutan yang melanda wilayah tertentu telah mengancam ekosistem dan keanekaragaman hayati di area tersebut. Pemerintah dan relawan sedang berupaya keras untuk memadamkan api dan menyelamatkan flora dan fauna yang terancam.', 'kebakaran_hutan.jpg'),
(5, 'Peluncuran Produk Teknologi Terbaru', 'Perusahaan teknologi terkemuka telah meluncurkan produk terbarunya yang diklaim akan mengubah cara kita berinteraksi dengan teknologi. Produk ini diharapkan dapat memberikan pengalaman baru kepada penggunanya.', 'produk_teknologi.jpg'),
(6, 'Peringatan Hari Lingkungan Sedunia', 'Hari Lingkungan Sedunia diperingati secara global dengan tema perlindungan hutan. Berbagai acara dan kampanye dilakukan untuk meningkatkan kesadaran akan pentingnya menjaga lingkungan hidup bagi keberlangsungan generasi mendatang.', 'hari_lingkungan.jpg'),
(7, 'Tren Fashion Musim Panas 2024', 'Desainer terkenal telah mengungkapkan tren fashion musim panas tahun ini yang diprediksi akan mendominasi pasar. Pakaian dengan warna cerah dan motif alami menjadi pilihan utama untuk gaya santai dan stylish.', 'tren_fashion.jpg'),
(8, 'Penelitian Terbaru Tentang Kesehatan Mental', 'Studi terbaru menunjukkan bahwa kesehatan mental semakin menjadi perhatian utama di tengah masyarakat. Penelitian ini mengungkapkan pentingnya dukungan sosial dan akses terhadap layanan kesehatan mental yang memadai.', 'kesehatan_mental.jpg'),
(9, 'Inovasi Baru dalam Dunia Pendidikan', 'Sebuah lembaga pendidikan telah mengumumkan inovasi baru dalam metode pengajaran yang bertujuan untuk meningkatkan keterampilan dan minat belajar siswa. Program ini diharapkan dapat memberikan pendekatan yang lebih interaktif dan efektif dalam proses pembelajaran.', 'inovasi_pendidikan.jpg'),
(10, 'Pembukaan Restoran Ramah Lingkungan', 'Sebuah restoran baru dibuka dengan konsep ramah lingkungan, menggunakan bahan-bahan organik dan mengurangi penggunaan plastik sekali pakai. Inisiatif ini mendapat sambutan positif dari masyarakat yang peduli akan kelestarian lingkungan.', 'restoran_ramah_lingkungan.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_galeri`
--

CREATE TABLE `tb_galeri` (
  `id_galeri` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_galeri`
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
-- Table structure for table `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `no_bp` varchar(20) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_pegawai`
--

INSERT INTO `tb_pegawai` (`id_pegawai`, `nama`, `no_bp`, `no_hp`, `email`, `created_date`) VALUES
(1, 'Agus Wibowo', 'BP001', '081234567890', 'aguswibowo@example.com', '2024-03-11 10:02:51'),
(2, 'Nurulfitriani', 'BP002', '082345678901', 'nurulfitriani@example.com', '2024-03-11 10:02:51'),
(3, 'Andreasputra', 'BP003', '083456789012', 'andreasputra@example.com', '2024-03-11 10:02:51'),
(4, 'Novitawidjaja', 'BP004', '084567890123', 'novitawidjaja@example.com', '2024-03-11 10:02:51'),
(5, 'Dewifitriani', 'BP005', '085678901234', 'dewifitriani@example.com', '2024-03-11 10:02:51'),
(6, 'Rendyprasetyo', 'BP006', '086789012345', 'rendyprasetyo@example.com', '2024-03-11 10:02:51'),
(7, 'Sitisofia', 'BP007', '087890123456', 'sitisofia@example.com', '2024-03-11 10:02:51'),
(8, 'Budiwijaya', 'BP008', '088901234567', 'budiwijaya@example.com', '2024-03-11 10:02:51'),
(9, 'Indahlestari', 'BP009', '089012345678', 'indahlestari@example.com', '2024-03-11 10:02:51'),
(10, 'Rahmawanagus', 'BP010', '081123456789', 'rahmawanagus@example.com', '2024-03-11 10:02:51'),
(11, 'Tia Handayani', 'BP011', '082234567890', 'tiahandayani@example.com', '2024-03-11 10:02:51'),
(12, 'Muhajirriza', 'BP012', '083345678901', 'muhajirriza@example.com', '2024-03-11 10:02:51'),
(13, 'Deviafriani', 'BP013', '084456789012', 'deviafriani@example.com', '2024-03-11 10:02:51'),
(14, 'Antonwijaya', 'BP014', '085567890123', 'antonwijaya@example.com', '2024-03-11 10:02:51'),
(15, 'Aisyahnur', 'BP015', '086678901234', 'aisyahnur@example.com', '2024-03-11 10:02:51'),
(16, 'Nandasaputra', 'BP016', '087789012345', 'nandasaputra@example.com', '2024-03-11 10:02:51'),
(17, 'Suliswanto', 'BP017', '088890123456', 'suliswanto@example.com', '2024-03-11 10:02:51'),
(18, 'Sariayu', 'BP018', '089901234567', 'sariayu@example.com', '2024-03-11 10:02:51'),
(19, 'Wulandari', 'BP019', '081012345678', 'wulandari@example.com', '2024-03-11 10:02:51'),
(20, 'Anggunita', 'BP020', '081112345678', 'anggunita@example.com', '2024-03-11 10:02:51');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
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
-- Dumping data for table `tb_user`
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
-- Indexes for table `tb_berita`
--
ALTER TABLE `tb_berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indexes for table `tb_galeri`
--
ALTER TABLE `tb_galeri`
  ADD PRIMARY KEY (`id_galeri`);

--
-- Indexes for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD UNIQUE KEY `no_bp` (`no_bp`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_berita`
--
ALTER TABLE `tb_berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_galeri`
--
ALTER TABLE `tb_galeri`
  MODIFY `id_galeri` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

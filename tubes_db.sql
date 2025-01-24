-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jan 2025 pada 20.03
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tubes_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `departemen`
--

CREATE TABLE `departemen` (
  `id` int(11) NOT NULL,
  `nama_departemen` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `departemen`
--

INSERT INTO `departemen` (`id`, `nama_departemen`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', '2025-01-16 04:55:10', '2025-01-16 04:55:10'),
(2, 'Backend', '2025-01-16 04:55:10', '2025-01-16 04:55:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `golongan`
--

CREATE TABLE `golongan` (
  `id` int(11) NOT NULL,
  `nama_golongan` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `golongan`
--

INSERT INTO `golongan` (`id`, `nama_golongan`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', '2025-01-16 04:54:35', '2025-01-16 04:54:35'),
(2, 'Grade 1', '2025-01-16 04:54:35', '2025-01-16 04:54:35'),
(3, 'Grade 2', '2025-01-16 04:54:56', '2025-01-16 04:54:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `izin_cuti`
--

CREATE TABLE `izin_cuti` (
  `id` int(11) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `tipe` enum('izin','cuti') DEFAULT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `alasan` text NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `izin_cuti`
--

INSERT INTO `izin_cuti` (`id`, `karyawan_id`, `tipe`, `tanggal_mulai`, `tanggal_selesai`, `alasan`, `status`, `createdAt`, `updatedAt`) VALUES
(5, 4, 'izin', '2025-01-20', '2025-02-20', 'Izin meeting dengan client di paskal hypersquare', 1, '2025-01-16 07:15:05', '2025-01-16 07:25:57'),
(6, 4, 'cuti', '2025-02-01', '2025-04-01', 'Cuti Melahirkan', 1, '2025-01-16 07:15:41', '2025-01-16 07:25:44'),
(7, 4, 'izin', '2025-01-17', '2025-01-17', 'Mengantar orang tua ke rumah sakit', 1, '2025-01-17 08:45:38', '2025-01-17 14:31:06'),
(8, 4, 'cuti', '2025-02-01', '2025-03-31', 'Cuti Mancing ke alaska', 0, '2025-01-17 08:47:12', '2025-01-17 14:26:15'),
(9, 2, 'cuti', '2025-03-01', '2025-04-01', 'Cuti Mau bor minyak', 1, '2025-01-17 09:29:52', '2025-01-21 13:37:52'),
(10, 3, 'cuti', '2025-03-01', '2025-04-01', 'Cuti Mau bor minyak', 0, '2025-01-17 09:31:34', '2025-01-17 15:04:17'),
(11, 4, 'cuti', '2025-01-31', '2025-02-07', 'Cuti Bakar US', 0, '2025-01-17 14:32:04', '2025-01-17 14:33:37'),
(12, 4, 'izin', '2025-01-29', '2025-01-30', 'izin apel', 1, '2025-01-17 14:38:10', '2025-01-24 18:06:45'),
(13, 5, 'izin', '2025-01-24', '2025-01-25', 'Izin maen genshin impact', NULL, '2025-01-17 14:46:40', '2025-01-17 14:46:40'),
(14, 3, 'izin', '2025-01-18', '2025-01-18', 'Melakukan survey kopi di cikole', NULL, '2025-01-17 15:05:04', '2025-01-17 15:05:04'),
(15, 2, 'izin', '2025-01-21', '2025-01-21', 'nonton yb livestream', 0, '2025-01-21 13:48:54', '2025-01-24 18:53:25'),
(16, 4, 'cuti', '2025-01-25', '2025-01-26', 'Turnament Mobile Legend', NULL, '2025-01-24 17:58:25', '2025-01-24 17:58:25'),
(17, 4, 'izin', '2025-01-26', '2025-01-26', 'Mengantar anak pembagian rapot', 1, '2025-01-24 18:39:39', '2025-01-24 18:43:20'),
(18, 4, 'cuti', '2025-02-01', '2025-02-08', 'Cuti Liburan', 0, '2025-01-24 18:40:26', '2025-01-24 18:43:41'),
(19, 3, 'izin', '2025-01-29', '2025-01-29', 'Izin mengantar anak ke rumah sakit', 1, '2025-01-24 18:46:18', '2025-01-24 18:49:03'),
(20, 2, 'cuti', '2025-01-31', '2025-02-01', 'Izin nonton konser', NULL, '2025-01-24 18:47:02', '2025-01-24 18:47:02'),
(21, 6, 'izin', '2025-01-25', '2025-01-25', 'izin ga masuk karena acara keluarga', NULL, '2025-01-24 18:51:12', '2025-01-24 18:51:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL,
  `nama_jabatan` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`id`, `nama_jabatan`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', '2025-01-16 04:53:33', '2025-01-16 04:53:33'),
(2, 'Karyawan', '2025-01-16 04:53:33', '2025-01-16 04:53:33'),
(3, 'Supervisor', '2025-01-16 04:53:56', '2025-01-16 04:53:56'),
(4, 'Manager', '2025-01-16 04:53:56', '2025-01-16 04:53:56'),
(5, 'Human Resource Development', '2025-01-21 12:36:16', '2025-01-21 12:36:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `karyawan_id` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `no_telp` varchar(255) DEFAULT NULL,
  `tanggal_mulai_kerja` datetime NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `golongan_id` int(11) NOT NULL,
  `departemen_id` int(11) NOT NULL,
  `status_karyawan` enum('aktif','nonaktif') NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id`, `karyawan_id`, `nama_lengkap`, `username`, `password`, `email`, `no_telp`, `tanggal_mulai_kerja`, `jabatan_id`, `golongan_id`, `departemen_id`, `status_karyawan`, `photo`, `createdAt`, `updatedAt`) VALUES
(1, 'f31149bb-63f7-49d3-b391-8156bde5fb2f', 'admin', 'admin', '$argon2id$v=19$m=65536,t=3,p=4$EervUVxasf5woGl6JPclmQ$7GmUDgVp+XoSo+isyUBT0r3ZZyxJCLwHJVKd7/RQa04', 'admin@gmail.com', '081223827029', '2024-11-04 17:00:00', 1, 1, 1, 'aktif', NULL, '2025-01-16 03:57:18', '2025-01-16 03:57:18'),
(2, '090d8a0f-0816-474d-bd46-01821d2f4c40', 'Thoriq Hidayansyah', 'thoriquee', '$argon2id$v=19$m=65536,t=3,p=4$D2q3p6lxRXi/9WmD+N0U6Q$QoZbDF22baOjB7wiamWw3opF6JDJvBVjBXGcScHNMoo', 'toriq.mailbox@gmail.com', '081223827029', '2025-01-16 00:00:00', 4, 3, 2, 'aktif', NULL, '2025-01-16 04:00:15', '2025-01-16 04:00:15'),
(3, 'ec9cbf94-10cd-472e-aa54-37fa0a0f7e73', 'Christianto Tri Arthurito', 'arthur', '$argon2id$v=19$m=65536,t=3,p=4$N3EQS/eCksAmNqmeKz7EYg$FR+1xrue4H4gG3KbB5v1PiBCtbtzGMjQQMFbiFajEB8', 'arthur@gmail.com', '081223827029', '2025-01-16 00:00:00', 3, 2, 2, 'aktif', NULL, '2025-01-16 04:00:55', '2025-01-16 04:00:55'),
(4, 'fd340cb3-5d83-418c-aba1-0379b00a62c3', 'Fabio Jovancha', 'fabio', '$argon2id$v=19$m=65536,t=3,p=4$apwUxPs8cjhIrbZKxBnhMw$5rLmmD3R4g6u4Xsqoc/6/Qs8woeED3ovUPSbBRupX00', 'fabio@gmail.com', '081223827029', '2025-01-16 00:00:00', 2, 2, 2, 'aktif', NULL, '2025-01-16 04:01:44', '2025-01-16 04:01:44'),
(5, '52966c7e-b862-48e3-ae3e-fa8e80fbd6a5', 'Raafi Septyanto', 'bobi', '$argon2id$v=19$m=65536,t=3,p=4$LWzp1X7uOAllhRsJTkz23w$hTzCXpQRaAtodAKW7u9m/R8LpXB9mIyPJ6BqLjOUaiI', 'bobi@gmail.com', '081223827029', '2025-01-17 00:00:00', 2, 3, 2, 'aktif', NULL, '2025-01-17 14:46:14', '2025-01-17 14:46:14'),
(6, '0d6435e1-cf5d-49d7-aa18-0b2996d7f091', 'Youka', 'youka', '$argon2id$v=19$m=65536,t=3,p=4$2GKHtPSmReIduyGFLzxpfw$a6HBqjnqGQH0Or4XKD3zbN43xTh7tRE3+JMH8CBJCqU', 'youka@gmail.com', '081223827029', '2025-01-21 00:00:00', 5, 3, 2, 'aktif', NULL, '2025-01-21 12:36:58', '2025-01-21 12:36:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensi`
--

CREATE TABLE `presensi` (
  `id` int(11) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `tanggal` int(11) NOT NULL,
  `bulan` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `waktu_masuk` time NOT NULL,
  `waktu_keluar` time DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `presensi`
--

INSERT INTO `presensi` (`id`, `karyawan_id`, `tanggal`, `bulan`, `tahun`, `waktu_masuk`, `waktu_keluar`, `createdAt`, `updatedAt`) VALUES
(1, 4, 16, 1, 2025, '11:02:08', '11:02:11', '2025-01-16 04:02:08', '2025-01-16 04:02:11'),
(2, 3, 16, 1, 2025, '11:02:36', '11:02:37', '2025-01-16 04:02:36', '2025-01-16 04:02:37'),
(3, 2, 16, 1, 2025, '11:02:58', '11:03:00', '2025-01-16 04:02:58', '2025-01-16 04:03:00'),
(4, 2, 16, 1, 2025, '11:25:17', '11:25:18', '2025-01-16 04:25:17', '2025-01-16 04:25:18'),
(5, 4, 16, 1, 2025, '13:48:14', '13:48:16', '2025-01-16 06:48:14', '2025-01-16 06:48:16'),
(6, 2, 24, 1, 2025, '23:01:18', '23:01:20', '2025-01-24 16:01:18', '2025-01-24 16:01:20'),
(7, 4, 25, 1, 2025, '00:57:46', '00:57:48', '2025-01-24 17:57:46', '2025-01-24 17:57:48'),
(8, 4, 25, 1, 2025, '01:38:15', '01:38:16', '2025-01-24 18:38:15', '2025-01-24 18:38:16'),
(9, 3, 25, 1, 2025, '01:41:10', '01:41:13', '2025-01-24 18:41:10', '2025-01-24 18:41:13'),
(10, 2, 25, 1, 2025, '01:44:21', '01:44:22', '2025-01-24 18:44:21', '2025-01-24 18:44:22'),
(11, 6, 25, 1, 2025, '01:49:39', '01:49:41', '2025-01-24 18:49:39', '2025-01-24 18:49:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`sid`, `expires`, `data`, `createdAt`, `updatedAt`) VALUES
('-7vDgfoljq2frrZMKu-zIZCooDW24bfG', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('-eS2D-N-tmgHX2Rst-VNxVXlHxmG2Cbf', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('-LCmaIphRyguk0ssMwMtMzWX_gUVmaX4', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('-nH2kXNGISREiwDG98DVkq2qOvwHATF5', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('-pZ1HVjlbYN3ge4NlQ944FO2AB83fN-a', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('0jcWbjKNvXIRSvBi3xT6v-aCk0CMvjZx', '2025-01-25 18:45:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:01', '2025-01-24 18:45:01'),
('0nEWwXepSTCKc5SzG6FWC-m69DcpHWlR', '2025-01-25 18:50:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:30', '2025-01-24 18:50:30'),
('0NTwisscw9Boi3GCaSy2IvfVNGtvNMQ6', '2025-01-25 16:01:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:54', '2025-01-24 16:01:54'),
('0p52rEb_4Ln4D9ZG6QvR0Oxvj7KuHGT5', '2025-01-25 18:45:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:29', '2025-01-24 18:45:29'),
('0snZtNOAYNRXlkg3GK1fEmmPdbdkhRXq', '2025-01-25 18:50:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:17', '2025-01-24 18:50:17'),
('0X4jpbtVP3-mm7nmQEpre6mH4b3-IkWQ', '2025-01-25 18:49:39', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:39', '2025-01-24 18:49:39'),
('0X_aSDSSIE84Kg2rSeBYKTx4RrdS3Nhz', '2025-01-25 16:01:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:55', '2025-01-24 16:01:55'),
('0zlQJFYjCR213ezozKJXM3hDmFznYRRe', '2025-01-25 18:37:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:37:31', '2025-01-24 18:37:31'),
('0Z_mqPWrETsasBXfJwZhGx_Lu1HubmZm', '2025-01-25 18:45:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:29', '2025-01-24 18:45:29'),
('1F6o-5TmDbxR5HRLmqPwlo5lcGVqAy2I', '2025-01-25 18:28:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:28:17', '2025-01-24 18:28:17'),
('1KlkrkWlwNR3yyeK1v5E1JZFmNJ4Bgg-', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('1pjGOvHl3lEi9-EbXluBWtH9GL0rGBhU', '2025-01-25 18:45:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:30', '2025-01-24 18:45:30'),
('1u6ySsOCm1GqB0WPAfch659ItgfCweRG', '2025-01-25 18:51:12', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:51:12', '2025-01-24 18:51:12'),
('2fOSzRFDNowssC3UrJ-A0J2-5yRRLthM', '2025-01-25 16:01:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:54', '2025-01-24 16:01:54'),
('2IqYRcnZ_bgfXs_-J4JOxTz1KYcESVGq', '2025-01-25 18:01:12', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:01:12', '2025-01-24 18:01:12'),
('2kD_hDmBDcXXRoy6Q1BcFAq7yst9pAf3', '2025-01-25 18:35:36', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:35:36', '2025-01-24 18:35:36'),
('2NAW6HDCJJuqqhAtQO7xQQPQiAjDKi8p', '2025-01-25 18:50:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:17', '2025-01-24 18:50:17'),
('2UNMkZKQ90SnnXxmUblWbYzdpCg931wr', '2025-01-25 18:40:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:40:26', '2025-01-24 18:40:26'),
('2vw3YUxCKYhDPqh8pet6NkIVOjXyUmFW', '2025-01-25 17:57:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:26', '2025-01-24 17:57:26'),
('2YVIN_c5nMlmncO4fnemImBpjNAtP0vG', '2025-01-25 15:59:33', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 15:59:33', '2025-01-24 15:59:33'),
('366nSTSzuQ0Rp0nIOFZi904Hk5v3jFob', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('3bA81LciHLzv0pl5Ekuso6QyBPqD6GN1', '2025-01-25 18:45:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:01', '2025-01-24 18:45:01'),
('3f9ZOw0pzUMnGa0FRk9EsA1udzVnblDW', '2025-01-25 16:02:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:02:18', '2025-01-24 16:02:18'),
('3FIF3Ad6p2y5yV7_LM7cLSQe7UUe2ATP', '2025-01-25 18:47:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:47:02', '2025-01-24 18:47:02'),
('3PehoANp76mYpk-EUYi1e117BeINbds2', '2025-01-25 18:44:21', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:21', '2025-01-24 18:44:21'),
('3U-9LOIYHa-Ndevnzz76Wg-xAaGmHO10', '2025-01-25 18:49:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:20', '2025-01-24 18:49:20'),
('3yBVwORIZH1DTETcGq9oFj3RGkBw0Avs', '2025-01-25 18:28:07', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:28:07', '2025-01-24 18:28:07'),
('4BU9HvKkFIjdXnY6BzJecxb2uKVnql0N', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('4R54y0Na3-QbPr0dEP7l3C9ehSNl7yuS', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('4raPaeqUIV0hWBtb4CU95cHU6FbCFxi2', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('4uXmdXR1yCVfgHo-sMKLuIRIvALYufhb', '2025-01-25 18:38:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:15', '2025-01-24 18:38:15'),
('52ynB21Ee0WUT1nvc2rniCeSaXllHFjH', '2025-01-25 18:50:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:29', '2025-01-24 18:50:29'),
('5688VmAWUGpFLJGAmRrEGjdwqW-eWunL', '2025-01-25 18:50:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:16', '2025-01-24 18:50:16'),
('5xSH9ZTeN_yhxb8yO8sl7Cvg1mC7mdvV', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('6gqjoQ3WtSKn9CyroXasMTD-ANK_sB8v', '2025-01-25 18:50:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:29', '2025-01-24 18:50:29'),
('6g_HJ15_w7LCWMWQmpx-iGTZ-Nxa0Se7', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('6krO3x_BCm5vfVuhZAO-RGgmY96qqbzI', '2025-01-25 18:08:48', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:08:48', '2025-01-24 18:08:48'),
('6uNuA4yNN86PPG2KT2dSEFojWhZLMJ8B', '2025-01-25 18:45:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:02', '2025-01-24 18:45:02'),
('7lrZMmfNuyQt3h28lTJqbZJnGLUhQG6Q', '2025-01-25 18:50:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:30', '2025-01-24 18:50:30'),
('7UXqlTTyAFOr_SjwmPcJdYyinPvIZMmY', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('8CPbMn1cvl3Evem8zN5Sy5hMrCeJ1NSA', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('96Vj8e1PgB4NU8cXfT6knzLUd3ejlZzV', '2025-01-25 18:40:51', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:40:51', '2025-01-24 18:40:51'),
('9lgVtFXPRVVI-nWNiaVFkBxj3oxXiiX7', '2025-01-25 16:01:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:54', '2025-01-24 16:01:54'),
('9oBSWKuLTmBX7ogCa4GiD_-70P8InY9r', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('9pYRzluwluAYrgO5guscUr7DE7vsobsD', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('9z-xhOsAma0rWLb2AtjqqWHf8B0B76HZ', '2025-01-25 16:01:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:55', '2025-01-24 16:01:55'),
('a-W7u8W7xGJuNhBPqOx1reYy8zA_J58n', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('a8jJ_ALAFbpuUozB_crnyZ3td0gmf8W5', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('a9Yc_lVQaic3A8iaKRS10NP_Lu7qz3db', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('AAZ11X8UATvcsN67YmnDN4aK8w0BeyCM', '2025-01-25 18:44:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:08', '2025-01-24 18:44:08'),
('adMHR81DvB8Kjj90qMP94sU5auFRgfs_', '2025-01-25 18:50:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:30', '2025-01-24 18:50:30'),
('AFJMzyLOoqEDwk64X2Re8I-6395IL-Z5', '2025-01-25 18:50:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:30', '2025-01-24 18:50:30'),
('AL6Sud7BP9J5-7mLKp5R910pFbYD1qzo', '2025-01-25 16:01:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:54', '2025-01-24 16:01:54'),
('aMnTM0mOyU04zuwrXVY07eJFuAne7qG6', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('AoLZRgBnMoWiMs4LjqDV5cT2v3e4Rhee', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('apoRzEEO7u2X9FBb363wQkOIw9vXs-fv', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('aSddHpzap8Km8NYIFqz5UvYlUt-6hRL4', '2025-01-25 18:37:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:37:18', '2025-01-24 18:37:18'),
('aWeUcaRyys4v5GdbqW16hd2Wmc9VvX4s', '2025-01-25 17:55:28', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:55:28', '2025-01-24 17:55:28'),
('AWk1sunYgaDt-QdRFoTfW6VK05Sbq66M', '2025-01-25 18:02:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:02:43', '2025-01-24 18:02:43'),
('axVy0p95-aVVj3hS4Qsf0Ex3X3zcWraa', '2025-01-25 18:09:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:09:05', '2025-01-24 18:09:05'),
('A_zGbSw7pIHAFhddemJ-QKS-YDlKKz97', '2025-01-25 18:36:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:36:26', '2025-01-24 18:36:26'),
('b5gwh9PJISL9sHbNt1XB62JJJjF5YqQa', '2025-01-25 18:50:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:29', '2025-01-24 18:50:29'),
('BA3zyz61qp7MXbLA9OW5nAe16kvi60SB', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('bB9SUpzsVmnAXHrXWlgnM6XeQ92pfxTw', '2025-01-25 18:50:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:30', '2025-01-24 18:50:30'),
('BeYeMOwxbMY4E4kUe9wBz-KuK3wIm-TP', '2025-01-25 18:55:33', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:55:33', '2025-01-24 18:55:33'),
('biQdjdTutYKhaJ_G_WCB7w8fHlNqyQck', '2025-01-25 16:01:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:55', '2025-01-24 16:01:55'),
('bNu72mZNc6CeqVKR-iOaJDqYIKZw3s_v', '2025-01-25 18:34:11', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:34:11', '2025-01-24 18:34:11'),
('BOwuVLpv8fF5X5mJ8izQa49S-LK0clO1', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('BStqgbPBLGMjjclmcp7Pc1MAc-CY155z', '2025-01-25 18:50:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:16', '2025-01-24 18:50:16'),
('bWx3BigCJuhSOYVbPNTGJZ_cfvq_luWs', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('bZuZCrnKhhNOUiojCAbMUWzU5a1JtIRx', '2025-01-25 16:01:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:55', '2025-01-24 16:01:55'),
('c5hXvPiEMHTA9JE01ahlblWYdMzRhrz2', '2025-01-25 18:27:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:27:40', '2025-01-24 18:27:40'),
('c6H5Lk2hvwm8mJQjiH-0Dh83fLXOCNJE', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('CbIAnAi6nGiWwOME3iljt6uXdgAGZDQP', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('CCmYvQ-10JT5wv7BVYWFIDqSWClhF2cu', '2025-01-25 18:45:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:01', '2025-01-24 18:45:01'),
('ckwPTXIXTQcYHAp0QpjEkIKsNr5vgf3n', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('Clv1uxXsD5Y0lbW4b3VKTvogHzhokhVL', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('CMiGWANnrHF29KOqqSC0pALZ3BP3Dda_', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('CnJHuHyqXprAkGIP5f7h51Km69zqO3ZE', '2025-01-25 18:50:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:30', '2025-01-24 18:50:30'),
('CQEyru6EizgmNuiaYnNj1H9qyeuHobDZ', '2025-01-25 16:01:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:55', '2025-01-24 16:01:55'),
('CsDW4bJGb67w0KCcsNVU9Xl66rIT4FG2', '2025-01-25 18:50:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:29', '2025-01-24 18:50:29'),
('CslkEDHpT3lrdg8O91AoUMf1YSsSd3T9', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('cTYqYYbxXY7JmaeBWLIrwo1lrn1guszC', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('d0Zbt7TommQBbhZQdlO5i9Yzm8-HLdxJ', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('d1vQAqkwCcJRFtJ3OiyjbLNTTCXJXBoZ', '2025-01-25 19:00:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 19:00:17', '2025-01-24 19:00:17'),
('d2WE4LwELedwtKNJGCM8352Fb5BVpF9Z', '2025-01-25 18:46:32', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:46:32', '2025-01-24 18:46:32'),
('DcFAzvYcNca7Elkk2Ditvr_gWx5Y8o-6', '2025-01-25 18:36:39', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:36:39', '2025-01-24 18:36:39'),
('ddPng0sGUrg6Sv9bJ6jTY1urcgtfE4zl', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('dmQqDLwK6ya4hQVnGhzJJlx7KCXwitD1', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('DojpD0dxB2ohS8HiJMIlsLcTlA1K-EKV', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('Dusx2WNdTYdpWvQ9lJ1xTEffbHdCA9yZ', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('dVMIxBfQIQOByBdX43tN-r_cL3p393Zm', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('e32aJ_GBedid5cDWK2sE3GtUpmXMpixC', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('e5rZXEFc6To5BhU__C--Dugz0A9F17dp', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('e7sa0kUmloxaPEmzyxUhUn1B_s5Y2bg0', '2025-01-25 18:06:48', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:06:48', '2025-01-24 18:06:48'),
('EB7KOVNfJ7XpDwL8M70mW8Mepe5lRtmJ', '2025-01-25 18:43:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:43:41', '2025-01-24 18:43:41'),
('EBrC0P4vi3dJtQJ8Rr10sJadErQ2KQry', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('EDFkZmDvE6QfBDprG7hfzvhvCmk70_W6', '2025-01-25 18:45:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:30', '2025-01-24 18:45:30'),
('eDlJtED0_esfxWNmWvj91MRDBj_UO5dl', '2025-01-25 18:50:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:16', '2025-01-24 18:50:16'),
('EEA3Bl3kwOr5WyTuMbQlWP57jxSobD2n', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('EkpmJ57tgYOU4gjEDPGn7_hk9dEtmQ6y', '2025-01-25 18:50:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:17', '2025-01-24 18:50:17'),
('EoMAJhFjaG-at8vSFAsGufNaIPlbEAOy', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('epZPLtcY7SPu-kNm_agINBTNMFj13j4T', '2025-01-25 18:45:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:02', '2025-01-24 18:45:02'),
('eQEeqvMbEHvhnYzCqoQfLcilIW_yzwkH', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('EtssqR8uCw7AwBQ8IR5YasdzPHEyrQq1', '2025-01-25 18:45:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:30', '2025-01-24 18:45:30'),
('eVhp-1ZoS0OoEjuWnqjbPs6IFPr1Li3z', '2025-01-25 16:01:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:55', '2025-01-24 16:01:55'),
('eW5UuFEmJag0iio7zXSnu3SIuwtajCI7', '2025-01-25 18:50:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:43', '2025-01-24 18:50:43'),
('ewbYtbe88ANKalEc-bs4WTKL2ZeA7Hzv', '2025-01-25 18:39:39', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:39:39', '2025-01-24 18:39:39'),
('eWJ_eB-M7exf6BPFtptCvB_Ma5yv0WPD', '2025-01-25 18:50:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:16', '2025-01-24 18:50:16'),
('eXWJ0I_ej9sGogi-8RzmFvaLXFgzE5jv', '2025-01-25 18:45:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:01', '2025-01-24 18:45:01'),
('EZlRZVdiQr2tUEVlYBkIU9DDVt2HaTm_', '2025-01-25 18:45:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:30', '2025-01-24 18:45:30'),
('F1-gDd5Nnr649TK-QvkQlAEUNQczJ3Xl', '2025-01-25 18:50:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:30', '2025-01-24 18:50:30'),
('F1rLrEVN1KxKewoZtIue3R14QkUqdDOJ', '2025-01-25 18:50:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:16', '2025-01-24 18:50:16'),
('F2DsOoGxntID0BJYBBFJg4eq7scazstX', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('FaUFdP7hs3MbgfoDsadDKb49yxRnYHS2', '2025-01-25 18:49:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:20', '2025-01-24 18:49:20'),
('FEuXcNP1sVKjVFunCiXymZSnvgTzEoLq', '2025-01-25 18:45:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:29', '2025-01-24 18:45:29'),
('fMjIgQjYgUmHJ2Q_Hdz0BTJvCz7HgiLX', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('Fn758xQV3RCq85EP9LIcdt2Ci-8Va-SA', '2025-01-25 18:45:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:30', '2025-01-24 18:45:30'),
('FqFO-Vex-2OfeQiP8-QYinBhAh9eGyZR', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('g6M-lMFM7GkXfnY2QYmiCShUTa6Y6URK', '2025-01-25 18:50:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:30', '2025-01-24 18:50:30'),
('G8ZWXvLqxgr2f8jwW2CcvF6JAChxQ9jl', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('GcVYW6tpagoYzU_4pKuuGO64_nySINKx', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:43', '2025-01-24 18:50:43'),
('gDYDQB3YaGtDIqVY0xYb2E9URFkGaCOq', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('GDyi84JjpDudL1eCE7PoadOWGxPxqIoa', '2025-01-25 18:53:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:53:25', '2025-01-24 18:53:25'),
('giRwwhLBDVNxX6Y0_TYMJjO_fhLlTaQi', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('GIxG2AyPZ79Lk89V9_KsUFfMoaeoUdPz', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('GMjVMrSxLuzyMgBdaYIOBJi1M7-tk0AC', '2025-01-25 18:50:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:43', '2025-01-24 18:50:43'),
('gPMXiX6HTNdQv-GS02S8GW0R7vb7Z6gl', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('GU8Y-ruOKNz5L7tD_KiV_DBU919MLo-0', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('gV51RHl2hvg9Rlx6V5FSK39Mqgp_8xiU', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('gy-aCyZ8cDaLybEsnJHNjJsurRBJAKs6', '2025-01-25 18:45:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:30', '2025-01-24 18:45:30'),
('H6tglxKv8ONcDJjkTloyWwrajIMiIcHH', '2025-01-25 18:37:06', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:37:06', '2025-01-24 18:37:06'),
('h8HvkO4n5Ot5lrCVEW6NFvxIIXZFhZjb', '2025-01-25 16:04:19', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:04:19', '2025-01-24 16:04:19'),
('hA5hUoPo0jH-KvYqQLCYXvrvRz8EU0qC', '2025-01-25 18:50:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:30', '2025-01-24 18:50:30'),
('HdpS_XXChSCD7mLOxJH81dJUAjJhR57c', '2025-01-25 18:50:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:30', '2025-01-24 18:50:30'),
('heEeGmRnrAdQBg45VdqEDHkFTMLH_hH2', '2025-01-25 18:50:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:30', '2025-01-24 18:50:30'),
('HgahDTGJM-6NFOCDXcct27NYDBHlOZsX', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('hH5PYg3QjJ0uwu6SoprQQ_VdnJeNNz4e', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('hIWkU8WbhT1_ul9ImKnC-1ReVCDJQ7sG', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('hMwLAfhTrB2L8n-la_gcTivcRqoFXlOj', '2025-01-25 16:01:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:55', '2025-01-24 16:01:55'),
('hOk7zZ-LtBzCJcoJ-TorF6ejFKnL_l-2', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('HosTqyp5rqvPBkMj3aTEkXTSqoNNwRLt', '2025-01-25 18:45:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:02', '2025-01-24 18:45:02'),
('hoWtmbLs-aXnIGELOi026MKQ5mcj08mK', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('hpG2TUesn46EDg6SYPyyvDkCK5N5Mndk', '2025-01-25 18:45:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:02', '2025-01-24 18:45:02'),
('hqIBL8GQ01OrejUThoYSWg0Cb6xmhl5U', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('hr2zmZM63Ni9HndqDIVRy_lhYu2Rp-uP', '2025-01-25 16:04:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:04:13', '2025-01-24 16:04:13'),
('hrNqp1OHCb83zOT00ATVdqSGRVfRMugd', '2025-01-25 18:37:10', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:37:10', '2025-01-24 18:37:10'),
('HS4t_vx00QXJJakgI8QuYss-5ptL37d9', '2025-01-25 19:00:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 19:00:02', '2025-01-24 19:00:02'),
('htSUNHeATjI7sxhTDrCFNTRt2UTjudYv', '2025-01-25 18:31:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:31:27', '2025-01-24 18:31:27'),
('hTZJciJsLRkpyP53B3nwupFcXivcwTbe', '2025-01-25 18:50:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:30', '2025-01-24 18:50:30'),
('HwRK4BP2y2fYnJYfbLwJs7GBnIdkZX8F', '2025-01-25 18:50:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:16', '2025-01-24 18:50:16'),
('HyDVU6kNwgVM2dp328XAWt_SYe6wLVvL', '2025-01-25 18:50:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:43', '2025-01-24 18:50:43'),
('Hyt0FoOmVSrHn4DeSpo9BXEyByoRmbWl', '2025-01-25 18:46:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:46:24', '2025-01-24 18:46:24'),
('IaEJD6Kj_A5IUKt1eY2iK65MsNWoUzni', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('ICaJ4N9KkJ1HYsFIdA8q3p6jVDumjz2m', '2025-01-25 18:41:10', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:10', '2025-01-24 18:41:10'),
('IDwOr56Nt8inUbKXKegGWUCBZo-N6945', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('igg1V5aJtNmEMGD3XRsWhFDSZEmvV4aI', '2025-01-25 18:45:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:29', '2025-01-24 18:45:29'),
('iinXg7Sk3qOnyrtA6Az4dh6lJnyaTB7Q', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('ijqG_OG6m2UtClBLhZIwXIfkqSxsX0jH', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('Ik7xDGxxezcfcOlyeF1DKAoqHWrvf8sH', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('iKvdPa3-4UyCuTj2s9hNMYUe2_-_zoT7', '2025-01-25 18:02:38', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:02:38', '2025-01-24 18:02:38'),
('ilEkqFaxhCQPpu4rW_YvShgnZj-LKYoQ', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('iMcxm3zFniH2O4hfVmkOE0QN2y6HdqBL', '2025-01-25 18:49:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:20', '2025-01-24 18:49:20'),
('iMNUkr2ca8Ie1UHfLbDCGJ9hZBAjc9rz', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('j-bArbQad39cZM2CSWARz_DvrzJ6NVS_', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('J7YM9A9L7OZblkGKCukwK6h4BkcZRBns', '2025-01-25 18:50:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:16', '2025-01-24 18:50:16'),
('jAwusLRl048wEoRZoUoGUDL3U0cOMxVm', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('ja_R-La9to1WBFsZTWVrqbOJrY_zTe71', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('JGfqdeNs_EA_8kWC5UhFNrurQrv9jed2', '2025-01-25 18:26:36', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:26:36', '2025-01-24 18:26:36'),
('jgR3k-rbtCsIGRmPk--sZMbICkZQ43iA', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('jHtJmxOQZ7ZPhrR3Wl7D6o7v2FgMtVYG', '2025-01-25 18:50:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:29', '2025-01-24 18:50:29'),
('jie3iylzpWTuLfxk7VJ3ofCFj04XqHZN', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('jjfXXs34gnUl_KZMi46OnvJ1uhTNZo76', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('jQamr4o7ZERZ-0eECg5Bt_HCYNm-hp2-', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('Jqzq3D-rvieL6b8EWgqkgA9CRmbs4mTT', '2025-01-25 18:45:51', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:51', '2025-01-24 18:45:51'),
('jrAxOaqAVCzyKmfSH8w84EN3CToqx13n', '2025-01-25 18:43:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:43:20', '2025-01-24 18:43:20'),
('jtxHaUjdrPZ4AtAYQ7nCUOdfmfBIETSK', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('JUoL5gvhC6weGLIbHt2uvUYoFlTrp_m2', '2025-01-25 18:01:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:01:08', '2025-01-24 18:01:08'),
('jWA_j6UvZhLs75NGiefqSNSfaJShBPM3', '2025-01-25 18:45:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:29', '2025-01-24 18:45:29'),
('Jxow-mIb1sXH9xR9j70T59k4RCnENbnA', '2025-01-25 18:02:36', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:02:36', '2025-01-24 18:02:36'),
('j_A0_MPYC9A3u7BL8Z2w042r9ygCT66N', '2025-01-25 18:50:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:16', '2025-01-24 18:50:16'),
('K4BIJtAmWv9yWJE11Yv4KHxwXNIsChmX', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('Kb3U0uTqy3_ZjjhsThFWqb1qGHBRiRiK', '2025-01-25 18:45:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:30', '2025-01-24 18:45:30'),
('KcsOcgIiEV34flWstQCViyCqERiDXUl7', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('KDV_Xj6wcx-VtAf8bLqRjZXnkvUANIHo', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('kQh0pKwpa_9g9UvEYVi6PpAx5GpwNnHI', '2025-01-25 18:45:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:02', '2025-01-24 18:45:02'),
('kScrfRc_BtZe-_CSdKURguol8Ryvjsg2', '2025-01-25 16:01:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:55', '2025-01-24 16:01:55'),
('kSjJpNbpPu6Ka4lMow4ELGAJfGmhYHMk', '2025-01-25 16:01:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:55', '2025-01-24 16:01:55'),
('KSoMYjMvbCWj5_sdDhOi0eGWiSHrK7r6', '2025-01-25 18:08:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:08:54', '2025-01-24 18:08:54'),
('kt86257BuHG9WEqyamZemObcrsct5k14', '2025-01-25 18:34:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:34:59', '2025-01-24 18:34:59'),
('ktIzwkdzNtw-Gnxw_T_B5iDeIZWXOrYl', '2025-01-25 17:57:46', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:46', '2025-01-24 17:57:46'),
('KUc7uj1yv3-SizZeI_I2y6ROp3rEWCgE', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('KVHszJ6JwuPseB_1O3j-ThUCMup8dv6q', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('kWfA8tJkvF_NI_n8irRwkRFBCBK-qMjC', '2025-01-25 18:45:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:02', '2025-01-24 18:45:02'),
('kZQtMHSKxqLt_pwx7m37aC81UaVOAo-h', '2025-01-25 18:45:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:30', '2025-01-24 18:45:30'),
('l2lOx9xU2UfiOrBGfLMeNtYODAD3zR0n', '2025-01-25 18:36:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:36:17', '2025-01-24 18:36:17'),
('l4a3E_dcmxKJom7urjDbZsy2YqdKJUYj', '2025-01-25 18:36:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:36:26', '2025-01-24 18:36:26'),
('l8lM020wODY_GEpO-J9TVSNMieo6zV8K', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('lAFWhgwzoMHqDYYRELLI8SBf3etk8ig5', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('lcKetYIXBms3Wpm4osT4BwIZTvfsc6uZ', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('LClhMOSaUHDRKJpFO3V7sPBoY5kQsXNQ', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('lHZybs1zSDWmcexrBudVX17T2Op3Fw1C', '2025-01-25 18:50:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:16', '2025-01-24 18:50:16'),
('lIKTQTvNiH3OG8YgNqtbS95JZbZMV5Hc', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('ljbOny_W5KIuRfZrtY0rxUoSHUOLrB6T', '2025-01-25 17:56:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:56:40', '2025-01-24 17:56:40'),
('lJt-Osl_CFFG8OgMbYNwvTsY0GJVsoF4', '2025-01-25 18:45:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:01', '2025-01-24 18:45:01'),
('LNOPs5KUwmDYxZubCbJnwqYybBFDReI0', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('LoRKl3wG3_S81wqQYcbAp6Ky7ojcYwE6', '2025-01-25 16:02:56', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:02:56', '2025-01-24 16:02:56'),
('lPmbG3ascOMnQZ-uli4PtMShV3Hn_ww-', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('lrbD99-GdiUlyh1tkAkMpA9jfkCz9jL-', '2025-01-25 18:45:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:01', '2025-01-24 18:45:01'),
('lrV2zeasb4lXjKrA5ESh3DBIRUSeojJ2', '2025-01-25 18:45:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:02', '2025-01-24 18:45:02'),
('lYKD-whQkuyVzNG0Sw8aklUL9Gd20x9_', '2025-01-25 18:45:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:29', '2025-01-24 18:45:29'),
('lZV01ftQI9zOeDj7OIY9Id9k1ysxaSUw', '2025-01-25 17:56:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:56:47', '2025-01-24 17:56:47'),
('lzX0lZW0dyG54NlsX68xq2o0vyVwyuZh', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('M2MCiUIJJrlVg1vyKIbMJTEM5L9pqBDp', '2025-01-25 18:37:36', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:37:36', '2025-01-24 18:37:36'),
('mc5Ml-cblUbNEKE88UQTB4qBbjWFzLk9', '2025-01-25 18:55:33', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:55:33', '2025-01-24 18:55:33'),
('McesWbevTWCRv0cfDZN-ZXs79YN6NPBG', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('MDtMJWfHdrBYkc9yMOPqclP8coV_mLwH', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('MdTPgmLLlxJBA8_lv5_4HkJ7CaPvZzsb', '2025-01-25 18:34:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:34:25', '2025-01-24 18:34:25'),
('meP2x4fVflAL_hBdCHb2_3z8u27kR9Kz', '2025-01-25 18:50:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:30', '2025-01-24 18:50:30'),
('mGtr4lupkgdYnC5mPQawMaAzYKpyXi1I', '2025-01-25 16:02:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:02:18', '2025-01-24 16:02:18'),
('Mh07ABg4uBPlaEBWwet7LqWt4JB_UnZT', '2025-01-25 16:01:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:55', '2025-01-24 16:01:55'),
('miS6TasZVBRrpBIWLuL20GdtDklTlINX', '2025-01-25 18:35:22', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:35:22', '2025-01-24 18:35:22'),
('MixqtKQsq1kNDpoPXsNuBoBp9iJl7AkG', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('MJOFQhc0miM9p17MRelM4tcWBjwnnk9R', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('mjUA0jCyvefSx-7F61WV0SmK-23xUkqy', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('Mubconw2CeHwqg8bDOOSHxsBmHAsPNd4', '2025-01-25 18:50:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:30', '2025-01-24 18:50:30'),
('mubq10OpJa3zucCAHv7nFq7GKZa0JDjM', '2025-01-25 18:45:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:02', '2025-01-24 18:45:02'),
('MXtFRJ-Bd2VUuGLfObh5if3yCelr29C5', '2025-01-25 19:00:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 19:00:17', '2025-01-24 19:00:17');
INSERT INTO `sessions` (`sid`, `expires`, `data`, `createdAt`, `updatedAt`) VALUES
('MXT_Y-NJ5nBdOBmsslIRhGSTLdNEgyT-', '2025-01-25 16:01:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:55', '2025-01-24 16:01:55'),
('MYfIy5XQcrEe5gVcIcNqQyw8rXvjXIlU', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('N1elae2-GrMhOoS6_xacKab4J-wBhydn', '2025-01-25 18:46:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:46:18', '2025-01-24 18:46:18'),
('n82I9I-Y1ovVUjLrPEuDnuqJGS1E7VNw', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('n9gTIiMtwuuNQqqADdiOCzZx_fvIYcdH', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('NaxRQCS5l8ndQabi6ghe6mzNJNxm7Qq6', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('nduRBZ0SlbDS5IuEq9sOChjVClFMGYhK', '2025-01-25 18:45:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:29', '2025-01-24 18:45:29'),
('NFqbTJEGfEP_9pnbjHy6Yg8015ratX5d', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('NGATTZ-HjLJbBbkKvb-pe1UQMwJK3WxY', '2025-01-25 18:50:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:17', '2025-01-24 18:50:17'),
('nJmoybRde6QXQWuPFuns5qhdA2YL-9hx', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('nKRNYwt8AfdlJ9cwkZpVYtKF5pSPfYNy', '2025-01-25 16:01:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:54', '2025-01-24 16:01:54'),
('nL674ymqlmQWcDVea6nlV65owCfgBH2N', '2025-01-25 16:02:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:02:52', '2025-01-24 16:02:52'),
('nLGJFHkAOoeRoDtdB0zo0YyI3Wx3JBgb', '2025-01-25 18:35:32', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:35:32', '2025-01-24 18:35:32'),
('NR0pS8ssbpR1JpSU30MgvjqoMqFwnFhM', '2025-01-25 18:40:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:40:59', '2025-01-24 18:40:59'),
('NReX3IDIPioBhi0LAhbBWONMI0HNhUK1', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('nTc_jPw_VZ_PNP5pBQ_Hkrm3B3iKV4Ul', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('NTEQ1K-CpUiZ90YYwx1kSHub7oe6mW26', '2025-01-25 18:45:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:01', '2025-01-24 18:45:01'),
('O137WFOI5xFaR0AWjgxBcLCXtYOPZRqc', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('O3GZi03EFZ-mrpnI9GhKm4vcOb-m9dIy', '2025-01-25 18:45:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:02', '2025-01-24 18:45:02'),
('OHjOO8ueYT1pCQtXoJdQwhBGnamauAd7', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('ohY9UhwKziQWAh0TI1fqqgfDtsv46kmT', '2025-01-25 16:01:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:55', '2025-01-24 16:01:55'),
('oiOXDGJY2ibL9Q0kBlT0S7nlFXaFqeiK', '2025-01-25 18:45:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:02', '2025-01-24 18:45:02'),
('ORG_D62iyT1RD4Q7GWLQ1gQ_5V8P7163', '2025-01-25 17:57:39', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:39', '2025-01-24 17:57:39'),
('OXcfBqmV9BxRGT50m1ILY75esnMdfh1l', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('oXkwV-e9aEQrXb-ul3UhwFmhXHM8_nBs', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('oZgjO47Cn-cuKB9Rof5xNJVWYVMmMl8Y', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('P3UU_E26NApaBi3LtELP_kUFcO8xeOvv', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('PaAIdQUYLLbd8EHMI03OjacF4WqtZt90', '2025-01-25 18:50:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:16', '2025-01-24 18:50:16'),
('pAvIvtfGqCo2FN4dllxOeWyDG7AoayUS', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('PA__vzV7zXEUQUUUa28IcD9xN7ssntib', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('pEPDqp6-OKELT-UVn2g_XxmiFefEjXpT', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('pfccfqhr-GKMFfJGDp63KX7bhlLOV-bK', '2025-01-25 18:45:48', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:48', '2025-01-24 18:45:48'),
('PJyqXVUQbVdhUNTqA-DhS31yYIi6Ti4M', '2025-01-25 17:56:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:56:23', '2025-01-24 17:56:23'),
('PkBGChEiPOFG85xL5HXpEsD-OL5uvIHo', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('PKfuTSKbpiREDjSCbwSJyzasrZmUrq4w', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('pMxJocohYJobWalsAWDC6sAqiCBZYoGI', '2025-01-25 18:50:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:17', '2025-01-24 18:50:17'),
('PoJhscJnrkZJIgbOX6QKxG4nZiMWErFY', '2025-01-25 18:45:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:29', '2025-01-24 18:45:29'),
('PpVaElElNtqE4eUo-EZ2b9apAYGsX0Aq', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('Prl3-NmHg814LKrNZOZGQwGA8tWfp3kH', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('PSK1xzY1fN4rrvRRQlFmzLEPX4z9zDvN', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('pTwJDu3dgKIrkA3grOuoUYiRz7CrZFX2', '2025-01-25 18:49:03', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:03', '2025-01-24 18:49:03'),
('PUbSpMSkMCbFeePVnjSzNWkcyFmY2kzV', '2025-01-25 16:01:54', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:54', '2025-01-24 16:01:54'),
('pZ-ONvAAT95WLOjJwYpT2hdZWEpqX-ot', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('qcVXW90ash-5aXwkkqouSjnuO6axIk8b', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('qg558ZyMRra9hQsbcjIZujbkXwJXnmLf', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('qHjQ4wqtjZRgEWPvCH6N97mnx3MwuOmq', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('QispZHO-keEOqGKqNZAM1h21KfojA-38', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('Ql29ocmCULY5MCROx9n5J6LQHiKuAbWb', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('QnRX7m8SQCR5pRh1zfZvZdgEV_SlozX8', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('QPQz0hhZ7jGKkJLF9WJDrUxdBvYJtayV', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('QsDNESKq1GXGwOfmLIncU7Asnys7rB2y', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('QSJBgYME2N1ljdy8lez4P92W8g1D-wbV', '2025-01-25 17:57:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:43', '2025-01-24 17:57:43'),
('QTl3MUCbZsoJT8rl3c6xno4u505aeT3e', '2025-01-25 18:45:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:02', '2025-01-24 18:45:02'),
('R2TikZp8S_5cEfwJXDT52fMC9mfaBmaS', '2025-01-25 18:50:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:30', '2025-01-24 18:50:30'),
('R5bcxw0HAauFhAydnYw9FndpjdUgvc6_', '2025-01-25 18:06:32', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:06:32', '2025-01-24 18:06:32'),
('reRExcHJsONriQKcaUdGAgIPx3TjJIan', '2025-01-25 18:37:46', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:37:46', '2025-01-24 18:37:46'),
('Rg9h3-X2dDFgPYxWmVvxTMj0J3Mpmgrz', '2025-01-25 18:02:32', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:02:32', '2025-01-24 18:02:32'),
('RK8EkCef626yrqeoYczdl3SOekvRxVuU', '2025-01-25 18:50:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:29', '2025-01-24 18:50:29'),
('rLEl1kOlzx2CPbwXJ838pbO7vUnGgPVa', '2025-01-25 18:50:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:30', '2025-01-24 18:50:30'),
('RMovIkndRYJYrygWWJr36O35RG9sjUFe', '2025-01-25 18:50:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:16', '2025-01-24 18:50:16'),
('rNupqyVOV7fFM7hM3kgQKkt38_u1gI8V', '2025-01-25 18:50:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:16', '2025-01-24 18:50:16'),
('ROmN00ERhcXABRw5inQylsnWQDD8VIag', '2025-01-25 18:59:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:59:26', '2025-01-24 18:59:26'),
('rW8DMPKb4Su1AEKgeVxrmZ9aM5fJJCLh', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('RXN0GBh338qt3POJtDrk9wyvy6M7RxKH', '2025-01-25 18:45:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:29', '2025-01-24 18:45:29'),
('s1tAHjNr1RsRgxuN3k4yA7TpjLfuZeS7', '2025-01-25 18:45:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:29', '2025-01-24 18:45:29'),
('S307tIUaq_5Jxnq7McBwViuBholigShA', '2025-01-25 18:27:21', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:27:21', '2025-01-24 18:27:21'),
('s5-7mzQLF9jTietewvE3ruQG72TKp_vn', '2025-01-25 18:02:32', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:02:32', '2025-01-24 18:02:32'),
('s985AD_-5H7kNBSBQk6mPyYpaLHdcWPY', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('SCfMsllowEql04sEyW55B0Jz5MIR1dWv', '2025-01-25 18:36:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:36:08', '2025-01-24 18:36:08'),
('sdVNV0WepMChdX80zaN_4Bv-Z5s_hw4F', '2025-01-25 18:45:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:29', '2025-01-24 18:45:29'),
('sDxjmHLZH3L2psKiSKPv17ZFWA1iqoq7', '2025-01-25 18:45:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:29', '2025-01-24 18:45:29'),
('sexLh3XGSuwiEUpekRTgICKhkJL-B3Bc', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('Shwk3juoODoNjNvXh8Gc13-t6FTgGKjD', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('SifQjxGuP9aitYXLR24BSCAK5_rTNmjx', '2025-01-25 18:50:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:29', '2025-01-24 18:50:29'),
('SipIE4mxOIBWPlD0arEFv4aeelDXvN9j', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('sj8aZRhjBddnVxKNi2ObMw13Q7ERjzPY', '2025-01-25 18:50:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:16', '2025-01-24 18:50:16'),
('sJWSkQcjJYuHaeFCilil6zdIrOMSC2bg', '2025-01-25 18:49:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:27', '2025-01-24 18:49:27'),
('SjYAwP15M8-2Zxkzt-voVDXgDjMWbH2U', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('sPm_suXDCBKudAbrljG982lyXEHiw063', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('svEKSBSH6_YqXQqw8QMyRVtD18hHju3t', '2025-01-25 15:55:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 15:55:55', '2025-01-24 15:55:55'),
('sYSir04mcnHqO3hK5GSGeOXZEon_rZfq', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('t3L7CZ221WV_0IO6t0lSwm9L-eyQSc6B', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('TAabEQNPhPCHrWV1NIZovLGGkDHQmvUq', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('tbECj8UJMO0ItDJRqExb9DAmndYeOdS9', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('tbx9z1vq64le-AVvInULyF2WSs8COtoh', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('te4iAaF6Fu4MaMhhmv9-DHCIZ0DcTx3u', '2025-01-25 19:00:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 19:00:17', '2025-01-24 19:00:17'),
('tgQQVuMlmZyj_RS-y4d_k-cNMTyNI-Sa', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('THeSBy_As5jbhzTylSpe-_O2Df55HKSb', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('TKVEBlVd6uWOxbUSPH9pT1mDbRDzmxrh', '2025-01-25 18:45:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:02', '2025-01-24 18:45:02'),
('tNAVevS95fQKHEPSa6kvQGYpr3WgIJL1', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('ToulQu9emfqLu-VEmQssWMBgrqcCtCAv', '2025-01-25 18:45:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:01', '2025-01-24 18:45:01'),
('tQW4cLWDTS-hxdrkEDMkF74Jgd9FizYN', '2025-01-25 18:50:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:16', '2025-01-24 18:50:16'),
('TQwSb6lZCUGQSNrBzP3qMardtyC7kjgC', '2025-01-25 16:01:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:18', '2025-01-24 16:01:18'),
('tsYrOU4axZnib-66DPM-xCP6I1JSxg4e', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('TTddNW7psK5s7592-zcyTAHiVN38w0Ox', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('u02KvaOvX6-LI8abvku_K_Tt7MYyrcQn', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('U1RTAdRcEWR2X7PlvN7bXh0R65XQt3L5', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('U2AoU7wQf28jE6oNSOQkkta8CUJlbpYc', '2025-01-25 18:50:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:16', '2025-01-24 18:50:16'),
('U5gFyXK_T2hX2vQAFiaMFCRVFjdn4Bl_', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('uD4UrQiBlppdXI3jA-okTzJAvZyQA4mw', '2025-01-25 18:06:53', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:06:53', '2025-01-24 18:06:53'),
('ufEv9-M2COuUsJpZst__NVoHhyFHbwXO', '2025-01-25 18:45:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:01', '2025-01-24 18:45:01'),
('UmWmRHfQxVsYbd0p5l2oXDI5I2HVU7kr', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('Uomwk47SzEe3CVWpV5sPb3mRr65inmkU', '2025-01-25 16:01:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:55', '2025-01-24 16:01:55'),
('UOSVqdgO50CpejhfMuoF9sl0cPqusEFe', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('upgkh556r1mvcIiR4B9WuTOzyLYyLFeu', '2025-01-25 18:50:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:16', '2025-01-24 18:50:16'),
('utJoTZKDYv5i10JVVjFy1ps3WbqRkJwc', '2025-01-25 18:50:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:30', '2025-01-24 18:50:30'),
('uTl38elYrwOrJSA5hWgIynpMnX8Z5129', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('Uv5qQRxy0xjaEmfSXSJYqL39D6N-KQap', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('UVoQaAP-CjUN2I08VMR8i7YnxmwwPGb3', '2025-01-25 18:44:03', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:03', '2025-01-24 18:44:03'),
('uvZUn8P67eugTnOP5kubpngPu9JMUQVn', '2025-01-25 18:36:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:36:30', '2025-01-24 18:36:30'),
('uWFv5QL02I2JwZNwIQNBQ43m9Ql7846Y', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('V-ZNOj4YoovZgVNPo86h0bBRjTT0HCdC', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('V7YeGpqyfY0l9axhIKj2ZxBlq7qqxg05', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('vasZP33TL5w6NV7C3tLNl6wu8d5bTQYW', '2025-01-25 17:58:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:58:25', '2025-01-24 17:58:25'),
('VcYOOLSQEaH3zbnclQB6veRoA_leYZ5Z', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('VGTxIJKO52Raa5hiEMCmT5SKgdgm5rEM', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('vidV8ZxytlkEA3dsi6ct0ebrko5EgeiY', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('VJnXSs00J1sjKBL9XqjKd6bDS5rBFx0s', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('VlKgUXatDDtH9wG5Eh4I3WZuEKX9Cd7Z', '2025-01-25 18:45:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:02', '2025-01-24 18:45:02'),
('VpsOwSUr79jQ_ldrllOTy6D5iqRrtnNL', '2025-01-25 18:45:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:29', '2025-01-24 18:45:29'),
('Vqm2zq7GxGNpYRwP0TB4GXrJDYoz0seA', '2025-01-25 18:50:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:16', '2025-01-24 18:50:16'),
('VQRBU4SrMn4sIRSHJn6sFLHgBma9Pv4l', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('Vsbb45AYzghxAP0e78kgRlJS4_2GZrC3', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('w075Qwc4A5m_UOPFFNsPqSC9zOBT0LXN', '2025-01-25 18:45:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:01', '2025-01-24 18:45:01'),
('W3UVmUHAN6z_QsaP6zQzKg7KK4X6oTYf', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('w9eMlWO_Q4e6yHV9fX_B5RilNJw5YKnh', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('We2lwhzvIsg8OB2hujFii74TZ5n8P88R', '2025-01-25 16:02:28', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:02:28', '2025-01-24 16:02:28'),
('wHupAz4NaxBkXZeKT0Pw5BSB83umfZ1r', '2025-01-25 18:50:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:43', '2025-01-24 18:50:43'),
('wijGh7rCnZ-AFU8jssSY2WnEviNHtFa5', '2025-01-25 18:09:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:09:29', '2025-01-24 18:09:29'),
('WiKOMH66N_WaBytSWMLRcZFGv-Y8eTQm', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('wmwIP7lkf8yWf4yQbmwIoLuT_GFyHt7z', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('WoKS6pVQpo05llkarKNPy3rdsdNjuJDA', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('WP_S9TFwzLEE9ss1gmLe1HwiMlsYDtPT', '2025-01-25 18:36:04', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:36:04', '2025-01-24 18:36:04'),
('WrdYCWenfFcFFQhRPgLW_I_egvIl8bs_', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('WUy6tyzfnYIdEiQIFUlAiQj-GWO7H9y2', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('wVpjIfDehZx7nMGAVqDbDQAzmR8GxWl1', '2025-01-25 18:50:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:17', '2025-01-24 18:50:17'),
('wXl8SEMINekboUNX7r-cOz8HCf1d0I_4', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('x2QM3x4KesxDxB_8thIOIWFXNeCpLohh', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('XaaANLSsooxZe-o_3QJpkzlUkCOC-dmg', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('XByvFgrm3HbHQolq9I1WUobNNumNxH5Q', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('xgcPoCDrqgBykP0ySJx_Swvu3CZ0dvCp', '2025-01-25 18:41:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:41:15', '2025-01-24 18:41:15'),
('xgN0AnwV8goik1U1mv6YhkxpV13oTnk3', '2025-01-25 18:37:21', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:37:21', '2025-01-24 18:37:21'),
('xGPj-rskEw4h72R2ms5R5xUSoU9fmiyf', '2025-01-25 17:57:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:24', '2025-01-24 17:57:24'),
('xhKJGh7BHpWNzSvcox2ymfOpnycVP-d1', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('xj3qUOl2Cj39l8nmQuUx9wPjkWEXbydF', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('XjteXjoLUJ0l6BepTHU74Xa3cayY6eE1', '2025-01-25 18:45:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:29', '2025-01-24 18:45:29'),
('xLHWMcqWvpVnh8ES5oq_U0lk7eqUuvyw', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('xN5btXZDh6PKZJVMkuKik8QAKcT7iUnH', '2025-01-25 16:01:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:55', '2025-01-24 16:01:55'),
('XoQyr90MFSt5NwSgMWzkCe2LlUqWCy9U', '2025-01-25 16:01:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:55', '2025-01-24 16:01:55'),
('xsGYmkfTopMXVIkUp-Q2m1zD2GiT2CTB', '2025-01-25 18:06:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:06:24', '2025-01-24 18:06:24'),
('XSQ7sl6RdlKRbs1GnafkXKdFqr1Czu-F', '2025-01-25 18:38:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:31', '2025-01-24 18:38:31'),
('xUwVAZMYX9ogUY9jyABqYB0Gz9lUGgmZ', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('xVNpZuQ_5iPRa7tRSU1L1-F7Oz8OClRL', '2025-01-25 18:45:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:29', '2025-01-24 18:45:29'),
('y5iY4I9A-0l9fLd5puStVlCtDn92pQfz', '2025-01-25 18:50:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:17', '2025-01-24 18:50:17'),
('y6dNemiS_hGN0posAEUS64oxyU3G6JBn', '2025-01-25 18:01:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:01:08', '2025-01-24 18:01:08'),
('yIRNXjS4hWXH727mH6CKfra93mlxxOhQ', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('yMBfLV8j-Hds0bE3NCq9pO6_LBGImbZj', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('YmSgSDxkkhTrCz4jsGEeFVVoYyZ6NGvE', '2025-01-25 17:57:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 17:57:52', '2025-01-24 17:57:52'),
('yYdkaN9r9lxXjKUh9CU1JmXCzouX6owc', '2025-01-25 18:42:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:42:13', '2025-01-24 18:42:13'),
('YZ2Tnyqh1PGz6B3m0XudaZPIILAAr6SO', '2025-01-25 18:38:00', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:38:00', '2025-01-24 18:38:00'),
('YZuQU65yvtxLIFxJeVzkCyQfP-dNgViA', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('z3tHHwg4KdCH1iEASKkI-CMRKeqv7zNJ', '2025-01-25 16:01:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:55', '2025-01-24 16:01:55'),
('Z9mEifj3tCCQRMnIEj7vBTCnW0n-5Q5G', '2025-01-25 18:09:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:09:01', '2025-01-24 18:09:01'),
('zBrZHNNHGufBvjyi_wrYbOGAEIMPhG-k', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('ZepkdWiUV933NdLkPGzA6pskW-1GB4Bu', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('zLcOsXEuvuhojXu67MdXFBsjMevsMnms', '2025-01-25 16:01:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:26', '2025-01-24 16:01:26'),
('zNdYTj7G7xlmLQAsfzfYzFb9C0fCzCkS', '2025-01-25 16:01:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:55', '2025-01-24 16:01:55'),
('zo6N9o0nKfuWrmWQmRsLBBJ2Pfvmd5Zt', '2025-01-25 16:01:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:01:55', '2025-01-24 16:01:55'),
('ZrwY5bze6cP7BKdH4Jbib3wxn6oawYBA', '2025-01-25 18:45:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:30', '2025-01-24 18:45:30'),
('ZU-rLiqjjBWeUacbXYViArk3Z_zQy-GZ', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('_7M3IITO09DLCGp-AxZA7meCv3EMLrXv', '2025-01-25 18:44:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:44:25', '2025-01-24 18:44:25'),
('_C8SGTgf66HYjKOIulfeKeIkQ3zudsCY', '2025-01-25 18:02:38', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:02:38', '2025-01-24 18:02:38'),
('_dTtqdZC_F8l5EdB6PEngz7-w4st40cY', '2025-01-25 18:06:45', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:06:45', '2025-01-24 18:06:45'),
('_fdnItnxO1CGP3T7fM1Aj_EohZRluT_G', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('_HjlDmyBVKRH-yv33FIbRlxq9QHycklF', '2025-01-25 16:04:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 16:04:30', '2025-01-24 16:04:30'),
('_L1sPAHd0pkQZRc8jl_CJEFB4a35K8ZY', '2025-01-25 18:50:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:50:42', '2025-01-24 18:50:42'),
('_lbEnGmT-dydlzARpoAlbMP3Z6VVE7Sh', '2025-01-25 18:49:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:49:47', '2025-01-24 18:49:47'),
('_yFW87TKQLLOx-qhHWsrHGQ_yT6BmnG_', '2025-01-25 18:45:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2025-01-24 18:45:02', '2025-01-24 18:45:02');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `golongan`
--
ALTER TABLE `golongan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `izin_cuti`
--
ALTER TABLE `izin_cuti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `karyawan_id` (`karyawan_id`);

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jabatan_id` (`jabatan_id`),
  ADD KEY `golongan_id` (`golongan_id`),
  ADD KEY `departemen_id` (`departemen_id`);

--
-- Indeks untuk tabel `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `karyawan_id` (`karyawan_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sid`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `departemen`
--
ALTER TABLE `departemen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `golongan`
--
ALTER TABLE `golongan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `izin_cuti`
--
ALTER TABLE `izin_cuti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `presensi`
--
ALTER TABLE `presensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `izin_cuti`
--
ALTER TABLE `izin_cuti`
  ADD CONSTRAINT `izin_cuti_ibfk_1` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`jabatan_id`) REFERENCES `jabatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `karyawan_ibfk_2` FOREIGN KEY (`golongan_id`) REFERENCES `golongan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `karyawan_ibfk_3` FOREIGN KEY (`departemen_id`) REFERENCES `departemen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `presensi`
--
ALTER TABLE `presensi`
  ADD CONSTRAINT `presensi_ibfk_1` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

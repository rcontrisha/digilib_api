-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Jun 2024 pada 01.33
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digilib`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_buku`
--

CREATE TABLE `m_buku` (
  `id_buku` varchar(10) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `id_kategori` varchar(10) NOT NULL,
  `pengarang` varchar(255) DEFAULT NULL,
  `tahun` varchar(50) DEFAULT NULL,
  `penerbit` varchar(255) DEFAULT NULL,
  `path_file` varchar(255) DEFAULT NULL,
  `tgl_upload` datetime NOT NULL,
  `id_user_upload` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `m_buku`
--

INSERT INTO `m_buku` (`id_buku`, `judul`, `deskripsi`, `id_kategori`, `pengarang`, `tahun`, `penerbit`, `path_file`, `tgl_upload`, `id_user_upload`) VALUES
('BOOK0001', 'PEDOMAN PEMROGRAMAN WEB', 'HTML-CSS-JAVASCRIPT-DOM-PHP-MYSQL-AKSESIBILITAS-FINDABILITAS-HOSTING', 'KAT0001', 'L. ERAWAN', '2015', 'PROGRAM STUDI SISTEM INFORMASI UDINUS', 'file/buku/BOOK_PEDOMAN_PRAKTIKUM_PEMROGRAMAN_WEB_LENGKAP.PDF', '2021-08-25 11:43:07', 'USR0000'),
('BOOK0002', 'MODUL PELATIHAN MS EXCEL 2013', 'MODUL PELATIHAN MICROSOFT EXCEL 2013', 'KAT0003', 'ICT IPB', '2015', 'PROGRAM STUDI SISTEM INFORMASI UDINUS', 'file/buku/BOOK_MODUL-PELATIHAN-MICROSOFT-EXCEL-2013-1.PDF', '2021-08-25 11:42:44', 'USR0000'),
('BOOK0003', 'PEMROGRAMAN WEB DENGAN PHP DAN MYSQL', 'Buku ini cocok bagi pembaca yang baru mulai belajar PHP dan MySQL.', 'KAT0001', 'Achmad Solichin, S.Kom', '2009', 'ACHMATIM', 'file/buku/BOOK_EBOOK-PEMROGRAMAN-WEB-DENGAN-PHP-DAN-MYSQL-DD_38808F8B5F00A6A0E6ECF61CC8F4E04C.PDF', '2021-08-25 11:43:15', 'USR0000'),
('BOOK0004', 'PENGANTAR SISTEM BASIS DATA', 'Memahami konsep dasar database', 'KAT0002', 'Hendra Jatnika, S.Kom, M.Kom.', '2012', 'ANDI OFFSET', 'file/buku/BOOK_DOCDOWNLOADER.COM-PDF-BUKU-PENGANTAR-SISTEM-BASIS-DATA-DD_E53D2E4BD64BBFD3E34128C6D4533310.PDF', '2021-08-25 02:18:24', 'USR0002'),
('BOOK0006', 'Garis Waktu', 'Garis Waktu adalah novel yang ditulis oleh Fiersa Besari pada tahun 2017. Novel ini mengisahkan perjalanan hidup seorang lelaki bernama Ben yang mencoba mencari jawaban atas pertanyaan hidupnya melalui perjalanan waktu.', 'KAT0005', 'Fiersa Besari', '2017', 'MediaKita', NULL, '2024-06-04 13:56:18', 'USR0000'),
('BOOK0007', 'Negeri 5 Menara', 'Negeri 5 Menara adalah novel yang ditulis oleh Ahmad Fuadi pada tahun 2009. Novel ini menceritakan tentang perjalanan hidup Alif yang berasal dari desa kecil di Sumatera Barat menuju pesantren di Jawa Barat untuk mengejar mimpinya.', 'KAT0006', 'Ahmad Fuadi', '2009', 'Gramedia Pustaka Utama', NULL, '2024-06-04 13:56:18', 'USR0000'),
('BOOK0008', 'Judul Buku', 'Ngetes Tambah Buku', 'KAT0005', 'Agus', '2024', 'Aselole', NULL, '2024-06-10 21:52:18', 'USR0000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_group_user`
--

CREATE TABLE `m_group_user` (
  `id_group_user` varchar(10) NOT NULL,
  `desk_group_user` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `m_group_user`
--

INSERT INTO `m_group_user` (`id_group_user`, `desk_group_user`) VALUES
('GRP0001', 'Administrator'),
('GRP0002', 'Contributor'),
('GRP0003', 'Basic Member');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_kategori`
--

CREATE TABLE `m_kategori` (
  `id_kategori` varchar(10) NOT NULL,
  `desk_kategori` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `m_kategori`
--

INSERT INTO `m_kategori` (`id_kategori`, `desk_kategori`) VALUES
('KAT0001', 'Pemrograman Web'),
('KAT0002', 'Database'),
('KAT0003', 'M.S. Office'),
('KAT0004', 'Romansa'),
('KAT0005', 'Fiksi'),
('KAT0006', 'Petualangan'),
('KAT0007', 'BUKU PANDUAN GEOGRAFI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_menu`
--

CREATE TABLE `m_menu` (
  `id_menu` varchar(10) NOT NULL,
  `modul` varchar(50) DEFAULT NULL,
  `desk_menu` varchar(50) DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `parent` varchar(10) DEFAULT NULL,
  `path` varchar(80) DEFAULT NULL,
  `route` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL,
  `tampil` varchar(10) DEFAULT 'Y',
  `icon` varchar(50) DEFAULT NULL,
  `icon_mobile` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `m_menu`
--

INSERT INTO `m_menu` (`id_menu`, `modul`, `desk_menu`, `level`, `parent`, `path`, `route`, `type`, `tampil`, `icon`, `icon_mobile`) VALUES
('MN0001', 'beranda', 'Home', '1', NULL, 'home/view.php', '/home', '1', 'Y', 'icon-home4', 'home'),
('MN0002', 'master', 'Master', '1', NULL, NULL, '', '2', 'Y', 'icon-gear', 'folder_copy'),
('MN0002-01', 'buku', 'Buku', '2', 'MN0002', 'buku/view.php', '/daftarbuku', '', 'Y', NULL, 'book'),
('MN0002-02', 'kategori', 'Kategori', '2', 'MN0002', 'kategori/view.php', '/daftarkategori', '', 'Y', NULL, 'category'),
('MN0003', 'user', 'User', '1', NULL, NULL, '', '', 'Y', 'icon-user', 'groups'),
('MN0003-01', 'daftar_user', 'Daftar User', '2', 'MN0003', 'user/view.php', '/daftaruser', '', 'Y', NULL, 'supervised_user_circle'),
('MN0003-02', 'group_user', 'Group User', '2', 'MN0003', 'group_user/view.php', '/groupuser', '', 'Y', NULL, 'group'),
('MN0003-03', 'akses_group', 'Akses Group', '2', 'MN0003', 'akses_group/view.php', '/aksesgroup', '', 'Y', NULL, 'lock_person'),
('MN0004', 'cari_buku', 'Pencarian Buku', '1', NULL, 'cari_buku/view.php', '/caribuku', '1', 'Y', 'icon-book', 'search'),
('MN0005', 'log_user', 'Log Pengunjung', '1', NULL, 'log/view.php', '/log', '1', 'Y', 'icon-user', 'history'),
('MN0006', 'my_contribution', 'Kontribusi Saya', '1', NULL, 'my_contribution/view.php', '/kontribusi', '1', 'Y', 'icon-book', 'archive'),
('MN0007', 'user_profil', 'Profil', '1', NULL, 'user_profil/view.php', '', '', 'N', NULL, 'person'),
('MN0008', 'peminjaman', 'Daftar Peminjaman', '1', NULL, 'peminjaman/view.php', '/daftarpeminjaman', '1', 'Y', 'icon-book', 'library_books');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_pinjam`
--

CREATE TABLE `m_pinjam` (
  `id` int(11) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `book_id` varchar(10) NOT NULL,
  `borrowed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status_pengembalian` enum('Dipinjam','Dikembalikan') NOT NULL DEFAULT 'Dipinjam',
  `returned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `m_pinjam`
--

INSERT INTO `m_pinjam` (`id`, `user_id`, `book_id`, `borrowed_at`, `status_pengembalian`, `returned_at`) VALUES
(1, 'USR0001', 'BOOK0002', '2024-06-04 05:09:12', 'Dikembalikan', '2024-06-04 14:35:55'),
(2, 'USR0001', 'BOOK0002', '2024-06-02 05:09:12', 'Dikembalikan', '2024-06-04 12:43:07'),
(3, 'USR0001', 'BOOK0006', '2024-06-04 14:35:14', 'Dikembalikan', '2024-06-04 14:36:13'),
(4, 'USR0000', 'BOOK0006', '2024-06-05 13:53:20', 'Dikembalikan', '2024-06-05 13:53:47'),
(5, 'USR0000', 'BOOK0007', '2024-06-05 13:53:28', 'Dikembalikan', '2024-06-05 13:53:53'),
(6, 'USR0001', 'BOOK0007', '2024-06-05 13:55:56', 'Dikembalikan', '2024-06-09 18:26:54'),
(7, 'USR0001', 'BOOK0002', '2024-06-05 13:56:01', 'Dikembalikan', '2024-06-09 18:27:39'),
(8, 'USR0000', 'BOOK0006', '2024-06-10 00:18:51', 'Dikembalikan', '2024-06-10 00:18:56'),
(9, 'USR0001', 'BOOK0001', '2024-06-10 00:29:50', 'Dikembalikan', '2024-06-09 18:29:45'),
(14, 'USR0000', 'BOOK0001', '2024-06-10 00:42:47', 'Dikembalikan', '2024-06-09 18:34:56'),
(20, 'USR0000', 'BOOK0006', '2024-06-10 01:47:32', 'Dikembalikan', '2024-06-10 01:47:42'),
(21, 'USR0000', 'BOOK0003', '2024-06-10 01:52:10', 'Dikembalikan', '2024-06-10 01:52:19'),
(22, 'USR0000', 'BOOK0002', '2024-06-10 01:52:35', 'Dikembalikan', '2024-06-10 15:41:00'),
(23, 'USR0000', 'BOOK0001', '2024-06-10 15:40:48', 'Dikembalikan', '2024-06-13 16:34:59'),
(24, 'USR0001', 'BOOK0007', '2024-06-10 15:44:16', 'Dikembalikan', '2024-06-10 15:44:38'),
(25, 'USR0000', 'BOOK0002', '2024-06-13 16:45:21', 'Dikembalikan', '2024-06-13 16:46:38'),
(26, 'USR0000', 'BOOK0007', '2024-06-13 16:54:13', 'Dikembalikan', '2024-06-13 17:06:30'),
(27, 'USR0000', 'BOOK0003', '2024-06-13 17:06:46', 'Dikembalikan', '2024-06-13 17:06:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_user`
--

CREATE TABLE `m_user` (
  `id_user` varchar(10) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `id_group_user` varchar(10) DEFAULT NULL,
  `aktif` varchar(5) DEFAULT '''Y'''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `m_user`
--

INSERT INTO `m_user` (`id_user`, `nama_user`, `email`, `password`, `id_group_user`, `aktif`) VALUES
('USR0000', 'Root', 'root@app.com', 'MDEwMTAx', 'GRP0001', 'Y'),
('USR0001', 'User Biasa', 'user@app.com', 'MTIzNDU=', 'GRP0003', 'Y'),
('USR0002', 'Ali Baba', 'alibaba@app.com', 'MDEwMTAx', 'GRP0002', 'Y'),
('USR0003', 'Sofyan Arif', 'sofyanarif@app.com', 'MDEwMTAx', 'GRP0003', 'Y'),
('USR0004', 'Wawan', 'wawan@app.com', 'd2F3YW4xMjM=', 'GRP0003', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_akses_menu`
--

CREATE TABLE `t_akses_menu` (
  `id_group_user` varchar(10) NOT NULL,
  `id_menu` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `t_akses_menu`
--

INSERT INTO `t_akses_menu` (`id_group_user`, `id_menu`) VALUES
('GRP0001', 'MN0001'),
('GRP0001', 'MN0002'),
('GRP0001', 'MN0003'),
('GRP0001', 'MN0004'),
('GRP0001', 'MN0005'),
('GRP0001', 'MN0008'),
('GRP0002', 'MN0001'),
('GRP0002', 'MN0004'),
('GRP0002', 'MN0006'),
('GRP0003', 'MN0001'),
('GRP0003', 'MN0004');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_log`
--

CREATE TABLE `t_log` (
  `id_user` varchar(10) NOT NULL,
  `tgl_log` datetime NOT NULL,
  `session` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `t_log`
--

INSERT INTO `t_log` (`id_user`, `tgl_log`, `session`) VALUES
('USR0000', '2021-08-25 01:48:37', 'qc1tf4kidpcdbo64khsqb96bnr'),
('USR0002', '2021-08-25 02:10:21', 'qc1tf4kidpcdbo64khsqb96bnr'),
('USR0000', '2021-08-25 02:20:46', 'qc1tf4kidpcdbo64khsqb96bnr'),
('USR0001', '2024-05-15 07:25:07', 'tpon9c2b7a0e8tvo517civbq3q'),
('USR0000', '2024-05-15 07:27:59', 'tpon9c2b7a0e8tvo517civbq3q'),
('USR0001', '2024-06-03 07:48:08', 'jbkan86bpgbotuhb027mq2h065'),
('USR0000', '2024-06-03 07:51:03', 'jbkan86bpgbotuhb027mq2h065'),
('USR0000', '2024-06-03 09:50:54', 'ocf50bvtj7764qb35pa7atme2k'),
('USR0001', '2024-06-03 09:53:57', 'ocf50bvtj7764qb35pa7atme2k'),
('USR0000', '2024-06-03 09:54:57', 'ocf50bvtj7764qb35pa7atme2k'),
('USR0000', '2024-06-04 11:28:25', 'si4vn8v6u8pli90sgqd0ik0d01'),
('USR0001', '2024-06-04 11:33:30', 'si4vn8v6u8pli90sgqd0ik0d01'),
('USR0001', '2024-06-04 12:00:12', 'si4vn8v6u8pli90sgqd0ik0d01'),
('USR0001', '2024-06-04 12:09:05', 'si4vn8v6u8pli90sgqd0ik0d01'),
('USR0001', '2024-06-04 12:35:28', 'si4vn8v6u8pli90sgqd0ik0d01'),
('USR0001', '2024-06-04 12:41:16', 'si4vn8v6u8pli90sgqd0ik0d01'),
('USR0001', '2024-06-04 12:48:51', 'si4vn8v6u8pli90sgqd0ik0d01'),
('USR0001', '2024-06-04 12:51:30', 'si4vn8v6u8pli90sgqd0ik0d01'),
('USR0001', '2024-06-04 12:52:22', 'si4vn8v6u8pli90sgqd0ik0d01'),
('USR0001', '2024-06-04 01:05:46', 'si4vn8v6u8pli90sgqd0ik0d01'),
('USR0000', '2024-06-04 01:21:05', 'si4vn8v6u8pli90sgqd0ik0d01'),
('USR0000', '2024-06-04 02:19:34', 'fuuaa9lcqrq7kv3gnhkohnv0ej'),
('USR0000', '2024-06-04 07:35:35', 'fuuaa9lcqrq7kv3gnhkohnv0ej'),
('USR0000', '2024-06-04 07:47:46', 'fuuaa9lcqrq7kv3gnhkohnv0ej'),
('USR0000', '2024-06-04 07:48:33', 'fuuaa9lcqrq7kv3gnhkohnv0ej'),
('USR0000', '2024-06-04 07:56:28', 'fuuaa9lcqrq7kv3gnhkohnv0ej'),
('USR0001', '2024-06-04 09:35:04', 'fuuaa9lcqrq7kv3gnhkohnv0ej'),
('USR0000', '2024-06-04 09:35:37', 'fuuaa9lcqrq7kv3gnhkohnv0ej'),
('USR0000', '2024-06-05 08:52:24', '1thir7cc2epvbmfb8gke5sh4t9'),
('USR0001', '2024-06-05 08:55:38', '1thir7cc2epvbmfb8gke5sh4t9'),
('USR0002', '2024-06-05 09:11:23', '1thir7cc2epvbmfb8gke5sh4t9'),
('USR0002', '2024-06-05 09:14:03', '1thir7cc2epvbmfb8gke5sh4t9'),
('USR0000', '2024-06-05 09:28:52', '1thir7cc2epvbmfb8gke5sh4t9'),
('USR0000', '2024-06-05 09:47:06', '1thir7cc2epvbmfb8gke5sh4t9'),
('USR0001', '2024-06-05 09:48:15', '1thir7cc2epvbmfb8gke5sh4t9'),
('USR0002', '2024-06-05 09:48:37', '1thir7cc2epvbmfb8gke5sh4t9'),
('USR0002', '2024-06-05 09:49:35', '1thir7cc2epvbmfb8gke5sh4t9'),
('USR0000', '2024-06-05 09:50:33', '1thir7cc2epvbmfb8gke5sh4t9'),
('USR0000', '2024-06-06 12:33:32', 'h1s02lsdvcm489fj269l5s3106'),
('USR0003', '2024-06-06 12:37:10', 'h1s02lsdvcm489fj269l5s3106'),
('USR0000', '2024-06-06 04:39:46', 'mm2uf4ttpkv3tpmqr0huadbuet'),
('USR0002', '2024-06-06 04:44:11', 'mm2uf4ttpkv3tpmqr0huadbuet'),
('USR0003', '2024-06-06 04:44:53', 'mm2uf4ttpkv3tpmqr0huadbuet'),
('USR0000', '2024-06-06 05:44:33', '39f6dj2vh4nq5p3gqh15qb5pru'),
('USR0000', '2024-06-10 08:47:22', 'gahnfp47jcqoa6ndf560uu9rcn'),
('USR0000', '2024-06-10 08:27:25', 'gahnfp47jcqoa6ndf560uu9rcn'),
('USR0002', '2024-06-13 10:29:42', 'gahnfp47jcqoa6ndf560uu9rcn'),
('USR0002', '2024-06-13 10:30:36', 'gahnfp47jcqoa6ndf560uu9rcn'),
('USR0000', '2024-06-13 12:48:51', 'fec31fc0c88fc88f1ec01d8ea1854671'),
('USR0000', '2024-06-13 12:48:56', '00dc540959b8a40cf29294100d33f338'),
('USR0001', '2024-06-13 12:52:42', 'a0abb09debe54014bd83a5ebe62d6fbb'),
('USR0001', '2024-06-13 12:55:25', '60def6c13c9194bc8b91b1f126671e1c'),
('USR0001', '2024-06-13 12:56:07', 'ef6a6b465eee54ca22df2e00ff9d5bbd'),
('USR0001', '2024-06-13 12:56:45', 'fd0f43c562ce775f863f23cfae793ecf'),
('USR0000', '2024-06-13 13:07:23', '6BmKy88Et1gR9Jy1HT3pJJ8ln1IK7b4M'),
('USR0000', '2024-06-13 13:07:35', 'S3Rf0xOzFi1uZrPiv5ZfzS9ukR8DfKg8'),
('USR0001', '2024-06-13 13:08:11', 'CzetmRScD8OGaYJSgKIn3gctpykLhB9W'),
('USR0000', '2024-06-13 13:09:53', '7LiAy3bTKIxkWx8Nk2IMOOWpwvpJPZts'),
('USR0000', '2024-06-13 13:12:03', '0uzYCQDhC9uGQIgoXQHVeyDwS9ydayo7'),
('USR0000', '2024-06-13 13:12:35', '6jnvRgQPQcd9vr9xTk4Q1xn9pjyynG9a'),
('USR0000', '2024-06-13 20:13:29', 'rEb9g4LgIHGf9dTLcbUQuEV3poTaEZy4'),
('USR0000', '2024-06-13 08:14:23', 'gahnfp47jcqoa6ndf560uu9rcn'),
('USR0000', '2024-06-13 20:30:21', 'iChFOW1ajdfkb54hZW1jBTmYPYFD3gj0'),
('USR0000', '2024-06-13 20:35:21', 'CdbIcCrvAOVCpow8pa0mEs4fHvuTiUFg'),
('USR0000', '2024-06-13 20:45:40', 'bkp6c26Ntm3csPG4EdNarGftdG857RtH'),
('USR0000', '2024-06-13 20:58:54', 'LKOHqU5DORhpLNIpBr2d1U8RBa3FK6yM'),
('USR0000', '2024-06-13 23:34:47', 'fcMgkRqTijGyUYB4tOIWLLxs5RgyBCGB'),
('USR0000', '2024-06-13 23:46:03', 'K9ob4fgjE0LfFCyw4O4JvNcbl2qCOWi1'),
('USR0000', '2024-06-13 23:53:56', 'd5PDqZC8VxfvBkaZq3sHkBY33W4ModtF'),
('USR0000', '2024-06-14 00:06:17', '3ti9U1Wor7Jl6VcczoXyWCxcrFIWQbN3'),
('USR0000', '2024-06-14 00:18:42', 'cBGKRSn6PHb7XiFZPCi1yjcr9nh09KF3'),
('USR0000', '2024-06-14 00:26:39', '3vs0wy75wcXLEO1GCz5Uj7GbW7740v4U'),
('USR0000', '2024-06-14 01:01:28', 'gahnfp47jcqoa6ndf560uu9rcn'),
('USR0000', '2024-06-14 01:13:41', 'WqkSZb7nxhQX1T93eSxIUenPV14al5rj'),
('USR0000', '2024-06-14 01:17:17', '0bzgz9MXdrrNJW3fKynMXad6e3yygWJ8'),
('USR0000', '2024-06-14 01:18:06', '4AFQObE8ycsJB5edSfjwf1gdgsiFF72d');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `m_buku`
--
ALTER TABLE `m_buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `m_group_user`
--
ALTER TABLE `m_group_user`
  ADD PRIMARY KEY (`id_group_user`);

--
-- Indeks untuk tabel `m_kategori`
--
ALTER TABLE `m_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `m_menu`
--
ALTER TABLE `m_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `m_pinjam`
--
ALTER TABLE `m_pinjam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indeks untuk tabel `m_user`
--
ALTER TABLE `m_user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_group_user` (`id_group_user`);

--
-- Indeks untuk tabel `t_akses_menu`
--
ALTER TABLE `t_akses_menu`
  ADD PRIMARY KEY (`id_group_user`,`id_menu`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indeks untuk tabel `t_log`
--
ALTER TABLE `t_log`
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `m_pinjam`
--
ALTER TABLE `m_pinjam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `m_pinjam`
--
ALTER TABLE `m_pinjam`
  ADD CONSTRAINT `m_pinjam_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `m_pinjam_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `m_buku` (`id_buku`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `m_user`
--
ALTER TABLE `m_user`
  ADD CONSTRAINT `m_user_ibfk_1` FOREIGN KEY (`id_group_user`) REFERENCES `m_group_user` (`id_group_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `t_akses_menu`
--
ALTER TABLE `t_akses_menu`
  ADD CONSTRAINT `t_akses_menu_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `m_menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_akses_menu_ibfk_2` FOREIGN KEY (`id_group_user`) REFERENCES `m_group_user` (`id_group_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `t_log`
--
ALTER TABLE `t_log`
  ADD CONSTRAINT `t_log_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `m_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

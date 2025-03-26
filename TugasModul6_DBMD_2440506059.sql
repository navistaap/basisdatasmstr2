-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Mar 2025 pada 15.48
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
-- Database: `elektro`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `kode_dos` char(5) NOT NULL,
  `nama_dos` varchar(100) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `ketuajurusan` tinyint(1) DEFAULT 0,
  `alamat` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_telepon` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`kode_dos`, `nama_dos`, `id_jurusan`, `ketuajurusan`, `alamat`, `email`, `no_telepon`) VALUES
('D001', 'Dr. Budi Santoso', 0, 1, 'Jl. Merdeka No.1', 'budi@univ.ac.id', '08123456789'),
('D002', 'Dr. Siti Aisyah', 0, 0, 'Jl. Diponegoro No.2', 'siti@univ.ac.id', '08211234567'),
('D003', 'Dr. Anton Wijaya', 0, 0, 'Jl. Mekanik No.3', 'anton@univ.ac.id', '08333456789'),
('D004', 'Dr. Rudi Gunawan', 0, 0, 'Jl. Manufaktur No.4', 'rudi@univ.ac.id', '082211334455'),
('D005', 'Prof. Heru Prasetyo', 0, 0, 'Jl. Teknologi No.5', 'heru@univ.ac.id', '081122334455'),
('D006', 'Dr. Yulianti Dewi', 0, 0, 'Jl. Teknik No.6', 'yulianti@univ.ac.id', '085566778899'),
('D007', 'Prof. Suharto', 0, 0, 'Jl. Tidar No.7', 'suharto@univ.ac.id', '084455667788');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` char(10) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `ID_Jurusan` char(5) NOT NULL,
  `Alamat` text DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telepon` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `Nama`, `ID_Jurusan`, `Alamat`, `Email`, `Telepon`) VALUES
('M001', 'Andi Setiawan', '', 'Jl. Sudirman No.5', 'andi@student.ac.id', '08234567890'),
('M002', 'Budi Prasetyo', '', 'Jl. Diponegoro No.6', 'budi@student.ac.id', '08123456789'),
('M003', 'Citra Dewi', '', 'Jl. Mekanik No.7', 'citra@student.ac.id', '082122334455'),
('M004', 'Dian Purnama', '', 'Jl. Manufaktur No.8', 'dian@student.ac.id', '085566778899'),
('M005', 'Eko Wijaya', '', 'Jl. Teknologi No.9', 'eko@student.ac.id', '087755667788'),
('M006', 'Fajar Satria', '', 'Jl. Teknik No.10', 'fajar@student.ac.id', '081322334455'),
('M007', 'Gita Ramadani', '', 'Jl. Elektro No.11', 'gita@student.ac.id', '082233445566');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `Kode_MK` char(10) NOT NULL,
  `Nama_MK` varchar(100) NOT NULL,
  `SKS` int(11) DEFAULT NULL CHECK (`SKS` > 0),
  `Semester` int(11) DEFAULT NULL CHECK (`Semester` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`Kode_MK`, `Nama_MK`, `SKS`, `Semester`) VALUES
('EL101', 'Dasar Teknik Elektro', 3, 1),
('EL102', 'Rangkaian Listrik', 4, 2),
('EL201', 'Elektronika Analog', 3, 3),
('EL202', 'Elektronika Digital', 3, 4),
('EL301', 'Sistem Tenaga Listrik', 4, 5),
('EL302', 'Instrumentasi dan Kendali', 3, 6),
('EL401', 'Robotika dan Otomasi', 4, 7),
('EL402', 'Jaringan Listrik Pintar', 3, 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mengajar`
--

CREATE TABLE `mengajar` (
  `kode_dos` char(5) NOT NULL,
  `kode_mk` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mengajar`
--

INSERT INTO `mengajar` (`kode_dos`, `kode_mk`) VALUES
('D001', 'EL101'),
('D001', 'EL402'),
('D002', 'EL102'),
('D003', 'EL201'),
('D004', 'EL202'),
('D005', 'EL301'),
('D006', 'EL302'),
('D007', 'EL401');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mengambil`
--

CREATE TABLE `mengambil` (
  `NIM` char(10) NOT NULL,
  `Kode_MK` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mengambil`
--

INSERT INTO `mengambil` (`NIM`, `Kode_MK`) VALUES
('M001', 'EL101'),
('M001', 'EL402'),
('M002', 'EL102'),
('M002', 'EL201'),
('M003', 'EL201'),
('M003', 'EL301'),
('M004', 'EL202'),
('M005', 'EL301'),
('M006', 'EL302'),
('M007', 'EL401');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`kode_dos`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`Kode_MK`);

--
-- Indeks untuk tabel `mengajar`
--
ALTER TABLE `mengajar`
  ADD PRIMARY KEY (`kode_dos`,`kode_mk`),
  ADD KEY `kode_mk` (`kode_mk`);

--
-- Indeks untuk tabel `mengambil`
--
ALTER TABLE `mengambil`
  ADD PRIMARY KEY (`NIM`,`Kode_MK`),
  ADD KEY `Kode_MK` (`Kode_MK`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `mengajar`
--
ALTER TABLE `mengajar`
  ADD CONSTRAINT `mengajar_ibfk_1` FOREIGN KEY (`kode_dos`) REFERENCES `dosen` (`kode_dos`) ON DELETE CASCADE,
  ADD CONSTRAINT `mengajar_ibfk_2` FOREIGN KEY (`kode_mk`) REFERENCES `matakuliah` (`Kode_MK`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mengambil`
--
ALTER TABLE `mengambil`
  ADD CONSTRAINT `mengambil_ibfk_1` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`) ON DELETE CASCADE,
  ADD CONSTRAINT `mengambil_ibfk_2` FOREIGN KEY (`Kode_MK`) REFERENCES `matakuliah` (`Kode_MK`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

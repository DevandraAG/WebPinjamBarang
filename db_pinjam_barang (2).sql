-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2024 at 06:42 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pinjam_barang`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_barang`
--

CREATE TABLE `data_barang` (
  `nama_barang` varchar(50) NOT NULL,
  `jumlah_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_barang`
--

INSERT INTO `data_barang` (`nama_barang`, `jumlah_barang`) VALUES
('', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pemberitahuan`
--

CREATE TABLE `pemberitahuan` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `keterangan` varchar(1000) NOT NULL,
  `status` enum('terima','tolak') NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemberitahuan`
--

INSERT INTO `pemberitahuan` (`id`, `username`, `keterangan`, `status`, `timestamp`) VALUES
(15, 'budi_kun', 'Permintaan Peminjaman Barang Anda Telah di Terima. 1 buah LCD. Username: budi_kun. Silahkan ke bagian Sarpras untuk mengampil barang', 'terima', '2018-11-10 15:13:01'),
(17, 'adlubagus94', 'Permintaan Peminjaman Barang Anda Telah di Terima. 1 buah LCD. Username: adlubagus94. Silahkan ke bagian Sarpras untuk mengampil barang', 'terima', '2018-11-11 01:42:05'),
(19, 'adlubagus94', 'Permintaan Peminjaman Barang Anda Telah di Terima. 2 buah Speaker kecil. Username: adlubagus94. Silahkan ke bagian Sarpras untuk mengampil barang', 'terima', '2018-11-11 01:55:54'),
(20, 'adlubagus94', 'Permintaan Pengembalian Barang Anda Telah di Terima.  buah . Username: ', '', '2018-11-11 01:56:40'),
(21, 'usertest123', 'Permintaan Peminjaman Barang Anda Telah di Terima. 1 buah LCD. Username: usertest123. Silahkan ke bagian Sarpras untuk mengampil barang', 'terima', '2018-11-11 05:30:46'),
(22, 'usertest123', 'Permintaan Pengembalian Barang Anda Telah di Terima.  buah . Username: ', '', '2018-11-11 05:31:51');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `gambar_barang` varchar(100) NOT NULL,
  `stok_barang` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`id`, `nama_barang`, `gambar_barang`, `stok_barang`) VALUES
(1, 'LCD ', 'projektor2.jpeg', 40),
(2, 'Sapu', 'sapu.jpg', 33),
(3, 'Pengki', 'cikrak.jpg', 25),
(4, 'Speaker kecil', 'spiker.jpg', 25),
(26, 'Terminal', '5000799_0445182c-0725-49a5-81a7-trminal.jpg', 10),
(28, 'Sepatu', 'sepatu.jpg', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pinjam`
--

CREATE TABLE `tbl_pinjam` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `peminjam` varchar(100) NOT NULL,
  `level` varchar(50) NOT NULL,
  `jml_barang` int(50) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pinjam`
--

INSERT INTO `tbl_pinjam` (`id`, `nama_barang`, `peminjam`, `level`, `jml_barang`, `tgl_pinjam`, `tgl_kembali`) VALUES
(2, 'LCD', 'Ariq', 'Siswa', 5, '2023-09-09', '2023-09-11'),
(3, 'Terminal', 'admin     ', 'XI ORACLE', 2, '2024-02-01', '2024-02-08'),
(4, 'LCD', 'admin     ', 'XII ORACLE', 1, '2024-02-05', '2024-02-08'),
(5, 'Cikrak', 'diki      ', 'XII ORACLE', 15, '2024-02-05', '2024-02-14'),
(6, 'LCD', 'diki      ', 'XII ORACLE', 1, '2024-02-05', '2024-02-16'),
(7, 'Sapu', 'diki      ', 'XI ORACLE', 11, '2024-02-21', '2024-02-24'),
(8, 'LCD', 'diki      ', 'XI ORACLE', 2, '2024-02-14', '2024-02-16'),
(9, 'Sapu', 'Asep', 'Siswa', 1, '2023-09-04', '2023-09-13'),
(10, 'LCD EPSON', 'budi_kun  ', 'XI ORACLE', 10, '2024-02-27', '2024-02-28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_request`
--

CREATE TABLE `tbl_request` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `peminjam` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL,
  `jml_barang` int(11) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_request`
--

INSERT INTO `tbl_request` (`id`, `nama_barang`, `peminjam`, `level`, `jml_barang`, `tgl_pinjam`, `tgl_kembali`) VALUES
(10, 'Sapu', '                                        diki      ', 'XI ORALCE', 1, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_req_kembali`
--

CREATE TABLE `tbl_req_kembali` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `peminjam` varchar(50) NOT NULL,
  `level` varchar(50) NOT NULL,
  `jml_barang` int(11) NOT NULL,
  `tgl_pinjam` varchar(50) NOT NULL,
  `tgl_kembali` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_req_kembali`
--

INSERT INTO `tbl_req_kembali` (`id`, `nama_barang`, `peminjam`, `level`, `jml_barang`, `tgl_pinjam`, `tgl_kembali`) VALUES
(1, 'Sapu', 'Diki', 'Siswa', 2, '2023-09-03', '2023-09-05');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `peminjam` varchar(100) NOT NULL,
  `level` varchar(50) NOT NULL,
  `jml_barang` int(11) NOT NULL,
  `tgl_pinjam` varchar(50) NOT NULL,
  `tgl_kembali` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id`, `nama_barang`, `peminjam`, `level`, `jml_barang`, `tgl_pinjam`, `tgl_kembali`) VALUES
(1, 'Terminal', 'budi_kun', 'XI RPL 2', 10, '12 November 2018 - 07:30 ', '12 November 2018 - 16:00 '),
(2, 'Terminal', 'adlubagus94', 'XII RPL 1', 2, '10 November 2018 - 15:00 ', '10 November 2018 - 16:00 '),
(3, 'Terminal', 'bagusi', 'X TKJ 3', 2, '12 November 2018 - 12:35 ', '12 November 2018 - 16:10 '),
(4, 'LCD', 'bagusi', 'X TKJ 3', 1, '14 November 2018 - 09:00 ', '14 November 2018 - 11:30 '),
(5, 'LCD', 'budi_kun', 'XI RPL 2', 1, '14 November 2018 - 09:00 ', '14 November 2018 - 11:30 '),
(6, 'LCD', 'adlubagus94', 'XII RPL 1', 1, '12 November 2018 - 07:30 ', '12 November 2018 - 10:00 '),
(7, 'Speaker kecil', 'adlubagus94', 'XII RPL 1', 2, '13 November 2018 - 10:00 ', '13 November 2018 - 12:00 '),
(8, 'LCD', 'usertest123', 'xii rpl', 1, '20 November 2018 - 16:00 ', '21 November 2018 - 13:25 ');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `level`) VALUES
(2, 'admin', 'admin', 'admin123', 'Guru'),
(3, 'Adlu Bagus I.', 'adlubagus94', 'adlu123', 'Siswa'),
(4, 'Budi Serizawa', 'budi_kun', 'budi13', 'Siswa'),
(5, 'Bagus Irawan', 'bagusi', 'bagus100', 'Siswa'),
(6, 'user test', 'diki', 'diki123', 'Siswa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pinjam`
--
ALTER TABLE `tbl_pinjam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_request`
--
ALTER TABLE `tbl_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_req_kembali`
--
ALTER TABLE `tbl_req_kembali`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pemberitahuan`
--
ALTER TABLE `pemberitahuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tbl_pinjam`
--
ALTER TABLE `tbl_pinjam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_request`
--
ALTER TABLE `tbl_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_req_kembali`
--
ALTER TABLE `tbl_req_kembali`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

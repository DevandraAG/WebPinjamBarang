<?php
session_start();
include '../config.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Perbaikan 1: Menggunakan MySQLi
    $mysqli = new mysqli("localhost", "root", "", "db_pinjam_barang");

    if ($mysqli->connect_error) {
        die("Koneksi ke database gagal: " . $mysqli->connect_error);
    }

    // Perbaikan 2: Gunakan parameterized query untuk menghindari SQL injection
    $stmt = $mysqli->prepare("DELETE FROM tbl_barang WHERE id=?");
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        echo "<script>alert('Data berhasil dihapus');</script>";
        echo "<script>window.location.href='index.php';</script>";
    } else {
        echo "Gagal menghapus data;";
    }

    // Jangan lupa untuk menutup koneksi ke database setelah selesai
    $stmt->close();
    $mysqli->close();
} else {
    echo "ID Barang tidak diberikan";
    exit;
}
?>


<?php
$koneksi = mysqli_connect("localhost","root","","db_pinjam_barang");

// Check connection
if (mysqli_connect_errno()){
    echo "Koneksi database gagal : " . mysqli_connect_error();
}

// menangkap data yang di kirim dari form
$nama_barang = $_POST['nama_barang'];
$stok_barang = $_POST['stok_barang'];

// Mendapatkan informasi file gambar yang diunggah
$gambar_barang = $_FILES['gambar_barang']['name'];
$tmp_gambar = $_FILES['gambar_barang']['tmp_name'];
$folder = "uploads/"; // Folder untuk menyimpan gambar

// Memindahkan gambar ke folder yang ditentukan
move_uploaded_file($tmp_gambar, $folder.$gambar_barang);

// Menghindari SQL Injection
$nama_barang = mysqli_real_escape_string($koneksi, $nama_barang);
$stok_barang = mysqli_real_escape_string($koneksi, $stok_barang);
$gambar_barang = mysqli_real_escape_string($koneksi, $folder.$gambar_barang);

// Menginput data ke database
$query = "INSERT INTO tbl_barang (nama_barang, gambar_barang, stok_barang) VALUES ('$nama_barang','$gambar_barang', '$stok_barang')";
$result = mysqli_query($koneksi, $query);

if ($result) {
    // set pesan notification
    session_start();
    $_SESSION['success_message'] = "Data berhasil ditambahkan!";
    echo "<script>alert('Data berhasil ditambahkan!');</script>";

    // Mengalihkan halaman kembali ke admin.php
    header("location:data-barang.php");
} else {
    // Jika query gagal dijalankan
    echo "Error: " . mysqli_error($koneksi);
}

mysqli_close($koneksi);
?>

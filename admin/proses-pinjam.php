<?php
include '../config.php';

if (isset($_GET['id']) && isset($_GET['mode']) && !empty($_GET['id']) && !empty($_GET['mode'])) {
    $id = $_GET['id'];
    $search_request = mysqli_query($koneksi, "SELECT * FROM tbl_request WHERE id='$id'");
    $data_request = mysqli_fetch_array($search_request);

    if ($data_request) {
        $id_request = $data_request['id'];
        $nama_barang_request = $data_request['nama_barang'];
        $peminjam_request = $data_request['peminjam'];
        $level_request = $data_request['level'];
        $jml_barang_request = $data_request['jml_barang'];
        $tgl_pinjam_request = $data_request['tgl_pinjam'];
        $tgl_kembali_request = $data_request['tgl_kembali'];

        if ($_GET['mode'] == "pinjam") {
            $query_search_barang = mysqli_query($koneksi, "SELECT * FROM tbl_barang WHERE nama_barang = '$nama_barang_request'");
            $data_search_barang = mysqli_fetch_array($query_search_barang);
            if ($data_search_barang) {
                $stok_barang = $data_search_barang['stok_barang'];

                if ($stok_barang >= $jml_barang_request) {
                    // Update stok barang
                    $stok_terbaru = $stok_barang - $jml_barang_request;
                    $update_stok = mysqli_query($koneksi, "UPDATE tbl_barang SET stok_barang = '$stok_terbaru' WHERE nama_barang = '$nama_barang_request'");
                    if ($update_stok) {
                        // Insert ke tbl_pinjam
                        $insert_pinjam = mysqli_query($koneksi, "INSERT INTO tbl_pinjam (nama_barang, peminjam, level, jml_barang, tgl_pinjam, tgl_kembali) VALUES ('$nama_barang_request', '$peminjam_request', '$level_request', '$jml_barang_request', '$tgl_pinjam_request', '$tgl_kembali_request')");
                        if ($insert_pinjam) {
                            // Hapus dari tbl_request
                            $delete_request = mysqli_query($koneksi, "DELETE FROM tbl_request WHERE id = '$id_request'");
                            if ($delete_request) {
                                $konten = "Permintaan Peminjaman Barang Anda Telah di Proses. " . $jml_barang_request . " buah " . $nama_barang_request . ". Username: " . $peminjam_request . ". Silahkan ke bagian Sarpras untuk mengambil barang";
                                // Insert pemberitahuan
                                $insert_pemberitahuan = mysqli_query($koneksi, "INSERT INTO pemberitahuan (username, konten, status) VALUES ('$peminjam_request', '$konten', 'proses')");

                                if ($insert_pemberitahuan) {
                                    echo "<script>alert('Berhasil Memproses Permintaan');</script>";
                                    echo "<script>window.history.back();</script>";
                                } else {
                                    // Menampilkan pesan kesalahan MySQL jika ada
                                    echo "Gagal Menambah Pemberitahuan: " . mysqli_error($koneksi);
                                }
                            } else {
                                echo "Gagal Menghapus dari tbl_request";
                            }
                        } else {
                            echo "Gagal menambah ke tbl_pinjam";
                        }
                    } else {
                        echo "Tidak bisa update data barang";
                    }
                } else {
                    echo "Stok barang tidak mencukupi untuk peminjaman ini";
                }
            } else {
                echo "Tidak bisa mencari barang";
            }
        } else if ($_GET['mode'] == "tolak") {
            // Hapus dari tbl_request
            $delete_request = mysqli_query($koneksi, "DELETE FROM tbl_request WHERE id = '$id_request'");
            if ($delete_request) {
                $konten = "Maaf! Permintaan Peminjaman Barang Anda di Tolak. " . $jml_barang_request . " buah " . $nama_barang_request . ". Username: " . $peminjam_request;
                // Insert pemberitahuan
                $insert_pemberitahuan = mysqli_query($koneksi, "INSERT INTO pemberitahuan (username, konten, status) VALUES ('$peminjam_request', '$konten', 'tolak')");
                if ($insert_pemberitahuan) {
                    echo "<script>alert('Berhasil Menolak Permintaan');</script>";
                    echo "<script>window.history.back();</script>";
                } else {
                    echo "Gagal Menambah Pemberitahuan";
                }
            } else {
                echo "Gagal Menghapus dari tbl_request";
            }
        }
    } else {
        echo "Data Permintaan tidak ditemukan";
    }
} else {
    echo "Parameter tidak lengkap";
}

?>

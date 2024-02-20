<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }

    .container {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        color: #333;
    }

    .form-group {
        margin-bottom: 20px;
    }

    label {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
        color: #555;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }

    .btn-primary {
        background-color: #007BFF;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }

</style>

<?php
session_start();
include '../config.php';

if(isset($_POST['submit'])) {
    $id = $_POST['id'];
    $nama_barang = $_POST['nama_barang'];
    $stok_barang = $_POST['stok_barang'];

    // Perbaikan 1: Menggunakan MySQLi
    $mysqli = new mysqli("localhost", "root", "", "db_pinjam_barang");

    if ($mysqli->connect_error) {
        die("Koneksi ke database gagal: " . $mysqli->connect_error);
    }

    // Perbaikan 2: Gunakan parameterized query untuk menghindari SQL injection
    $stmt = $mysqli->prepare("UPDATE tbl_barang SET nama_barang=?, stok_barang=? WHERE id=?");
    $stmt->bind_param("ssi", $nama_barang, $stok_barang, $id);

    if ($stmt->execute()) {
        echo "<script>alert('Data berhasil diperbarui');</script>";
        echo "<script>window.location.href='index.php';</script>";
    } else {
        echo "Gagal memperbarui data;";
    }

    // Jangan lupa untuk menutup koneksi ke database setelah selesai
    $stmt->close();
    $mysqli->close();
} else {
    if(isset($_GET['id'])) {
        $id = $_GET['id'];

        // Perbaikan 1: Menggunakan MySQLi
        $mysqli = new mysqli("localhost", "root", "", "db_pinjam_barang");

        if ($mysqli->connect_error) {
            die("Koneksi ke database gagal: " . $mysqli->connect_error);
        }

        // Perbaikan 2: Gunakan parameterized query untuk menghindari SQL injection
        $stmt = $mysqli->prepare("SELECT * FROM tbl_barang WHERE id=?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $data = $result->fetch_assoc();
            $nama_barang = $data['nama_barang'];
            $stok_barang = $data['stok_barang'];
        } else {
            echo "Data tidak ditemukan";
            exit;
        }

        // Jangan lupa untuk menutup koneksi ke database setelah selesai
        $stmt->close();
        $mysqli->close();
    } else {
        echo "ID Barang tidak diberikan";
        exit;
    }
}
?>

<!doctype html>
<html class="no-js" lang="">
<head>
    <!-- ... (kode lainnya tetap sama) ... -->
</head>
<body>
    <!-- ... (kode lainnya tetap sama) ... -->

    <form method="POST" action="">
        <input type="hidden" name="id" value="<?php echo $id; ?>">
        <div class="form-group">
            <label for="nama_barang">Nama Barang</label>
            <input type="text" class="form-control" id="nama_barang" name="nama_barang" value="<?php echo $nama_barang; ?>">
        </div>
        <div class="form-group">
            <label for="stok_barang">Stok Barang</label>
            <input type="text" class="form-control" id="stok_barang" name="stok_barang" value="<?php echo $stok_barang; ?>">
        </div>
        <button type="submit" name="submit" class="btn btn-primary">Simpan Perubahan</button>
    </form>
                          </div>
                          
                  </div>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
            </div>
            </div>
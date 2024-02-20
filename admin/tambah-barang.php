<head>
    <title>Form Tambah Barang</title>
   <style>body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.container {
    width: 50%;
    margin: auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
}

form {
    margin-top: 20px;
}

form input[type="text"],
form input[type="file"] {
    width: calc(100% - 20px);
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 3px;
    box-sizing: border-box;
}

form input[type="submit"] {
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    border: none;
    border-radius: 3px;
    background-color: #4caf50;
    color: #fff;
    cursor: pointer;
    transition: background-color 0.3s;
}

form input[type="submit"]:hover {
    background-color: #45a049;
}

.error {
    color: #f00;
}
 </style>
	
</head>


<a href="data-barang.php"><button type="button" class="btn btn-outline-danger">KEMBALI</button></a>
	<br/>

	<br/>
	<body>
	<h3><p align="center">TAMBAH DATA BARANG</p></h3>
	<form method="post" action="proses-tambah.php">
		<table>
			<tr>			
				<td>Nama Barang</td>
				<td><input type="text" name="Nama Barang"></td>
			</tr>
			<tr>
				<td>Jumlah Barang</td>
				<td><input type="text" name="Stock barang"></td>
			</tr>
        Pilih foto: <input type="file" name="foto" id="foto"><br>
        
    </form>
			<tr>
				<td></td>
				<td><input type="submit" value="SIMPAN"></td>
			</tr>	
</body>	
		</table>
	</form>
	<script>
		//Tampilkan notifikasi
		function showNotification(message) {
			const notification = document.createElement("div");
			notification.className = "notification";
			notification.textContent = message;
			document.body.appendChild(notification);

			//Hilangkan notification setelah 4 detik
			setTimeout(functiion() {
				document.body.removeChild(notification);
			}, 4); //4000 milidetik = 4 detik
		}
</script>
</body>
</html>
<?php
$currentDate = date("Y-m-d H:i:s");
$conn = mysqli_connect('localhost', 'root', 'tesdoang', 'belajar_basisdata');
if (!$conn) {
    die('errro');
}

if(isset($_POST['username'])) {
    try {
        $query = "INSERT INTO pegawai (username, password, nama_pegawai, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat, no_telp, jabatan, created_at, updated_at, deleted_at, status_data) 
        VALUES ('$_POST[username]', '$_POST[password]', '$_POST[nama_pegawai]', '$_POST[tempat_lahir]', '$_POST[tanggal_lahir]', '$_POST[jenis_kelamin]', '$_POST[alamat]', '$_POST[no_telp]', '$_POST[jabatan]', '$currentDate', NULL, NULL, '$_POST[status_data]')";
        mysqli_query($conn, $query);
        header('location: tampilan.php');
        
    } catch (\Throwable $er) {
        echo (" (tambah.php) pesan: " . $er);
    
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tambah Data</title>
</head>
<body>
    <form action="" method="post">
        <input style="display: block;" type="text" name="username" id="" placeholder="username">
        <input style="display: block;" type="text" name="password" id="" placeholder="password">
        <input style="display: block;" type="text" name="nama_pegawai" id="" placeholder="nama_pegawai">
        <input style="display: block;" type="text" name="tempat_lahir" id="" placeholder="tempat_lahir">
        <input style="display: block;" type="text" name="tanggal_lahir" id="" placeholder="tanggal_lahir">
        <input style="display: block;" type="text" name="jenis_kelamin" id="" placeholder="jenis_kelamin">
        <input style="display: block;" type="text" name="alamat" id="" placeholder="alamat">
        <input style="display: block;" type="text" name="no_telp" id="" placeholder="no_telp">
        <input style="display: block;" type="text" name="jabatan" id="" placeholder="jabatan">
        <input style="display: block;" type="text" name="status_data" id="" placeholder="status_data">
        <button type="submit">Submit</button>
    </form>
</body>
</html>
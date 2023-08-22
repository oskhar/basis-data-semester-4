<?php
$currentDate = date("Y-m-d H:i:s");
$conn = mysqli_connect('localhost', 'root', 'tesdoang', 'belajar_basisdata');
if (!$conn) {
    die('errro');
}

try {
    $query = 'SELECT * FROM pegawai WHERE id_pegawai='.$_GET['id_pegawai'];
    $result = mysqli_query($conn, $query);
    $dataPegawai = mysqli_fetch_array($result);
} catch (\Throwable $er) {
    echo (" (hapus.php) pesan: " . $er);

}

if(isset($_POST['username'])) {
    try {
        $query = "UPDATE pegawai SET status_data='$_POST[status_data]', deleted_at='$currentDate' WHERE id_pegawai=".$_POST['id_pegawai'];
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
    <title>Hapus Data</title>
</head>
<body>
    <form action="" method="post">
        <input style="display: block;" type="hidden" name="id_pegawai" id="" placeholder="id_pegawai" value="<?= $dataPegawai['id_pegawai'] ?>" readonly>
        <input style="display: block;" type="text" name="username" id="" placeholder="username" value="<?= $dataPegawai['username'] ?>" readonly>
        <input style="display: block;" type="text" name="nama_pegawai" id="" placeholder="nama_pegawai" value="<?= $dataPegawai['nama_pegawai'] ?>" readonly>
        <select name="status_data" id="">
            <option value="active">active</option>
            <option value="unactive">unactive</option>
        </select>
        <br>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
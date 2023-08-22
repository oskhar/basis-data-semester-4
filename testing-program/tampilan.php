<?php
$conn = mysqli_connect('localhost', 'root', 'tesdoang', 'belajar_basisdata');
if (!$conn) {
    die('errro');
}

$query = 'SELECT * FROM pegawai WHERE status_data="active"';
$result = mysqli_query($conn, $query);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <a href="tambah.php">Tambah Data</a>
    <a href="su.php">Pegawai su</a>
    <table border="1" cellpadding="10" cellspacing="0">
        <thead>
            <tr>
                <th>id_pegawai</th>
                <th>username</th>
                <th>password</th>
                <th>nama_pegawai</th>
                <th>tempat_lahir</th>
                <th>tanggal_lahir</th>
                <th>jenis_kelamin</th>
                <th>alamat</th>
                <th>no_telp</th>
                <th>jabatan</th>
                <th>created_at</th>
                <th>updated_at</th>
                <th>deleted_at</th>
                <th>status_data</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
        <?php while($data = mysqli_fetch_assoc($result)): ?>
            <tr>
                <td><?= $data['id_pegawai'] ?></td>
                <td><?= $data['username'] ?></td>
                <td><?= $data['password'] ?></td>
                <td><?= $data['nama_pegawai'] ?></td>
                <td><?= $data['tempat_lahir'] ?></td>
                <td><?= $data['tanggal_lahir'] ?></td>
                <td><?= $data['jenis_kelamin'] ?></td>
                <td><?= $data['alamat'] ?></td>
                <td><?= $data['no_telp'] ?></td>
                <td><?= $data['jabatan'] ?></td>
                <td><?= $data['created_at'] ?></td>
                <td><?= $data['updated_at'] ?></td>
                <td><?= $data['deleted_at'] ?></td>
                <td><?= $data['status_data'] ?></td>
                <td><a href="">Ubah</a> | <a href="hapus.php?id_pegawai=<?= $data['id_pegawai'] ?>">Hapus</a></td>
            </tr>
        <?php endwhile; ?>
        </tbody>
    </table>

</body>
</html>
<?php

$conn = mysqli_connect("localhost", "root", "tesdoang", "belajar_basisdata");
if (!$conn) {
    die("error");
}
$query = "SELECT * FROM penyewa";
$result = mysqli_query($conn, $query);


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="widtd=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <table border="1" cellpadding="10" cellspacing="0">
        <thead>
            <tr>
                <th>nik</th>
                <th>nama</th>
                <th>tempat_lahir</th>
                <th>tanggal_lahir</th>
                <th>jenis_kelamin</th>
                <th>alamat</th>
                <th>agama</th>
                <th>status_pernikahan</th>
                <th>pekerjaan</th>
                <th>kewarganegaraan</th>
                <th>created_at</th>
                <th>updated_at</th>
                <th>deleted_at</th>
                <th>status_data</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = mysqli_fetch_assoc($result)): ?>
                <tr>
                    <td>
                        <?= $row['nik'] ?>
                    </td>
                    <td>
                        <?= $row['nama'] ?>
                    </td>
                    <td>
                        <?= $row['tempat_lahir'] ?>
                    </td>
                    <td>
                        <?= $row['tanggal_lahir'] ?>
                    </td>
                    <td>
                        <?= $row['jenis_kelamin'] ?>
                    </td>
                    <td>
                        <?= $row['alamat'] ?>
                    </td>
                    <td>
                        <?= $row['agama'] ?>
                    </td>
                    <td>
                        <?= $row['status_pernikahan'] ?>
                    </td>
                    <td>
                        <?= $row['pekerjaan'] ?>
                    </td>
                    <td>
                        <?= $row['kewarganegaraan'] ?>
                    </td>
                    <td>
                        <?= $row['created_at'] ?>
                    </td>
                    <td>
                        <?= $row['updated_at'] ?>
                    </td>
                    <td>
                        <?= $row['deleted_at'] ?>
                    </td>
                    <td>
                        <?= $row['status_data'] ?>
                    </td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</body>

</html>
<script>
    console.log(<?= json_encode() ?>);
</script>
<?php

$conn = mysqli_connect("localhost", "root", "tesdoang", "belajar_basisdata");
if (!$conn) {
    die("error");
}
$limit = isset($_GET['halaman']) ? "LIMIT " . ($_GET['halaman'] * 100) . ", 100" : "";
$query = mysqli_query($conn, "SELECT nik, nama, tanggal_lahir, jenis_kelamin, alamat, kewarganegaraan, status_data FROM penyewa ORDER BY `nik` $limit");

$rows = array();
while ($row = mysqli_fetch_assoc($query)) {
    array_push($rows, $row);
}

print json_encode($rows);
?>
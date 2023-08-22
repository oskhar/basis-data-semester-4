<?php

$conn = mysqli_connect("localhost", "root", "tesdoang", "belajar_basisdata");
if (!$conn) {
    die("error");
}
$limit = isset($_GET['range']) ? "LIMIT $_GET[range], 5" : "";
$query = mysqli_query($conn, "SELECT * FROM penyewa $limit");

$rows = array();
while ($row = mysqli_fetch_assoc($query)) {
    array_push($rows, $row);
}

print json_encode($rows);
?>
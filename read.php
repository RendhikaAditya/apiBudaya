<?php

include 'koneksi.php';
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');
header('Access-Control-Allow-Origin: *');


// Fungsi untuk membaca data dari tabel budat=ya
function bacaDataKebudayaan() {
    global $koneksi;
    $sql = "SELECT * FROM data_kebudayaan_bali";
    $result = mysqli_query($koneksi, $sql);
    $data = array();
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }
    }
    return $data;
}

// Fungsi untuk membaca data dari tabel pegawai
function bacaDataSejarawan() {
    global $koneksi;
    $sql = "SELECT * FROM tb_sejarawan";
    $result = mysqli_query($koneksi, $sql);
    $data = array();
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }
    }
    return $data;
}

// Fungsi untuk membaca data dari tabel galeri
function bacaDataGaleri() {
    global $koneksi;
    $sql = "SELECT * FROM tb_galeri";
    $result = mysqli_query($koneksi, $sql);
    $data = array();
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }
    }
    return $data;
}

// Fungsi untuk membaca data dari tabel user
function bacaDataUser() {
    global $koneksi;
    $sql = "SELECT * FROM tb_user";
    $result = mysqli_query($koneksi, $sql);
    $data = array();
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }
    }
    return $data;
}

// Fungsi untuk mengembalikan response API
function kirimResponse($sukses, $status, $pesan, $data) {
    $response = [
        'sukses' => $sukses,
        'status' => $status,
        'pesan' => $pesan,
        'data' => $data
    ];
    echo json_encode($response);
}

// Endpoint untuk membaca data berita
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['data']) && $_GET['data'] === 'budaya') {
    $data = bacaDataKebudayaan();
    kirimResponse(true, 200, 'Data berita berhasil diambil', $data);
}

// Endpoint untuk membaca data pegawai
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['data']) && $_GET['data'] === 'sejarawan') {
    $data = bacaDataSejarawan();
    kirimResponse(true, 200, 'Data pegawai berhasil diambil', $data);
}

// Endpoint untuk membaca data galeri
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['data']) && $_GET['data'] === 'galeri') {
    $data = bacaDataGaleri();
    kirimResponse(true, 200, 'Data galeri berhasil diambil', $data);
}

// Endpoint untuk membaca data user
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['data']) && $_GET['data'] === 'user') {
    $data = bacaDataUser();
    kirimResponse(true, 200, 'Data user berhasil diambil', $data);
}

// Menutup koneksi database
mysqli_close($koneksi);
?>

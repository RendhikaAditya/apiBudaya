<?php
// include file koneksi.php
include 'koneksi.php';
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');
header('Access-Control-Allow-Origin: *');


// Fungsi Create (Tambah Data)
function tambahDataSejarawan($data) {
    global $koneksi;

    $nama_sejarawan = $data['nama_sejarawan'];
    $foto_sejarawan = $data['foto_sejarawan'];
    $tanggal_lahir = $data['tanggal_lahir'];
    $asal = $data['asal'];
    $jenis_kelamin = $data['jenis_kelamin'];
    $deskripsi = $data['deskripsi'];

    $query = "INSERT INTO sejarawan (nama_sejarawan, foto_sejarawan, tanggal_lahir, asal, jenis_kelamin, deskripsi) VALUES ('$nama_sejarawan', '$foto_sejarawan', '$tanggal_lahir', '$asal', '$jenis_kelamin', '$deskripsi')";

    if(mysqli_query($koneksi, $query)) {
        $response = [
            'sukses' => true,
            'status' => 200,
            'pesan' => 'Data sejarawan berhasil ditambahkan'
        ];
    } else {
        $response = [
            'sukses' => false,
            'status' => 500,
            'pesan' => 'Gagal menambahkan data sejarawan: ' . mysqli_error($koneksi)
        ];
    }

    return json_encode($response);
}

// Fungsi Read (Ambil Data)
function ambilData() {
    global $koneksi;

    $query = "SELECT * FROM sejarawan";
    $result = mysqli_query($koneksi, $query);

    $data = array();
    while($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;
    }

    return json_encode($data);
}

// Fungsi Update (Edit Data)
function editData($id, $data) {
    global $koneksi;

    $nama_sejarawan = $data['nama_sejarawan'];
    $foto_sejarawan = $data['foto_sejarawan'];
    $tanggal_lahir = $data['tanggal_lahir'];
    $asal = $data['asal'];
    $jenis_kelamin = $data['jenis_kelamin'];
    $deskripsi = $data['deskripsi'];

    $query = "UPDATE sejarawan SET nama_sejarawan='$nama_sejarawan', foto_sejarawan='$foto_sejarawan', tanggal_lahir='$tanggal_lahir', asal='$asal', jenis_kelamin='$jenis_kelamin', deskripsi='$deskripsi' WHERE id=$id";

    if(mysqli_query($koneksi, $query)) {
        $response = [
            'sukses' => true,
            'status' => 200,
            'pesan' => 'Data sejarawan berhasil diperbarui'
        ];
    } else {
        $response = [
            'sukses' => false,
            'status' => 500,
            'pesan' => 'Gagal memperbarui data sejarawan: ' . mysqli_error($koneksi)
        ];
    }

    return json_encode($response);
}

// Fungsi Delete (Hapus Data)
function hapusData($id) {
    global $koneksi;

    $query = "DELETE FROM sejarawan WHERE id=$id";

    if(mysqli_query($koneksi, $query)) {
        $response = [
            'sukses' => true,
            'status' => 200,
            'pesan' => 'Data sejarawan berhasil dihapus'
        ];
    } else {
        $response = [
            'sukses' => false,
            'status' => 500,
            'pesan' => 'Gagal menghapus data sejarawan: ' . mysqli_error($koneksi)
        ];
    }

    return json_encode($response);
}


// Main Program
$method = $_SERVER['REQUEST_METHOD'];

switch ($method) {
    case 'GET':
        // Ambil data
        echo ambilData();
        break;
    case 'POST':
        // Cek jika parameter action ada
        if(isset($_POST['action'])) {
            $action = $_POST['action'];
            // Cek jenis action
            switch ($action) {
                case 'tambah':
                    // Tambah data
                    echo tambahData($_POST);
                    break;
                case 'edit':
                    // Cek jika parameter id_pegawai ada
                    if(isset($_POST['id_pegawai'])) {
                        $id = $_POST['id_pegawai'];
                        // Edit data
                        echo editData($id, $_POST);
                    } else {
                        echo json_encode(['sukses' => false, 'status' => 400, 'pesan' => 'ID pegawai tidak ditemukan']);
                    }
                    break;
                case 'hapus':
                    // Cek jika parameter id_pegawai ada
                    if(isset($_POST['id_pegawai'])) {
                        $id = $_POST['id_pegawai'];
                        // Hapus data
                        echo hapusData($id);
                    } else {
                        echo json_encode(['sukses' => false, 'status' => 400, 'pesan' => 'ID pegawai tidak ditemukan']);
                    }
                    break;
                default:
                    echo json_encode(['sukses' => false, 'status' => 400, 'pesan' => 'Aksi tidak valid']);
                    break;
            }
        } else {
            echo json_encode(['sukses' => false, 'status' => 400, 'pesan' => 'Aksi tidak ditemukan']);
        }
        break;
    default:
        http_response_code(405);
        echo json_encode(['sukses' => false, 'status' => 405, 'pesan' => 'Method tidak diizinkan']);
        break;
}
?>

<?php
// include file koneksi.php
include 'koneksi.php';
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');
header('Access-Control-Allow-Origin: *');


// Fungsi tambah data sejarawan
    function tambahDataSejarawan($data) {
        global $koneksi;

        $nama_sejarawan = $data['nama_sejarawan'];
        $foto_sejarawan = uploadFoto($data['foto_sejarawan']);
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

    // Fungsi upload foto
    function uploadFoto($foto) {
        $target_dir = "/gambar/";
        $target_file = $target_dir . basename($foto["name"]);
        $uploadOk = 1;
        $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
        
        // Check if image file is a actual image or fake image
        $check = getimagesize($foto["tmp_name"]);
        if($check !== false) {
            $uploadOk = 1;
        } else {
            $uploadOk = 0;
        }
        
        // Check if file already exists
        if (file_exists($target_file)) {
            $uploadOk = 0;
        }
        
        // Check file size
        if ($foto["size"] > 500000) {
            $uploadOk = 0;
        }
        
        // Allow certain file formats
        if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
        && $imageFileType != "gif" ) {
            $uploadOk = 0;
        }
        
        // Check if $uploadOk is set to 0 by an error
        if ($uploadOk == 0) {
            return null;
        // if everything is ok, try to upload file
        } else {
            if (move_uploaded_file($foto["tmp_name"], $_SERVER['DOCUMENT_ROOT'] . $target_file)) {
                return $target_file;
            } else {
                return null;
            }
        }
    }


// Fungsi update data sejarawan
function updateDataSejarawan($id, $data) {
    global $koneksi;

    $nama_sejarawan = $data['nama_sejarawan'];
    $foto_sejarawan = uploadFoto($data['foto_sejarawan']);
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

// Fungsi delete data sejarawan
function hapusDataSejarawan($id) {
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

<?php
// include file koneksi.php
include 'koneksi.php';
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');
header('Access-Control-Allow-Origin: *');

function generateRandomFileName($prefix = '', $suffix = '') {
    // Generate unique ID
    $uniqueId = uniqid();

    // Menggunakan md5 untuk membuat hash dari unique ID
    $randomHash = md5($uniqueId);

    // Menggabungkan prefix, hash acak, dan akhiran file jika diperlukan
    $randomFileName = $prefix . $randomHash . $suffix;

    return $randomFileName;
}

// Fungsi tambah data sejarawan
    function tambahDataSejarawan($data) {
        global $koneksi;

        $nama_sejarawan = $data['nama_sejarawan'];
        $foto_sejarawan = $data['foto_sejarawan'];
        $tanggal_lahir = $data['tanggal_lahir'];
        $asal = $data['asal'];
        $jenis_kelamin = $data['jenis_kelamin'];
        $deskripsi = $data['deskripsi'];

        $outputfile = "gambar/".generateRandomFileName('foto_', '.jpg') ;
        $filehandler = fopen($outputfile, 'wb' ); 
        fwrite($filehandler, base64_decode($foto_sejarawan));
        fclose($filehandler); 

        $query = "INSERT INTO sejarawan (nama_sejarawan, foto_sejarawan, tanggal_lahir, asal, jenis_kelamin, deskripsi) VALUES ('$nama_sejarawan', '$outputfile', '$tanggal_lahir', '$asal', '$jenis_kelamin', '$deskripsi')";

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


    function editData($id, $data) {
        global $koneksi;
    
        $nama_sejarawan = $data['nama_sejarawan'];
        $foto_sejarawan = $data['foto_sejarawan'];
        $tanggal_lahir = $data['tanggal_lahir'];
        $asal = $data['asal'];
        $jenis_kelamin = $data['jenis_kelamin'];
        $deskripsi = $data['deskripsi'];
    
        // Jika ada foto baru, simpan foto baru dan perbaharui path foto
        if (!empty($foto_sejarawan)) {
            $outputfile = "gambar/".generateRandomFileName('foto_', '.jpg');
            $filehandler = fopen($outputfile, 'wb');
            fwrite($filehandler, base64_decode($foto_sejarawan));
            fclose($filehandler);
    
            // Hapus foto lama
            $querySelectFotoLama = "SELECT foto_sejarawan FROM sejarawan WHERE id = '$id'";
            $resultSelectFotoLama = mysqli_query($koneksi, $querySelectFotoLama);
            $row = mysqli_fetch_assoc($resultSelectFotoLama);
            $foto_sejarawan_lama = $row['foto_sejarawan'];
            if (file_exists($foto_sejarawan_lama)) {
                unlink($foto_sejarawan_lama);
            }
    
            // Update path foto
            $query = "UPDATE sejarawan SET nama_sejarawan = '$nama_sejarawan', foto_sejarawan = '$outputfile', tanggal_lahir = '$tanggal_lahir', asal = '$asal', jenis_kelamin = '$jenis_kelamin', deskripsi = '$deskripsi' WHERE id = '$id'";
        } else {
            // Jika tidak ada foto baru, gunakan data lain untuk update
            $query = "UPDATE sejarawan SET nama_sejarawan = '$nama_sejarawan', tanggal_lahir = '$tanggal_lahir', asal = '$asal', jenis_kelamin = '$jenis_kelamin', deskripsi = '$deskripsi' WHERE id = '$id'";
        }
    
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

     // Hapus foto lama
     $querySelectFotoLama = "SELECT foto_sejarawan FROM sejarawan WHERE id = '$id'";
     $resultSelectFotoLama = mysqli_query($koneksi, $querySelectFotoLama);
     $row = mysqli_fetch_assoc($resultSelectFotoLama);
     $foto_sejarawan_lama = $row['foto_sejarawan'];
     if (file_exists($foto_sejarawan_lama)) {
         unlink($foto_sejarawan_lama);
     }
     
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
                    echo tambahDataSejarawan($_POST);
                    break;
                case 'edit':
                    // Cek jika parameter id_pegawai ada
                    if(isset($_POST['id'])) {
                        $id = $_POST['id'];
                        // Edit data
                        echo editData($id, $_POST);
                    } else {
                        echo json_encode(['sukses' => false, 'status' => 400, 'pesan' => 'ID tidak ditemukan']);
                    }
                    break;
                case 'hapus':
                    // Cek jika parameter id ada
                    if(isset($_POST['id'])) {
                        $id = $_POST['id'];
                        // Hapus data
                        echo hapusDataSejarawan($id);
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

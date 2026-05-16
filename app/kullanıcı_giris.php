<?php
session_start();
include("veri_tabanı.php");

// Hata mesajı değişkeni
$hata = "";

// Form gönderildiyse
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $gelenkullaniciadi = $_POST["kullaniciadi"];
    $gelensifre = $_POST["sifre"];

    // Prepared statement (güvenli)
    $stmt = mysqli_prepare($VeritabaniBaglantisi, "SELECT * FROM kullanici WHERE kullaniciadi = ?");
    mysqli_stmt_bind_param($stmt, "s", $gelenkullaniciadi);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if ($result && mysqli_num_rows($result) > 0) {

        $kayit = mysqli_fetch_assoc($result);

        if (password_verify($gelensifre, $kayit["sifre"])) {

            $_SESSION["Kullaniciid"] = $kayit["id"];
            $_SESSION["KullaniciAdi"] = $kayit["kullaniciadi"];

            header("Location: index.php");
            exit();

        } else {
            $hata = "Şifre yanlış!";
        }

    } else {
        $hata = "Kullanıcı bulunamadı!";
    }

    mysqli_stmt_close($stmt);
}

mysqli_close($VeritabaniBaglantisi);
?>

<!DOCTYPE html>
<html lang="tr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kullanıcı Giriş</title>

    <link rel="stylesheet" href="css/kullanıcı_giris.css">
    <link rel="icon" type="image/png" href="profilResimlari/logo.jpg">
</head>

<body>

    <a href="AnaSayfa.php?sayfa=1" class="btn">Ana Sayfa</a>
    <a href="kullanıcı_kayıt.php" class="btn">KAYIT OL</a>

    <div class="container">
        <h2>Kullanıcı Giriş</h2>

        <form action="" method="post">
            Kullanıcı Adı: <input type="text" name="kullaniciadi" required><br>
            Şifre: <input type="password" name="sifre" required><br>
            <input type="submit" value="GİRİŞ YAP">
        </form>

        <?php
        if (!empty($hata)) {
            echo "<p class='message' style='color:red;'>$hata</p>";
        }
        ?>

    </div>

</body>
</html>
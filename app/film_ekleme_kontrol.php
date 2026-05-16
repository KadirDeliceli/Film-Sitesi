<?php
if (isset($_POST["kullaniciadi"]) && isset($_POST["şifre"])) {
    $gelenkullaniciadi = $_POST["kullaniciadi"];
    $gelensifre = $_POST["şifre"];

    if ($gelenkullaniciadi == "admin" && $gelensifre == "admin") {
        header("Location: film_ekle.php");
        exit();
    } else {
        $hata = "Kullanıcı adı veya şifre hatalı...";
    }
}
?>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>Admin Kontrol</title>
</head>
<body>

<?php
if (isset($hata)) {
    echo "<p style='color:red;'>$hata</p>";
}
?>

</body>
</html>
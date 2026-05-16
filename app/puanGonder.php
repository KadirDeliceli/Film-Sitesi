<?php
session_start();
include("veri_tabanı.php");
if(isset($_SESSION["KullaniciAdi"])){
    $KullaniciAdi=$_SESSION["KullaniciAdi"];
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    if (isset($_POST['Mypuan']) && isset($_POST['filmid'])) {
        $puan = $_POST['Mypuan'];
        $filmid = $_POST['filmid'];
            if(isset($_SESSION["KullaniciAdi"])){//kullanıcı giriş yapmışsa
                $kullanici_id = $_SESSION["Kullaniciid"];

                $Sorgu = mysqli_query($VeritabaniBaglantisi, "SELECT * FROM mypuan WHERE kullanici_id = $kullanici_id AND film_id = $filmid");//kullanıcı filmi daha önceden puanlayıp puanlamaığını öğrenmek için

                if ($Sorgu && mysqli_num_rows($Sorgu) > 0) { // Sorgu başarılı yani daha önceden puanlamışşsa
                    $Sorgu2 = mysqli_query($VeritabaniBaglantisi, "UPDATE mypuan SET puan = $puan  WHERE kullanici_id = $kullanici_id AND film_id = $filmid");
                }
                else {//kullanıcı filmi ilk kez puanlıyorsa
                    $Sorgu2 = mysqli_query($VeritabaniBaglantisi, "INSERT INTO mypuan (kullanici_id , film_id , puan) VALUES ($kullanici_id , $filmid , $puan)");
                }
            
            }else{//kullanıcı login olmadan puan vermeye çalışıyor
                    
            }
            mysqli_close($VeritabaniBaglantisi);    
    }
    ?>
</body>
</html>


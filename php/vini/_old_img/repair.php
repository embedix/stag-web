<?php
          error_reporting(E_ALL ^ E_NOTICE);
//echo "<h3>Mimo provoz - bylo zrizeno kvuli problemum na pipni.cz, tady to doufam nebude potreba</h3>";
//die();

$file = 'data/';

// set up basic connection
$conn_id = ftp_connect('stanicar.ic.cz');

// login with username and password
//$login_result = ftp_login($conn_id, 'stanicar', 'stag');
echo "<h3>Pripojen...</h3>";

    if ($handle = opendir('./')) {
     echo "<h4>Adresar otevren</h4>";
     $sum=0;
     while (false !== ($file = readdir($handle))) {
        echo "Mam soubor - ";
        if ($file != "." && $file != "..") {
         echo "jsou to data -";
         $fname=$file;
         if (file_exists("./".$fname)) {
         echo "existuji - ";
/*if (ftp_chmod($conn_id, 0777, './data/'.$fname) !== false) {
 echo "$fname OK<br>\n";
} else */{
 echo "could not chmod $fname - testuji PHP funkci:\n";
 if (chmod ('./'.$fname,0777)) {
  echo "OK - OPRAVENO";
 } else {
  echo "Chyba - NELZE OPRAVIT";
 };
 echo "<br>\n";
}


         };
        }
     };
     closedir($handle);
    } else {
     echo "<h3>Chyba: adresáø se soubory není dostupný!</h3>";
    };

echo "<h3>Ukonceno.</h3>";
// close the connection
ftp_close($conn_id);
?>

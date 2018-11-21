<?
//obejiti vypnute register-globals
foreach ($_GET as $key => $value) {
//   echo "Kl›¿: <b>$key</b>; Hodnota: <b>$value</b><br>\n";

 $$key=$value;
}

  $id*=1;
  $obrid*=1;
  if ($obrid) {
   $id=$id.'_'.$obrid;
  }
  if (File_Exists('img/v_'.$id.'.png')) {
   header('Content-type: image/png');
   $fp=fopen('img/v_'.$id.'.png','rb');
   echo fread($fp,filesize('img/v_'.$id.'.png'));
   fclose($fp);
  } else {
   header('Content-type: image/png');
   include('img/vuz_default.png');
  }
?>

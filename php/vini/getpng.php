<?
  $file=$_GET['file'];
  if (File_Exists('img/'.$file)) {
   header('Content-type: image/png');
   $fp=fopen('img/'.$file,'rb');
   echo fread($fp,filesize('img/'.$file));
   fclose($fp);
  } else {
   header('Content-type: image/png');
   include('img/vuz_default.png');
  }
?>

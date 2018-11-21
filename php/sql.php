<?
 //KNIHOVNA PRO PRACI S DATABAZI
 //verze pro MySQL
 //Ivo Strasil (c) 2004

 //nastaveni
 $sql_server='127.0.0.1';
 $sql_user='';
 $sql_pwd='';
 $sql_db='strasilnet02';

 //Seznam funkci
 // sql_connect()
 // sql_disconnect()
 // logevent($text)

 $sql_ready=0;

 function sql_connect() {
   global $sql_db,$sql_user,$sql_server,$sql_pwd;
   global $sql_id;
   $sql_id=mysqli_connect($sql_server,$sql_user,$sql_pwd);
   if (!$sql_id)
   {
    $sql_id = mysqli_connect("localhost",$sql_db,$sql_pwd);
   }
   if ($sql_id&&mysqli_select_db($sql_id,$sql_db)) {
	 $sql_ready=1;
	 mysqli_set_charset ( $sql_id,'cp1250');
	 return 1;
   } else {
	 echo '<html><meta content="text/html; charset=windows-1250" http-equiv="Content-Type"><body>';
	 echo "<h3><font color=\"red\">CHYBA PŘI PŘIPOJOVÁNÍ K SQL SERVERU - DATABÁZE NENÍ DOSTUPNÁ</font></h3>";
	 die("</body></html>");
	 return 0;
   }
 }

 function sql_disconnect() {
    mysqli_close($sql_id);
    $sql_ready=0;
 }

 function logevent($text) {
  global $REMOTE_ADDR;
  $text=addslashes($text);
  $host=@gethostbyaddr($REMOTE_ADDR);
  $host.=" (".$REMOTE_ADDR.")";
  $sql="INSERT INTO log SET text=\"$text\", user=\"$host\", time=\"".date ("l j. n. Y H:i:s")."\";";
  mysqli_query($sql);
 }
 sql_connect();
?>

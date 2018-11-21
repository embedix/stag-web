<?
// include("{$root}include/session.php");

/*
 KNIHOVNA PRO ZAKLADNI FUNKCE STRANEK
 Ivo Strasil (c) 2004
*/

ini_set('default_charset', 'windows-1250');

	# OSETRENI NEPOVOLENYCH IP ADRES
	if ($_SERVER['REMOTE_ADDR']=="213.220.253.159") {
	 die($_SERVER['REMOTE_ADDR'].": Nepovoleny pristup, kontaktujte flint at vlaksim.com");
	}

//obejiti vypnute register-globals
foreach ($_GET as $key => $value) {
//   echo "KlÝÀ: <b>$key</b>; Hodnota: <b>$value</b><br>\n";

 $$key=$value;
}
foreach ($_POST as $key => $value) {
//   echo "KlÝÀ: <b>$key</b>; Hodnota: <b>$value</b><br>\n";
 $$key=$value;
}
foreach ($_SERVER as $key => $value) {
//   echo "Klíè: <b>$key</b>; Hodnota: <b>$value</b><br>\n";
 $$key=$value;
}



//konfigurace
$pata_text="&copy; stanicar team 2003-2005";
$cesta="http://stanicar.ic.cz";
$jmeno_webu="Stanièáø";
$jmeno_webu_2p="Stanièáøe";
$zkratka_webu="Stanièáø";
$titul_menu="";
$nadpis_titulky="Stanièáø";


session_start();
if ($_SESSION["loggedadmin"]<time()) {$_SESSION["loggedadmin"]=0;};
if ($newdesign) {
 $_SESSION["newdesign"]=1;
}
if ($olddesign) {
 $_SESSION["newdesign"]=0;
}


/*
 Layout_header($title) - vytvori zacatek stranky vcetne nadpisu
 a odeslani cache-control hlavicek
*/
 function Headers()
    {
        header('Pragma: no-cache');
        header('Cache-Control: no-cache');
        header('Expires: '.GMDate("D, d M Y H:i:s").' GMT');
    }
 function Layout_header($title,$sekce="STAG") {
        global $zkratka_webu,$root;
    Headers();
echo <<<EOT
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
 <head>
  <title>Stanièáø: $sekce / $title</title>
  <meta content="text/html; charset=windows-1250" http-equiv="Content-Type">
  <link href="{$root}newstyl.css" rel="stylesheet" type="text/css">
  <link rel="SHORTCUT ICON" href="favicon.ico" type="image/x-icon"/>
</HEAD>
<BODY>
<div style="background-color:rgb(73,73,128);text-align:center;height:34px;overflow:hidden;color:white;padding:2px 10px;font-size:28px;vertical-align:center" width="100%">
$sekce
</div>
EOT;






echo <<<EOT
</div>
   <div id="levanavigace" style="top:74px">
   <a href="{$root}index.php">Index</a><br /><br />
   <b>MANTIS</b><br />
 je KO<br /><br />
   <b>STAG</b><br />
 <a href="{$root}stag/files" target="_blank">download</a><br /><br />
   <b>Definice vozù</b><br />
   <a href="{$root}vini/index.php">Zobrazit</a><br />
   <a href="{$root}vini/index.php?akce=obrgal">Galerie obrázkù</a><br />
   <a href="{$root}vini/index.php?akce=uprav&amp;id=0">Vložit vùz</a><br />
   <a href="{$root}vini/getvini.php" target=\"_blank\">Aktuální <b>vozy.ini</b></a><br />
    <a href="{$root}vini/index.php?akce=verze">Akt. èíslo verze, vydání nové</a><br />
EOT;

if ($_COOKIE['MANTIS_STRING_COOKIE']) {
echo <<<EOT
   <a href="{$root}vini/index.php?akce=addvini">Import z INI</a><br />

EOT;
}

echo <<<EOT
   <br />

   </div>
EOT;


echo "<div class=\"telotextu\">\n";
echo "<div class=\"telotextu2\">\n\n";

echo '<div class="login">';
if($session->logged_in){

   echo "Vítej <b>$session->username</b>, jsi pøihlášen. <br><br>"
       ."[<a href=\"{$root}userinfo.php?user=$session->username\">Úèet</a>] &nbsp;&nbsp;"
       ."[<a href=\"{$root}useredit.php\">Zmìna údajù</a>] &nbsp;&nbsp;";
   if($session->isAdmin()){
      echo "[<a href=\"{$root}admin/admin.php\">Administrace</a>] &nbsp;&nbsp;";
   }
   echo "[<a href=\"{$root}process.php\">Logout</a>]";
} else {
/**
 * User not logged in, display the login form.
 * If user has already tried to login, but errors were
 * found, display the total number of errors.
 * If errors occurred, they will be displayed.
 */
if($form->num_errors > 0){
   echo "<font size=\"2\" color=\"#ff0000\">".$form->num_errors." error(s) found</font>";
}
?>
<form action="<? echo $root;?>process.php" method="POST">

Jméno:<input type="text" name="user" maxlength="20" value="">

Heslo:<input type="password" name="pass" maxlength="20" value="">

<td colspan="2" align="left"><input type="checkbox" name="remember"
>
Pamatovat pøihlášení &nbsp;&nbsp;&nbsp;&nbsp;
<input type="hidden" name="sublogin" value="1">
<input type="submit" value="Login">
[<a href="<? echo $root;?>forgotpass.php">Poslat heslo</a>]
[<a href="<? echo $root;?>register.php">Registrace</a>]

</form>

<?
}
echo '</div>';



   echo "<h1>$title</h1>\n\n";
   echo "</div>";
 }

/*
 Layout_end($pata=1): ukonci stranku, prida paticku, je-li $pata=1
*/

 function Layout_end($pata='') {
 global $pata_text;
 if (!$pata) {$pata=$pata_text;};
  echo <<<EOT
   </div>
   </div>
   <div class="patka">
    <div class="patkatext">
     $pata
    </div>
   </div>
   </body></html>
EOT;
 }
?>

<?
 include "./root.php";
 ini_set('default_charset', 'windows-1250');
 header("Content-type: text/plain; charset=windows-1250");
 include "{$root}obecne.php";
 include "{$root}sql.php";
 mysqli_set_charset ( $sql_id,'cp1250');

 $dat=mysqli_fetch_assoc(mysqli_query($sql_id,'SELECT * FROM verze;'));
 $verze=$dat['cisloverze'];

 headers();
 header('Content-type: text/plain; charset=windows-1250');

 echo ";vozy.ini PHP generator\n";
 echo ";(c) bbf 2005\n";
 echo ";Datum vytvoreni: ".Date("d. M Y H:i:s")."\n\n\n\n\n";
 //default hlavicka
 echo <<<EOT
[default]
_verze=$verze

EOT;
 //generuji seznam
 $res=mysqli_query($sql_id,"SELECT * FROM vozy;");
 while ($dat=mysqli_fetch_array($res)) {
  echo "[{$dat['nazev']}]\n";
  echo "typ=".($dat['hnaci']?'hnaci':'vuz')."\n";
  echo "podtrida={$dat['trida']}\n";
  echo "popis={$dat['popis']}\n";
  echo "hmotnost={$dat['hmotnost']}\n";
  echo "delka=".strtr($dat['delka'],".",',')."\n";
  if ($dat['hnaci']) {
   echo "vykon={$dat['vykon']}\n";
   echo "sila={$dat['sila']}\n";
   echo "max_rych_hnaci={$dat['max_rych_hnaci']}\n";
  };
  if ($dat['osob']) {
   echo "osob={$dat['osob']}\n";
  }
  if ($dat['typ_nakladu']) {
   echo "typ_nakladu={$dat['typ_nakladu']}\n";
   echo "naklad={$dat['naklad']}\n";
  }
  echo "max_rych={$dat['max_rych']}\n";
  echo "elektro={$dat['elektro']}\n";
  echo "vyrobce={$dat['vyrobce']}\n";
  echo "autor={$dat['autor']}\n";
  if (File_exists("img/v_{$dat['id']}.png")) {
   echo "img={$dat['id']}\n";
  } else {
   echo "img=-1\n";
  };
  $oi=1;
  while (File_exists("img/v_{$dat['id']}_$oi.png")) {
    $oi++;
  }
  if ($oi-->1) {
   echo "imgex=$oi\n";
  }
  echo "\n";
 };
?>

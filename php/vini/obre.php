<?
 include "./root.php";
 include "{$root}obecne.php";
 include "{$root}sql.php";

 headers();
 header('Content-type: text/plain; charset=windows-1250');

 echo "Prepis jmen souboru\n";
 echo ";(c) bbf 2010\n";
 echo ";Datum vytvoreni: ".Date("d. M Y H:i:s")."\n\n\n\n\n";
 //default hlavicka

 //generuji seznam
 $res=mysql_query("SELECT * FROM vozy;");
 while ($dat=mysql_fetch_array($res)) {
  echo "VUZ {$dat['nazev']}\n";

  if (File_exists("img/v_{$dat['id']}.png")) {
//   echo "Ma zakl. obr.\n";
  } else {
/*   echo "---\n";
   if (File_exists("img/old_{$dat['nazev']}.png")) {
     echo "Exist. puvodni\n";
     rename("img/old_{$dat['nazev']}.png","img/v_{$dat['id']}.png");
   }*/
  };
  $oi=1;
  while (File_exists("img/old__{$oi}_{$dat['nazev']}.png")) {
     echo "Exist. puvodni EO $oi\n";
     rename("img/old__{$oi}_{$dat['nazev']}.png","img/v_{$dat['id']}_{$oi}.png");
    $oi++;

//    "img/v_{$dat['id']}_$oi.png"
  }

  if ($oi-->1) {
   echo "Ma $oi rozs. obr.\n";
  } else {
    echo "neni img/old__{$oi}_{$dat['nazev']}.png";
  }

  echo "\n";
 };
?>

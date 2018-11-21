<?
 include './root.php';
 include "{$root}obecne.php";
 include "{$root}sql.php";

if (!isset($akce)) $akce = "";
if (!isset($pack)) $pack = "";


 function obrfrm($id,$oa,$altid) {
  echo "<h3>Zm�na obr�zk� vozu �. $id</h3>";
  echo "<p>Pozor - zm�ny obr�zk� se nep�en�� do STAGu automaticky p�i synchronizaci, je nutn� zvolit p��kaz \"Obnovit datab�zi obr�zk�\"!
  Automaticky se p�en�� pouze nov� z�kladn� obr�zky (kter� nebyly v datab�zi v dob� vyd�n� STAGu).
  </p>";
  //formulare akci
  if ($oa=='load') {
  echo <<<EOT
    <h4>Zm�na obr�zku:</h4>
    <form method="post" enctype="multipart/form-data" action="index.php">
     <input type="hidden" name="akce" value="obredit" />
     <input type="hidden" name="id" value="$id" />
     <input type="hidden" name="altid" value="$altid" />
     <input type="hidden" name="oa" value="save" />
     Tla��tkem vedle pol��ka vyhledejte soubor s obr�zkem <b>typu PNG</b> k nata�en� do datab�ze na sv�m disku:
     <input type="file" name="userfile" height="15" /><br>
     Potvr�te nata�en� souboru tla��tkem (akce m��e trvat a� 4 minuty p�i velikosti souboru 1 MB, 30 s p�i 100 kB - na modemu):
     <input type="submit" value="Ode�li soubor" />
    </form>
EOT;
  }
  if ($oa=='default') {
   //stary default -> temp
   rename("img/v_{$id}.png","img/v_{$id}_TMP.png");
   rename("img/v_{$id}_{$altid}.png","img/v_{$id}.png");
   rename("img/v_{$id}_TMP.png","img/v_{$id}_{$altid}.png");
  }
  if ($oa=='delalt') {
   unlink("img/v_{$id}_{$altid}.png");
   //existuje obrazek s vyssim altid? pokud ano, prejmenovat nejvyssi za tento!
   $oi=$altid+1;
   while (File_exists("img/v_{$id}_{$oi}.png")) {
    $oi++;
   };
   $oi--;
   if ($oi>$altid) {rename("img/v_{$id}_{$oi}.png","img/v_{$id}_{$altid}.png");}
  }
  if ($oa=='save') {
    $fname = $_FILES['userfile']['name'];
    echo "<p>Soubor $fname</p>";
    if(!is_uploaded_file($_FILES['userfile']['tmp_name'])) {
     echo "<h3>Chyba serveru - soubor se nep�enesl na server!</h3>";
    };

    if (is_uploaded_file($_FILES['userfile']['tmp_name'])){
     $fileSize = $_FILES['userfile']['size'];
     if ($fileSize<100000){
      @unlink("./img/tempimg");
      move_uploaded_file ($_FILES['userfile']['tmp_name'], "./img/tempimg");
      //test spravnosti obrazku
      $attr = getimagesize("./img/tempimg");
      echo "<p>Zpracov�n�: obr�zek typu {$attr['mime']}, {$attr[0]} x {$attr[1]} px.</p>";
      if (!$attr[0]) {
       echo "<h3>Chybn� obr�zek! Zpracov�n� zru�eno.</h3>";
      } else {
       if ($attr[1]<>40||$attr['mime']!='image/png') {
	echo "<p><b>Sna�te se dodr�ovat svisl� rozm�r obr�zk� 40 px a form�t PNG!</b> Obr�zek bude upraven a m��e doj�t ke zhor�en� jeho kvality. ";
	$fp=fopen("./img/tempimg",'rb');
	$obrfile=fread($fp,filesize("./img/tempimg"));
	fclose($fp);
	$obr=imagecreatefromstring($obrfile);
	if (!$obr) {
	 echo "<h3>CHYBA - Obr�zek nelze p�ev�st.</h3>";
	 layout_end();
	 die();
	};
	@unlink("./img/tempimg");
	if ($attr[1]<>40) {
//	   $obrout=imagecreate(round($attr[0]*40.0/$attr[1]),40);
//	   imagecopyresampled($obrout,$obr,0,0,0,0,round($attr[0]*40.0/$attr[1]),40,$attr[0],$attr[1]);
//	   imagepng($obrout,"./img/tempimg");
//	   echo "[upravena v��ka - mo�n� rozost�en�!]";
	 echo "[automaticka uprava vysky byla vypnuta.]";
	 imagepng($obr,"./img/tempimg");
	} else {
	 imagepng($obr,"./img/tempimg");
	}
	echo "</p>\n\n";
       }
       //prenos souboru
       if (!$altid) {
	@unlink("./img/v_{$id}.png");
	rename("./img/tempimg","./img/v_{$id}.png");
       } else {
	@unlink("./img/v_{$id}_{$altid}.png");
	rename("./img/tempimg","./img/v_{$id}_{$altid}.png");
       }

       echo "<h3>Soubor byl ulo�en.</h3>";
     }
    } else {
     echo "<h3>Zpracov�n� zru�eno - maxim�ln� velikost souboru je 100 kB!</h3>";
    }
   }
  }

  
  echo "<h4>Z�kladn� obr�zek vozu:</h4>";
  if (File_exists("./img/v_$id.png")) {
   echo "<img src=\"getpng.php?file=v_$id.png\" /><br />";
   echo "<a href=\"index.php?akce=obredit&amp;oa=load&amp;id=$id\">Zm�nit obr�zek</a>";
   $oi=1;
   if (File_exists("img/v_{$id}_{$oi}.png")) {
    echo "<h4>Alternativn� obr�zky:</h4>";
    do {
     echo "<br>\n";
     echo "<b>$oi</b>: <img src=\"getpng.php?file=v_{$id}_{$oi}.png\" /><br />";
     echo "<a href=\"index.php?akce=obredit&amp;oa=delalt&amp;id=$id&amp;altid=$oi\">Smazat</a>
      <a href=\"index.php?akce=obredit&amp;oa=load&amp;id=$id&amp;altid=$oi\">Zm�nit obr�zek</a>
      <a href=\"index.php?akce=obredit&amp;oa=default&amp;id=$id&amp;altid=$oi\">Nastavit jako z�kladn�</a>
      ";
     $oi++;
    } while (File_exists("img/v_{$id}_{$oi}.png"));
   }
   echo "<br><br><a href=\"index.php?akce=obredit&amp;oa=load&amp;id=$id&amp;altid=$oi\">P�idat alternativn� obr�zek</a>";
  } else {
   echo "<p><b>V�z nem� definov�n ��dn� obr�zek</b></p>";
   echo "<br><br><a href=\"index.php?akce=obredit&amp;oa=load&amp;id=$id\">P�idat obr�zek</a>";
  }

 }



 function vozyfrm($id) {
  global $sql_id;
  if ($id==0) {
   $dat=array();
   echo "<h3>Nov� v�z</h3>";
   echo "<p>Obr�zek vozu p�idejte a� po vlo�en� vozu do datab�ze!</p>";
   $dat=array('sila'=>0,'vykon'=>0,'osob'=>0,'naklad'=>0,'max_rych'=>0,'max_rych_hnaci'=>0,'naklad'=>0,'delka'=>0,'hmotnost'=>0);
  } else {
   $dat=mysqli_fetch_array(mysqli_query($sql_id,"SELECT * FROM vozy WHERE id=$id"));
   echo "<h3>Editace vozu (identifik�tor vozu: $id)</h3>";
    if (File_exists("img/v_{$dat['id']}.png")) {
     echo "<img src=\"img/v_{$dat['id']}.png\" />";
     $oi=1;
     while (File_exists("img/v_{$dat['id']}_$oi.png")) {
      echo "<br>\n";
      echo "<img src=\"img/v_{$dat['id']}_$oi.png\" /> (alternativn� obr�zek $oi)";
      $oi++;
     }
    } else {
     echo "V�z nem� definov�n ��dn� obr�zek";
    }
    echo "<br><form action=\"#\" method=\"get\"><input type=\"hidden\" name=\"akce\" value=\"obredit\" /><input type=\"hidden\" name=\"id\" value=\"$id\" /><input type=\"submit\" value=\"Zm�nit obr�zek\" /></form>";
  };
  //tabulka
  echo "<form onsubmit=\"return overfrm(this);\"  action=\"#\" method=\"post\"><input type=\"hidden\" name=\"akce\" value=\"save\" /><table width=\"100%\">\n";

  //id vozu
  echo "<tr><td width=\"40%\">Typ vozu:</td><td width=\"60%\">";
  echo "<input type=\"text\" name=\"nazev\" value=\"{$dat['nazev']}\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Typ vozu v <i>nov�m</i> zna�en� �D (nap�. 810), pokud neexistuje, tak star� zna�en� v�etn� te�ky (nap�. 354.1); <b>Fiktivn� vozy nebo vozy ciz�ch �elezni�n�ch spr�v </b> mimo �SR <b>uv�d�jte s jm�nem dan� spr�vy ZA typem</b>, nap�. 1114_OBB. ;\"
   /> (nap�. 810 (vozy �D, �SD, �SR), 1114_OBB (ciz� vozy, fiktivn� vozy))";
  echo "</td></tr>";

  //id vozu
  echo "<tr><td>Popis:</td><td>\n";
  echo "<input type=\"text\" name=\"popis\" value=\"{$dat['popis']}\" maxlength=\"250\"
  onmouseover=\"document.getElementById('naptex').innerHTML='Stru�n� popis nad hranice toho, co ur�uje t��da vozu - nap�. Dieselelektrick� n�kladn� lokomotiva';\"
  size=\"70\" />\n";
  echo "</td></tr>\n";

  //vyrobce vozu
  echo "<tr><td>V�robce, za��tek dod�vek:</td><td>\n";
  echo "<input type=\"text\" name=\"vyrobce\" value=\"{$dat['vyrobce']}\" maxlength=\"100\"
  onmouseover=\"document.getElementById('naptex').innerHTML='Stru�n� popis v�robce a datov�n� - nap�. �koda (1974) nebo �koda (1962), reko �KD 1989';\"
  size=\"70\" />\n";
  echo "</td></tr>\n";

  //hnaci vozidla
  echo "<tr><td>Hnac�/ta�en� v�z:</td><td>\n";
  echo "<select name=\"hnaci\" id=\"hnhn\"
  onmouseover=\"document.getElementById('naptex').innerHTML='Zvol si, zda je v�z <b>hnac�</b> - lokomotiva nebo <i>��d�c� v�z</i> �i <b>ta�en�</b> - norm�ln� vagon. P��pojn� v�z k motor�ku nebo vnit�n� v�z (bezmotorov�) elektrick� jednotky je <i>ta�en�</i>, nikoliv hnac�! - n�kte�� to nech�pou:)';\"
  onchange=\"if (document.getElementById('hnhn').value=='1') {document.getElementById('naphn').style.display='inline';document.getElementById('napta').style.display='none';document.getElementById('thn').style.display='';} else {document.getElementById('napta').style.display='inline';document.getElementById('naphn').style.display='none';document.getElementById('thn').style.display='none';}; \"><option value=\"1\" ".($dat['hnaci']?"selected=\"selected\"":"").">Hnac�</option><option value=\"0\"" .(!$dat['hnaci']?"selected=\"selected\"":"").">Ta�en�</option> \n";
  echo "</select></td></tr>\n";

  //trida vozidla
  echo "<tr><td>T��da:</td><td>\n";
  echo "<input type=\"text\" name=\"trida\" value=\"{$dat['trida']}\" maxlength=\"30\" size=\"30\" id=\"trida\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Zvol si z v�b�rov�ho pole vpravo t��du vozu nebo zapi� do pole vlastn� n�zev - t�m se zalo�� nov� t��da.';\"
  />\n";
   echo "&lt;&lt;  ";
   //napovedne selecty
   echo "<select id=\"naphn\" onchange=\"document.getElementById('trida').value=document.getElementById('naphn').value\"";
   if (!$dat['hnaci']) {
    echo "style=\"display:none\" ";
   }
   echo ">\n";
   $res2=mysqli_query($sql_id,"SELECT trida FROM vozy WHERE hnaci=1 GROUP BY trida ORDER BY trida");
   while ($dat2=mysqli_fetch_array($res2)) {echo "<option value=\"{$dat2['trida']}\">{$dat2['trida']}</option>\n";};
   echo "</select>\n";
   echo "<select id=\"napta\" onchange=\"document.getElementById('trida').value=document.getElementById('napta').value\"";
   if ($dat['hnaci']) {
    echo "style=\"display:none\" ";
   }
   echo ">\n";
   $res2=mysqli_query($sql_id,"SELECT trida FROM vozy WHERE hnaci=0 GROUP BY trida ORDER BY trida");
   while ($dat2=mysqli_fetch_array($res2)) {echo "<option value=\"{$dat2['trida']}\">{$dat2['trida']}</option>\n";};
   echo "</select>\n";
  echo "</td></tr>\n";

  //hmotnost
  echo "<tr><td>Hmotnost:</td><td>\n";
  echo "<input type=\"text\" name=\"hmotnost\" value=\"{$dat['hmotnost']}\" maxlength=\"3\" size=\"6\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Chjo, tohle nepot�ebuje n�pov�du...';\"
  /> t (cel� ��slo)\n";
  echo "</td></tr>\n";

  echo "<tr><td>D�lka:</td><td>\n";
  echo "<input type=\"text\" name=\"delka\" value=\"{$dat['delka']}\" maxlength=\"6\" size=\"6\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Sem zapi� d�lku vozu n�razn�k - n�razn�k.';\"
  /> m\n";
  echo "</td></tr>\n";

  //parametry hnacich vozu
  echo "<tbody id=\"thn\"";
   if (!$dat['hnaci']) {
    echo "style=\"display:none\" ";
   }
  echo " >" ;

  echo "<tr><td>V�kon:</td><td>\n";
  echo "<input type=\"text\" name=\"vykon\" value=\"{$dat['vykon']}\" maxlength=\"5\" size=\"5\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Sem zapi� v�kon lokomotivy. Pokud jde o ��d�c� v�z, zapi� sem nulu! - v�kon odevzd�v� motorov� v�z, kter� je definov�n zvl᚝.';\"
   /> kW\n";
  echo "</td></tr>\n";

  echo "<tr><td>Ta�n� s�la (0 nebo -1 pro nezn�mou):</td><td>\n";
  echo "<input type=\"text\" name=\"sila\" value=\"{$dat['sila']}\" maxlength=\"5\" size=\"5\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Sem zapi� ta�nou s�lu lokomotivy, je-li zn�ma.';\"

  /> kN\n";
  echo "</td></tr>\n";



  //elektro
  echo "<tr><td>Pot�eba elektrifikace:</td><td>\n";
  $systemy=array("3 kV =","25 kV 50 Hz", "Tram/metro (600..900 V =)","1,5 kV =","15 kV 16 2/3 Hz","ostatn�");
  $vaha=1;
  for ($i=0;$i<count($systemy);$i++) {
   echo "<input type=\"checkbox\" name=\"elektro[]\" value=\"$vaha\" id=\"elektro\" ".((($dat['elektro']&$vaha)>0)?"checked=\"checked\"":"")." /> {$systemy[$i]} <br>\n";
   $vaha*=2;
  }
  echo "Pro vozy schopn� provozu bez elektrifikace neza�krt�vejte nic!</td></tr>\n";


  echo "<tr><td>Maxim�ln� rychlost, kterou hnac� vozidlo vlastn� silou vyvine:</td><td>\n";
  echo "<input type=\"text\" name=\"max_rych_hnaci\" value=\"{$dat['max_rych_hnaci']}\" maxlength=\"3\" size=\"5\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Sem zapi� maxim�ln� rychlost, kterou lokomotiva vlastn� silou dos�hne. Pokud jde o ��d�c� v�z, zapi� sem maxim�ln� rychlost, kterou m��e souprava s ��d�c�m vozem v �ele jet.';\"
  /> km/h\n";
  echo "</td></tr>\n";


  echo "</tbody>\n";


  echo "<tr><td>Maxim�ln� rychlost:</td><td>\n";
  echo "<input type=\"text\" name=\"max_rych\" value=\"{$dat['max_rych']}\" maxlength=\"3\" size=\"5\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Sem zapi� maxim�ln� rychlost, kterou m��e v�z jet. Pokud je v�z hnac�, zapi� sem rychlost, kterou m��e maxim�ln� jet, i kdy� by m�l b�t s�m ta�en (nap�. pomal� podb�je�ka, jedouc� sama max. 30 km/h, ta�en� na konci Mn vlaku m��e jet 80 km/h - tuto hodnotu sem napi�).';\"
  /> km/h\n";
  echo "</td></tr>\n";

  //osob
  echo "<tr><td>Obsaditelnost:</td><td>\n";
  echo "<input type=\"text\" name=\"osob\" value=\"{$dat['osob']}\" maxlength=\"5\" size=\"5\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Sem zapi� po�et osob, je-li v�z osobn� - jinak nulu.';\"
  /> osob\n";
  echo "</td></tr>\n";

  //mnozstvni nakladu
  echo "<tr><td>Typ n�kladu:</td><td>\n";
  echo "<input id=\"tyna\" type=\"text\" name=\"typ_nakladu\" value=\"{$dat['typ_nakladu']}\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Sem zapi� typ n�kladu, je-li v�z n�kladn�. Pokus se vyu��t ji� u�it� typy n�klad�, kter� jsou vyps�ny v poli vpravo.';\"
  maxlength=\"100\" size=\"30\" />\n";
   echo "&lt;&lt; <select id=\"naptn\" onchange=\"document.getElementById('tyna').value=document.getElementById('naptn').value\"
   onmouseover=\"document.getElementById('naptex').innerHTML='V tomto seznamu m��e� vybrat p�eddefinovan� typ n�kladu. Pokud pot�ebuje� vlastn� typ, napi� ho do pole vlevo - syst�m automaticky zalo�� nov� typ.';\"
   >";
   $res2=mysqli_query($sql_id,"SELECT typ_nakladu FROM vozy GROUP BY typ_nakladu ORDER BY typ_nakladu");
   while ($dat2=mysqli_fetch_array($res2)) {echo "<option value=\"{$dat2['typ_nakladu']}\">{$dat2['typ_nakladu']}</option>\n";};
   echo "</select>\n";
   echo "<input type=\"button\" value=\"Nen� n�kladn�\" onclick=\"document.getElementById('tyna').value='';document.getElementById('mnna').value='0';\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Stisk tla��tka vynuluje pole Mno�stv� n�kladu a nastav� nulov� typ n�kladu';\"
   />";
  echo "</td></tr>\n";

  echo "<tr><td>Mno�stv� n�kladu:</td><td>\n";
  echo "<input type=\"text\" id=\"mnna\" name=\"naklad\" value=\"{$dat['naklad']}\" maxlength=\"7\" size=\"5\" onmouseover=\"document.getElementById('naptex').innerHTML='Zadejte cel�m ��slem mno�stv� jednotek (tun, kus�, m3,... ) n�kladu pln� obsazen�ho vozu.';\"/> jednotek (ks, tun, m<sup>3</sup>...)\n";
  echo "</td></tr>\n";
echo <<<EOT
<SCRIPT LANGUAGE="JavaScript"><!--
function overfrm(formular)
{
	//alert("Test");
	if ((formular.nazev.value)=="")
    {
	 alert("Typ mus�te vyplnit!");
	 formular.nazev.focus();
	 return false;
    }/* else {
	alert("Test");
    }  */
	else if (formular.trida.value=="")
    {
	alert("T��du mus�te vyplnit!");
	formular.trida.focus();
	return false;
    }
    else {
	return true;};
}
// -->
</script>
EOT;

  echo "<tr><td>Potvrzen� zadan�ch dat:</td><td>\n";
  echo "<input type=\"submit\" name=\"\" value=\"Odeslat data\" onmouseover=\"document.getElementById('naptex').innerHTML='Stisknut�m tla��tka ode�lete data na server'\" /> \n";
  echo "</td></tr>\n";

  echo "<tr><td>N�pov�da (zobraz najet�m nad zad�vac� pole):</td><td>\n";
  echo "</td></tr>\n";

  echo "<tr><td colspan=\"2\" id=\"naptex\" style=\"background-color:#FFFFEE\">Zvolen�m vstupn�ho pole se zobraz� n�pov�da</td><td>\n";

  echo "</table></form>\n";
 }

 function confirm($id,$popis,$budakce) {
  global $sql_id;
  if ($id==0) {
   $dat=array();
   echo "<h3>Dotaz</h3>";
  } else {
   $dat=mysqli_fetch_array(mysqli_query($sql_id,"SELECT * FROM vozy WHERE id=$id"));
   echo "<h3>Dotaz - v�z {$dat['nazev']} (identifik�tor vozu: $id)</h3>";
  };
  echo "<p style=\"text-align:center\" width=\"100%\"><img src=\"getimg.php?typ=".strtr($dat['nazev'],' ','_')."\"></p>";
  echo "<h3>$popis</h3>";
  //tabulka
  echo "<form action=\"#\" method=\"post\"><input type=\"hidden\" name=\"akce\" value=\"$budakce\" /><input type=\"submit\" value=\"ANO\" /></form>\n";
  echo "<form action=\"#\" method=\"get\"><input type=\"submit\" value=\"NE\" /></form>\n";
 }

 function backbtn() {
  echo "<form action=\"#\" method=\"get\"><input type=\"submit\" value=\"Zp�t na seznam\" /></form>\n";
 }
 
 function obrdef($nazev) {
  echo "<div class=\"obrdef\"><h4>Obr�zek vozu:</h4>";
  echo "</div>";
 }

 layout_header("Definice voz�");
 global $sql_id;

/*
 if ($akce&&($akce!='obrgal')&&!$_COOKIE['MANTIS_STRING_COOKIE']) {
  echo "<p style=\"background-color:red;color:white;font-weight:bold\">:: NEJSTE P�IHL��EN - P�IHLASTE SE <a href=\"http://stanicar.ic.cz/mantis\">ZDE</a>!</p>";
  echo "<p>Po�adovan� akce byla zru�ena. Po p�ihl�en� budete moci editovat vozy.</p>";
  $akce='';
 }
  */

 //moznosti prace podle promenne AKCE:
 //podle prilogovaneho uzivatele:
 //pokud _SESSION["rights"]>0
 //pridava se moznost pridani, modifikace a mazani vozu

 //!$akce -> tabulka vozu, odkaz na aktualni vozy.ini
 //$akce=change $id (-1=>pridani)
 //$akce=save
 //$akce=del

 $_SESSION['userid']='puvodni';

 $res=(mysqli_fetch_array(mysqli_query($sql_id,"SELECT COUNT(*) AS pocet FROM vozy")));
 if (!$akce) {
  echo "<p>Celkem {$res['pocet']} voz� v datab�zi.</p>";
 };

 if ($akce=='uprav') {
  vozyfrm($id);
 }

 if ($akce=='del') {
  confirm($id,"P�ejete si smazat tento v�z?","del2");
 }
 if ($akce=='del2') {
  $id*=1;
  mysqli_query($sql_id,"DELETE FROM vozy WHERE id=$id;");
  echo "<h3>Provedeno.</h3>";
  backbtn();
 }
 if ($akce=='save') {
  $el=0;
  for ($i=0;$i<count($elektro);$i++) {
   $el+=$elektro[$i];
  }
  $hnaci*=1;
  $delka=strtr($delka,',','.');
  $naklad*=1;
  $max_rych*=1;
  $max_rych_hnaci*=1;
  $osob*=1;
  $naklad*=1;
  if ($id) {
   $dotaz="UPDATE vozy SET nazev=\"$nazev\", popis=\"$popis\", vyrobce=\"$vyrobce\", hnaci=$hnaci, trida=\"$trida\", hmotnost=$hmotnost, delka=$delka,
   vykon=$vykon, sila=$sila, max_rych=$max_rych, max_rych_hnaci=$max_rych_hnaci, elektro=$el, osob=$osob, typ_nakladu=\"$typ_nakladu\", naklad=$naklad WHERE id=$id;";
  } else {
   $dotaz="INSERT INTO vozy SET nazev=\"$nazev\", popis=\"$popis\", vyrobce=\"$vyrobce\", hnaci=$hnaci, trida=\"$trida\", hmotnost=$hmotnost, delka=$delka,
   vykon=$vykon, sila=$sila, max_rych=$max_rych, max_rych_hnaci=$max_rych_hnaci, elektro=$el, osob=$osob, typ_nakladu=\"$typ_nakladu\", naklad=$naklad;";
  }
  @mysqli_query($sql_id,$dotaz);
  if (!$id) {
   $id=mysqli_insert_id();
  }
  echo "<h3>Z�pis dat do datab�ze</h3>";
  if ($err=mysqli_error()) {
   echo "<p>Chyba: $err</p>\n<p>Stiskn�te tla��tko Zp�t v prohl�e�i a ov��te, zda jsou v�echny hodnoty spr�vn� zadan�.</p>";
  } else {
   echo "<p>Provedeno.</p>";
   echo "<a href=\"index.php?akce=uprav&amp;id=$id\">Zp�t na formul�� �prav</a> ";
   echo "<a href=\"index.php?akce=obredit&amp;id=$id\">Obr�zky vozu</a> ";
  }
 }

 function SortOd($parametr) {
  return " <a href=\"index.php?akce=$akce&amp;so=$parametr\">a</a> <a href=\"index.php?akce=$akce&amp;so=$parametr&amp;desc=1\">d</a> ";
 }

 if (!$akce||$akce=='obrgal') {
  //vypis tabulky vozu podle sekci
  echo "<h3>Tabulka voz�</h3>\n";
  echo "<form action=\"index.php\" method=\"GET\">Zobrazit vozidla: <select name=\"pack\">\n";
  echo "<option value=\"\" ";
  echo (!$pack)?"selected=\"1\"":"";
  echo ">V�echna vozidla</option>\n";
  echo "<option value=\"NOPACK\" ";
  echo ($pack=='NOPACK')?"selected=\"1\"":"";
  echo ">�D/�SR/�SD</option>\n";
  //dotaz na vsechny packy
  $dat=mysqli_query($sql_id,"SELECT SUBSTRING( nazev, INSTR( nazev, '_' ) +1 ) AS pack FROM `vozy` WHERE INSTR( nazev, '_' ) GROUP BY pack");
  while ($res=mysqli_fetch_array($dat)) {
   echo "<option value=\"{$res['pack']}\" ";
   echo ($pack==$res['pack'])?"selected=\"1\"":"";
   echo ">{$res['pack']}</option>\n";
  }
  echo "</select><input type=\"submit\" value=\"OK\"><input type=\"hidden\" name=\"so\" value=\"$so\"><input type=\"hidden\" name=\"desc\" value=\"$desc\"><input type=\"hidden\" name=\"akce\" value=\"$akce\"></form>";
  echo "<table>\n";
  echo "<tr><th>N�zev".SortOd('nazev')."</th><th>T��da ".SortOd('trida')."</th><th>D�lka [m]</th><th>Hmotnost [t]</th><th>V�kon, rychlosti</th><th>N�klad</th><th>Akce</th></tr>\n";
  $dotaz="SELECT * FROM vozy ";

  if ($pack) {
    if ($pack=="NOPACK") {
     $dotaz.="WHERE NOT INSTR(nazev,'_')"	 ;
    } else {
     $dotaz.="WHERE nazev LIKE '%_$pack' "	 ;
    };
  }


  if (!$so) {
   $dotaz.="ORDER BY hnaci DESC, nazev;";
  } else {
   $dotaz.="ORDER BY hnaci DESC, $so";
   if ($desc) {$dotaz.=' DESC';};
  }

  $res=mysqli_query($sql_id,$dotaz);
  while ($dat=mysqli_fetch_array($res)) {
   echo "<tr  onMouseOver=\"this.bgColor='#F0F0FF';\" onMouseOut=\"this.bgColor='#FFFFFF';\">\n";
   //nazev
   echo "<td><b>{$dat['nazev']}</b></td>\n";
   //trida
   echo "<td>";
   if ($dat['hnaci']) {
    echo "Hnac�: ";
   } else {
    echo "V�z: ";
   };
   echo "{$dat['trida']}</td>\n";
   //delka
   echo "<td>{$dat['delka']}</td>\n";
   //hmotnost
   echo "<td>{$dat['hmotnost']}</td>\n";
   //vykon, rychlosti
   echo "<td>";
   if ($dat['hnaci']) {
    echo "P={$dat['vykon']} kW, vmax={$dat['max_rych_hnaci']} km/h";
    if ($dat['sila']>0) {
     echo " F={$dat['sila']} kN";
    }
   } else {
    echo "vmax={$dat['max_rych']} km/h";
   }
   echo "</td>\n";
   //naklad
   echo "<td>";
   if ($dat['osob']) {echo "Osoby: {$dat['osob']}  ";};
   if ($dat['naklad']) {echo "{$dat['typ_nakladu']}: {$dat['naklad']}";};
   echo "</td>\n";
   //akce
   echo "<td>";
   echo "<a href=\"?akce=uprav&id={$dat['id']}\">detail/upravit</a>";
   echo " <a href=\"?akce=del&id={$dat['id']}\">smazat</a>";
   echo "</td>\n";
   echo "</tr>\n";
   if ($akce=='obrgal') {
    echo "<tr><td colspan=\"7\">\n";
    //detekce obrazku
    if (File_exists("img/v_{$dat['id']}.png")) {
     echo "<img src=\"img/v_{$dat['id']}.png\" />";
     $oi=1;
     while (File_exists("img/v_{$dat['id']}_$oi.png")) {
      echo "<br>\n";
      echo "<img src=\"img/v_{$dat['id']}_$oi.png\" /> (alternativn� obr�zek $oi)";
      $oi++;
     }
    } else {
     echo "V�z nem� definov�n ��dn� obr�zek";
    }
    echo "</td></tr>\n";
   }
  }
  echo "</table>\n";
 }

 if ($akce=='addvini') {
  echo "<h3>P�id�n� voz� z vozy.ini</h3>";
  echo "<p>Vlo�te ��st Va�eho souboru vozy.ini, kde jsou nov� definovan� vozy, a potvr�te tla��tkem Zpracovat.</p>";
  echo "<form method=\"post\"><input type=\"hidden\" name=\"akce\" value=\"autoadd\"><textarea cols=\"150\" rows=\"20\" name=\"data\"></textarea><br /><input value=\"Zpracovat\" type=\"submit\"></form>";
 }
 
 if ($akce=='verze') {
  $dat=mysqli_fetch_assoc(mysqli_query($sql_id,'SELECT * FROM verze;'));
  $verze=$dat['cisloverze'];
  echo "<h3>Aktu�ln� ��slo verze pro STAG je $verze</h3>";
  echo "<h3>Vyd�n� nov� verze:</h3>";
  echo "<form>Popis: <textarea name=\"zmeny\" cols=\"60\" rows=\"5\">Sem napi� popis zm�n</textarea>\n";
  echo "<input type=\"hidden\" name=\"akce\" value=\"newver\"><input type=\"submit\">";
  echo "</form>\n";
 };

 if ($akce=='newver') {
  mysqli_query($sql_id,'UPDATE verze SET cisloverze=cisloverze+1;')  ;
  $dat=mysqli_fetch_assoc(mysqli_query($sql_id,'SELECT * FROM verze;'));
  $verze=$dat['cisloverze'];
  echo "Vytvarim popisny soubor...<br />";
  unlink("./getversion.php");
  $fp=fopen("./getversion.php","wb");
  fwrite($fp,"$verze\n");
  fwrite($fp,"Verze $verze:\n");
  fwrite($fp,"$zmeny");
  fclose($fp);
  chmod ("./getversion.php", 0666);
  echo "<h3>Byla vyd�na verze $verze.</h3>";
 }

 function ToDB() {
  global $vuz,$polozky;
     if ($vuz&&$polozky['typ']&&$polozky['podtrida']) {
     //insert do DB
     $polozky['delka']=strtr($polozky['delka'],",",".");
     mysqli_query
     ("INSERT INTO vozy SET hnaci=".($polozky['typ']=='hnaci'?'1':'0').", trida=\"{$polozky['podtrida']}\", nazev=\"$vuz\",
     popis=\"{$polozky['popis']}\",
     vykon={$polozky['vykon']},hmotnost={$polozky['hmotnost']},delka={$polozky['delka']},
     osob={$polozky['osob']},typ_nakladu='{$polozky['typ_nakladu']}',max_rych={$polozky['max_rych']},
     max_rych_hnaci={$polozky['max_rych_hnaci']},elektro={$polozky['elektro']},vyrobce=\"{$polozky['vyrobce']}\",
     sila={$polozky['sila']},autor=\"{$_SESSION['userid']}\",naklad={$polozky['naklad']}");
     if ($err=mysqli_error()) {
      echo "CHYBA: $err<br />";
     } else {echo "OK<br />";};
  }

 };


 if ($akce=='autoadd') {
  //pridani do DB podle poslaneho vozy.ini
  //v "data" jsou INI data
  echo "<h3>Zpracov�n� INI souboru...</h3>\n";
  $radky=explode("\n",$data);
  for ($i=0;$i<count($radky);$i++) {$radky[i]=trim($radky[i]);};
  echo "Na�teno $i ��dk�, hled�m vozy...<br />";
  $vuz='';
  for ($i=0;$i<count($radky);$i++) {
   //hledani [
   if (eregi("^\[",$radky[$i])) {
    //pokud mame aspon zakladni data, dame je do DB
    ToDB();
    $vuz=trim(ereg_replace("\[", "", ereg_replace("\]", "", $radky[$i])));
    $polozky=array('vykon'=>0,'hmotnost'=>100,'delka'=>10.0,'osob'=>0,'max_rych'=>80,
    'max_rych_hnaci'=>80,'elektro'=>0,'sila'=>-1,'naklad'=>0);
    echo "$vuz: ";
    if (strtolower($vuz)=='default') {
     echo "(ignoruji default)<br />";
     $vuz='';
    } else {
     $res=mysqli_fetch_array(mysqli_query($sql_id,"SELECT COUNT(*) as pocet FROM vozy WHERE nazev=\"$vuz\";"));
     if ($res['pocet']) {
      echo " vuz jiz je v databazi <br />";
      $vuz='';
     } else {
      echo " vuz neni v databazi, zpracovavam:<br />";
     };
    }
   } else
   if ($vuz&&trim($radky[$i])!='') {
    //zname typ vozu, zpracovavame polozky
    $dataradku=explode('=',$radky[$i]);
    $polozky[trim(strtolower($dataradku[0]))]=trim($dataradku[1]);
    echo "{$dataradku[0]} = {$dataradku[1]}<br>";
   }
  };
  ToDB();
 }

 if ($akce=='obredit') {
  obrfrm($id,$oa,$altid);
 };

 echo "<p>Stav p�ihl�en�: ";
 if ($_COOKIE['MANTIS_STRING_COOKIE']) {
  echo "p�ihl�en do Mantisu";
 } else {
  echo "nep�ihl�en - p�ihlaste se <a href=\"http://stanicar.ic.cz/mantis\">zde</a>!";
 }

 layout_end();
?>

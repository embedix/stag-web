<?
 include './root.php';
 include "{$root}obecne.php";
 include "{$root}sql.php";

if (!isset($akce)) $akce = "";
if (!isset($pack)) $pack = "";


 function obrfrm($id,$oa,$altid) {
  echo "<h3>Zmìna obrázkù vozu è. $id</h3>";
  echo "<p>Pozor - zmìny obrázkù se nepøenáší do STAGu automaticky pøi synchronizaci, je nutné zvolit pøíkaz \"Obnovit databázi obrázkù\"!
  Automaticky se pøenáší pouze nové základní obrázky (které nebyly v databázi v dobì vydání STAGu).
  </p>";
  //formulare akci
  if ($oa=='load') {
  echo <<<EOT
    <h4>Zmìna obrázku:</h4>
    <form method="post" enctype="multipart/form-data" action="index.php">
     <input type="hidden" name="akce" value="obredit" />
     <input type="hidden" name="id" value="$id" />
     <input type="hidden" name="altid" value="$altid" />
     <input type="hidden" name="oa" value="save" />
     Tlaèítkem vedle políèka vyhledejte soubor s obrázkem <b>typu PNG</b> k natažení do databáze na svém disku:
     <input type="file" name="userfile" height="15" /><br>
     Potvrïte natažení souboru tlaèítkem (akce mùže trvat až 4 minuty pøi velikosti souboru 1 MB, 30 s pøi 100 kB - na modemu):
     <input type="submit" value="Odešli soubor" />
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
     echo "<h3>Chyba serveru - soubor se nepøenesl na server!</h3>";
    };

    if (is_uploaded_file($_FILES['userfile']['tmp_name'])){
     $fileSize = $_FILES['userfile']['size'];
     if ($fileSize<100000){
      @unlink("./img/tempimg");
      move_uploaded_file ($_FILES['userfile']['tmp_name'], "./img/tempimg");
      //test spravnosti obrazku
      $attr = getimagesize("./img/tempimg");
      echo "<p>Zpracování: obrázek typu {$attr['mime']}, {$attr[0]} x {$attr[1]} px.</p>";
      if (!$attr[0]) {
       echo "<h3>Chybný obrázek! Zpracování zrušeno.</h3>";
      } else {
       if ($attr[1]<>40||$attr['mime']!='image/png') {
	echo "<p><b>Snažte se dodržovat svislý rozmìr obrázkù 40 px a formát PNG!</b> Obrázek bude upraven a mùže dojít ke zhoršení jeho kvality. ";
	$fp=fopen("./img/tempimg",'rb');
	$obrfile=fread($fp,filesize("./img/tempimg"));
	fclose($fp);
	$obr=imagecreatefromstring($obrfile);
	if (!$obr) {
	 echo "<h3>CHYBA - Obrázek nelze pøevést.</h3>";
	 layout_end();
	 die();
	};
	@unlink("./img/tempimg");
	if ($attr[1]<>40) {
//	   $obrout=imagecreate(round($attr[0]*40.0/$attr[1]),40);
//	   imagecopyresampled($obrout,$obr,0,0,0,0,round($attr[0]*40.0/$attr[1]),40,$attr[0],$attr[1]);
//	   imagepng($obrout,"./img/tempimg");
//	   echo "[upravena výška - možné rozostøení!]";
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

       echo "<h3>Soubor byl uložen.</h3>";
     }
    } else {
     echo "<h3>Zpracování zrušeno - maximální velikost souboru je 100 kB!</h3>";
    }
   }
  }

  
  echo "<h4>Základní obrázek vozu:</h4>";
  if (File_exists("./img/v_$id.png")) {
   echo "<img src=\"getpng.php?file=v_$id.png\" /><br />";
   echo "<a href=\"index.php?akce=obredit&amp;oa=load&amp;id=$id\">Zmìnit obrázek</a>";
   $oi=1;
   if (File_exists("img/v_{$id}_{$oi}.png")) {
    echo "<h4>Alternativní obrázky:</h4>";
    do {
     echo "<br>\n";
     echo "<b>$oi</b>: <img src=\"getpng.php?file=v_{$id}_{$oi}.png\" /><br />";
     echo "<a href=\"index.php?akce=obredit&amp;oa=delalt&amp;id=$id&amp;altid=$oi\">Smazat</a>
      <a href=\"index.php?akce=obredit&amp;oa=load&amp;id=$id&amp;altid=$oi\">Zmìnit obrázek</a>
      <a href=\"index.php?akce=obredit&amp;oa=default&amp;id=$id&amp;altid=$oi\">Nastavit jako základní</a>
      ";
     $oi++;
    } while (File_exists("img/v_{$id}_{$oi}.png"));
   }
   echo "<br><br><a href=\"index.php?akce=obredit&amp;oa=load&amp;id=$id&amp;altid=$oi\">Pøidat alternativní obrázek</a>";
  } else {
   echo "<p><b>Vùz nemá definován žádný obrázek</b></p>";
   echo "<br><br><a href=\"index.php?akce=obredit&amp;oa=load&amp;id=$id\">Pøidat obrázek</a>";
  }

 }



 function vozyfrm($id) {
  global $sql_id;
  if ($id==0) {
   $dat=array();
   echo "<h3>Nový vùz</h3>";
   echo "<p>Obrázek vozu pøidejte až po vložení vozu do databáze!</p>";
   $dat=array('sila'=>0,'vykon'=>0,'osob'=>0,'naklad'=>0,'max_rych'=>0,'max_rych_hnaci'=>0,'naklad'=>0,'delka'=>0,'hmotnost'=>0);
  } else {
   $dat=mysqli_fetch_array(mysqli_query($sql_id,"SELECT * FROM vozy WHERE id=$id"));
   echo "<h3>Editace vozu (identifikátor vozu: $id)</h3>";
    if (File_exists("img/v_{$dat['id']}.png")) {
     echo "<img src=\"img/v_{$dat['id']}.png\" />";
     $oi=1;
     while (File_exists("img/v_{$dat['id']}_$oi.png")) {
      echo "<br>\n";
      echo "<img src=\"img/v_{$dat['id']}_$oi.png\" /> (alternativní obrázek $oi)";
      $oi++;
     }
    } else {
     echo "Vùz nemá definován žádný obrázek";
    }
    echo "<br><form action=\"#\" method=\"get\"><input type=\"hidden\" name=\"akce\" value=\"obredit\" /><input type=\"hidden\" name=\"id\" value=\"$id\" /><input type=\"submit\" value=\"Zmìnit obrázek\" /></form>";
  };
  //tabulka
  echo "<form onsubmit=\"return overfrm(this);\"  action=\"#\" method=\"post\"><input type=\"hidden\" name=\"akce\" value=\"save\" /><table width=\"100%\">\n";

  //id vozu
  echo "<tr><td width=\"40%\">Typ vozu:</td><td width=\"60%\">";
  echo "<input type=\"text\" name=\"nazev\" value=\"{$dat['nazev']}\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Typ vozu v <i>novém</i> znaèení ÈD (napø. 810), pokud neexistuje, tak staré znaèení vèetnì teèky (napø. 354.1); <b>Fiktivní vozy nebo vozy cizích železnièních správ </b> mimo ŽSR <b>uvádìjte s jménem dané správy ZA typem</b>, napø. 1114_OBB. ;\"
   /> (napø. 810 (vozy ÈD, ÈSD, ŽSR), 1114_OBB (cizí vozy, fiktivní vozy))";
  echo "</td></tr>";

  //id vozu
  echo "<tr><td>Popis:</td><td>\n";
  echo "<input type=\"text\" name=\"popis\" value=\"{$dat['popis']}\" maxlength=\"250\"
  onmouseover=\"document.getElementById('naptex').innerHTML='Struèný popis nad hranice toho, co urèuje tøída vozu - napø. Dieselelektrická nákladní lokomotiva';\"
  size=\"70\" />\n";
  echo "</td></tr>\n";

  //vyrobce vozu
  echo "<tr><td>Výrobce, zaèátek dodávek:</td><td>\n";
  echo "<input type=\"text\" name=\"vyrobce\" value=\"{$dat['vyrobce']}\" maxlength=\"100\"
  onmouseover=\"document.getElementById('naptex').innerHTML='Struèný popis výrobce a datování - napø. Škoda (1974) nebo Škoda (1962), reko ÈKD 1989';\"
  size=\"70\" />\n";
  echo "</td></tr>\n";

  //hnaci vozidla
  echo "<tr><td>Hnací/tažený vùz:</td><td>\n";
  echo "<select name=\"hnaci\" id=\"hnhn\"
  onmouseover=\"document.getElementById('naptex').innerHTML='Zvol si, zda je vùz <b>hnací</b> - lokomotiva nebo <i>øídící vùz</i> èi <b>tažený</b> - normální vagon. Pøípojný vùz k motoráku nebo vnitøní vùz (bezmotorový) elektrické jednotky je <i>tažený</i>, nikoliv hnací! - nìkteøí to nechápou:)';\"
  onchange=\"if (document.getElementById('hnhn').value=='1') {document.getElementById('naphn').style.display='inline';document.getElementById('napta').style.display='none';document.getElementById('thn').style.display='';} else {document.getElementById('napta').style.display='inline';document.getElementById('naphn').style.display='none';document.getElementById('thn').style.display='none';}; \"><option value=\"1\" ".($dat['hnaci']?"selected=\"selected\"":"").">Hnací</option><option value=\"0\"" .(!$dat['hnaci']?"selected=\"selected\"":"").">Tažený</option> \n";
  echo "</select></td></tr>\n";

  //trida vozidla
  echo "<tr><td>Tøída:</td><td>\n";
  echo "<input type=\"text\" name=\"trida\" value=\"{$dat['trida']}\" maxlength=\"30\" size=\"30\" id=\"trida\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Zvol si z výbìrového pole vpravo tøídu vozu nebo zapiš do pole vlastní název - tím se založí nová tøída.';\"
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
   onmouseover=\"document.getElementById('naptex').innerHTML='Chjo, tohle nepotøebuje nápovìdu...';\"
  /> t (celé èíslo)\n";
  echo "</td></tr>\n";

  echo "<tr><td>Délka:</td><td>\n";
  echo "<input type=\"text\" name=\"delka\" value=\"{$dat['delka']}\" maxlength=\"6\" size=\"6\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Sem zapiš délku vozu nárazník - nárazník.';\"
  /> m\n";
  echo "</td></tr>\n";

  //parametry hnacich vozu
  echo "<tbody id=\"thn\"";
   if (!$dat['hnaci']) {
    echo "style=\"display:none\" ";
   }
  echo " >" ;

  echo "<tr><td>Výkon:</td><td>\n";
  echo "<input type=\"text\" name=\"vykon\" value=\"{$dat['vykon']}\" maxlength=\"5\" size=\"5\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Sem zapiš výkon lokomotivy. Pokud jde o øídící vùz, zapiš sem nulu! - výkon odevzdává motorový vùz, který je definován zvláš.';\"
   /> kW\n";
  echo "</td></tr>\n";

  echo "<tr><td>Tažná síla (0 nebo -1 pro neznámou):</td><td>\n";
  echo "<input type=\"text\" name=\"sila\" value=\"{$dat['sila']}\" maxlength=\"5\" size=\"5\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Sem zapiš tažnou sílu lokomotivy, je-li známa.';\"

  /> kN\n";
  echo "</td></tr>\n";



  //elektro
  echo "<tr><td>Potøeba elektrifikace:</td><td>\n";
  $systemy=array("3 kV =","25 kV 50 Hz", "Tram/metro (600..900 V =)","1,5 kV =","15 kV 16 2/3 Hz","ostatní");
  $vaha=1;
  for ($i=0;$i<count($systemy);$i++) {
   echo "<input type=\"checkbox\" name=\"elektro[]\" value=\"$vaha\" id=\"elektro\" ".((($dat['elektro']&$vaha)>0)?"checked=\"checked\"":"")." /> {$systemy[$i]} <br>\n";
   $vaha*=2;
  }
  echo "Pro vozy schopné provozu bez elektrifikace nezaškrtávejte nic!</td></tr>\n";


  echo "<tr><td>Maximální rychlost, kterou hnací vozidlo vlastní silou vyvine:</td><td>\n";
  echo "<input type=\"text\" name=\"max_rych_hnaci\" value=\"{$dat['max_rych_hnaci']}\" maxlength=\"3\" size=\"5\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Sem zapiš maximální rychlost, kterou lokomotiva vlastní silou dosáhne. Pokud jde o øídící vùz, zapiš sem maximální rychlost, kterou mùže souprava s øídícím vozem v èele jet.';\"
  /> km/h\n";
  echo "</td></tr>\n";


  echo "</tbody>\n";


  echo "<tr><td>Maximální rychlost:</td><td>\n";
  echo "<input type=\"text\" name=\"max_rych\" value=\"{$dat['max_rych']}\" maxlength=\"3\" size=\"5\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Sem zapiš maximální rychlost, kterou mùže vùz jet. Pokud je vùz hnací, zapiš sem rychlost, kterou mùže maximálnì jet, i když by mìl být sám tažen (napø. pomalá podbíjeèka, jedoucí sama max. 30 km/h, tažená na konci Mn vlaku mùže jet 80 km/h - tuto hodnotu sem napiš).';\"
  /> km/h\n";
  echo "</td></tr>\n";

  //osob
  echo "<tr><td>Obsaditelnost:</td><td>\n";
  echo "<input type=\"text\" name=\"osob\" value=\"{$dat['osob']}\" maxlength=\"5\" size=\"5\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Sem zapiš poèet osob, je-li vùz osobní - jinak nulu.';\"
  /> osob\n";
  echo "</td></tr>\n";

  //mnozstvni nakladu
  echo "<tr><td>Typ nákladu:</td><td>\n";
  echo "<input id=\"tyna\" type=\"text\" name=\"typ_nakladu\" value=\"{$dat['typ_nakladu']}\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Sem zapiš typ nákladu, je-li vùz nákladní. Pokus se využít již užité typy nákladù, které jsou vypsány v poli vpravo.';\"
  maxlength=\"100\" size=\"30\" />\n";
   echo "&lt;&lt; <select id=\"naptn\" onchange=\"document.getElementById('tyna').value=document.getElementById('naptn').value\"
   onmouseover=\"document.getElementById('naptex').innerHTML='V tomto seznamu mùžeš vybrat pøeddefinovaný typ nákladu. Pokud potøebuješ vlastní typ, napiš ho do pole vlevo - systém automaticky založí nový typ.';\"
   >";
   $res2=mysqli_query($sql_id,"SELECT typ_nakladu FROM vozy GROUP BY typ_nakladu ORDER BY typ_nakladu");
   while ($dat2=mysqli_fetch_array($res2)) {echo "<option value=\"{$dat2['typ_nakladu']}\">{$dat2['typ_nakladu']}</option>\n";};
   echo "</select>\n";
   echo "<input type=\"button\" value=\"Není nákladní\" onclick=\"document.getElementById('tyna').value='';document.getElementById('mnna').value='0';\"
   onmouseover=\"document.getElementById('naptex').innerHTML='Stisk tlaèítka vynuluje pole Množství nákladu a nastaví nulový typ nákladu';\"
   />";
  echo "</td></tr>\n";

  echo "<tr><td>Množství nákladu:</td><td>\n";
  echo "<input type=\"text\" id=\"mnna\" name=\"naklad\" value=\"{$dat['naklad']}\" maxlength=\"7\" size=\"5\" onmouseover=\"document.getElementById('naptex').innerHTML='Zadejte celým èíslem množství jednotek (tun, kusù, m3,... ) nákladu plnì obsazeného vozu.';\"/> jednotek (ks, tun, m<sup>3</sup>...)\n";
  echo "</td></tr>\n";
echo <<<EOT
<SCRIPT LANGUAGE="JavaScript"><!--
function overfrm(formular)
{
	//alert("Test");
	if ((formular.nazev.value)=="")
    {
	 alert("Typ musíte vyplnit!");
	 formular.nazev.focus();
	 return false;
    }/* else {
	alert("Test");
    }  */
	else if (formular.trida.value=="")
    {
	alert("Tøídu musíte vyplnit!");
	formular.trida.focus();
	return false;
    }
    else {
	return true;};
}
// -->
</script>
EOT;

  echo "<tr><td>Potvrzení zadaných dat:</td><td>\n";
  echo "<input type=\"submit\" name=\"\" value=\"Odeslat data\" onmouseover=\"document.getElementById('naptex').innerHTML='Stisknutím tlaèítka odešlete data na server'\" /> \n";
  echo "</td></tr>\n";

  echo "<tr><td>Nápovìda (zobraz najetím nad zadávací pole):</td><td>\n";
  echo "</td></tr>\n";

  echo "<tr><td colspan=\"2\" id=\"naptex\" style=\"background-color:#FFFFEE\">Zvolením vstupního pole se zobrazí nápovìda</td><td>\n";

  echo "</table></form>\n";
 }

 function confirm($id,$popis,$budakce) {
  global $sql_id;
  if ($id==0) {
   $dat=array();
   echo "<h3>Dotaz</h3>";
  } else {
   $dat=mysqli_fetch_array(mysqli_query($sql_id,"SELECT * FROM vozy WHERE id=$id"));
   echo "<h3>Dotaz - vùz {$dat['nazev']} (identifikátor vozu: $id)</h3>";
  };
  echo "<p style=\"text-align:center\" width=\"100%\"><img src=\"getimg.php?typ=".strtr($dat['nazev'],' ','_')."\"></p>";
  echo "<h3>$popis</h3>";
  //tabulka
  echo "<form action=\"#\" method=\"post\"><input type=\"hidden\" name=\"akce\" value=\"$budakce\" /><input type=\"submit\" value=\"ANO\" /></form>\n";
  echo "<form action=\"#\" method=\"get\"><input type=\"submit\" value=\"NE\" /></form>\n";
 }

 function backbtn() {
  echo "<form action=\"#\" method=\"get\"><input type=\"submit\" value=\"Zpìt na seznam\" /></form>\n";
 }
 
 function obrdef($nazev) {
  echo "<div class=\"obrdef\"><h4>Obrázek vozu:</h4>";
  echo "</div>";
 }

 layout_header("Definice vozù");
 global $sql_id;

/*
 if ($akce&&($akce!='obrgal')&&!$_COOKIE['MANTIS_STRING_COOKIE']) {
  echo "<p style=\"background-color:red;color:white;font-weight:bold\">:: NEJSTE PØIHLÁŠEN - PØIHLASTE SE <a href=\"http://stanicar.ic.cz/mantis\">ZDE</a>!</p>";
  echo "<p>Požadovaná akce byla zrušena. Po pøihlášení budete moci editovat vozy.</p>";
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
  echo "<p>Celkem {$res['pocet']} vozù v databázi.</p>";
 };

 if ($akce=='uprav') {
  vozyfrm($id);
 }

 if ($akce=='del') {
  confirm($id,"Pøejete si smazat tento vùz?","del2");
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
  echo "<h3>Zápis dat do databáze</h3>";
  if ($err=mysqli_error()) {
   echo "<p>Chyba: $err</p>\n<p>Stisknìte tlaèítko Zpìt v prohlížeèi a ovìøte, zda jsou všechny hodnoty správnì zadané.</p>";
  } else {
   echo "<p>Provedeno.</p>";
   echo "<a href=\"index.php?akce=uprav&amp;id=$id\">Zpìt na formuláø úprav</a> ";
   echo "<a href=\"index.php?akce=obredit&amp;id=$id\">Obrázky vozu</a> ";
  }
 }

 function SortOd($parametr) {
  return " <a href=\"index.php?akce=$akce&amp;so=$parametr\">a</a> <a href=\"index.php?akce=$akce&amp;so=$parametr&amp;desc=1\">d</a> ";
 }

 if (!$akce||$akce=='obrgal') {
  //vypis tabulky vozu podle sekci
  echo "<h3>Tabulka vozù</h3>\n";
  echo "<form action=\"index.php\" method=\"GET\">Zobrazit vozidla: <select name=\"pack\">\n";
  echo "<option value=\"\" ";
  echo (!$pack)?"selected=\"1\"":"";
  echo ">Všechna vozidla</option>\n";
  echo "<option value=\"NOPACK\" ";
  echo ($pack=='NOPACK')?"selected=\"1\"":"";
  echo ">ÈD/ŽSR/ÈSD</option>\n";
  //dotaz na vsechny packy
  $dat=mysqli_query($sql_id,"SELECT SUBSTRING( nazev, INSTR( nazev, '_' ) +1 ) AS pack FROM `vozy` WHERE INSTR( nazev, '_' ) GROUP BY pack");
  while ($res=mysqli_fetch_array($dat)) {
   echo "<option value=\"{$res['pack']}\" ";
   echo ($pack==$res['pack'])?"selected=\"1\"":"";
   echo ">{$res['pack']}</option>\n";
  }
  echo "</select><input type=\"submit\" value=\"OK\"><input type=\"hidden\" name=\"so\" value=\"$so\"><input type=\"hidden\" name=\"desc\" value=\"$desc\"><input type=\"hidden\" name=\"akce\" value=\"$akce\"></form>";
  echo "<table>\n";
  echo "<tr><th>Název".SortOd('nazev')."</th><th>Tøída ".SortOd('trida')."</th><th>Délka [m]</th><th>Hmotnost [t]</th><th>Výkon, rychlosti</th><th>Náklad</th><th>Akce</th></tr>\n";
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
    echo "Hnací: ";
   } else {
    echo "Vùz: ";
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
      echo "<img src=\"img/v_{$dat['id']}_$oi.png\" /> (alternativní obrázek $oi)";
      $oi++;
     }
    } else {
     echo "Vùz nemá definován žádný obrázek";
    }
    echo "</td></tr>\n";
   }
  }
  echo "</table>\n";
 }

 if ($akce=='addvini') {
  echo "<h3>Pøidání vozù z vozy.ini</h3>";
  echo "<p>Vložte èást Vašeho souboru vozy.ini, kde jsou novì definované vozy, a potvrïte tlaèítkem Zpracovat.</p>";
  echo "<form method=\"post\"><input type=\"hidden\" name=\"akce\" value=\"autoadd\"><textarea cols=\"150\" rows=\"20\" name=\"data\"></textarea><br /><input value=\"Zpracovat\" type=\"submit\"></form>";
 }
 
 if ($akce=='verze') {
  $dat=mysqli_fetch_assoc(mysqli_query($sql_id,'SELECT * FROM verze;'));
  $verze=$dat['cisloverze'];
  echo "<h3>Aktuální èíslo verze pro STAG je $verze</h3>";
  echo "<h3>Vydání nové verze:</h3>";
  echo "<form>Popis: <textarea name=\"zmeny\" cols=\"60\" rows=\"5\">Sem napiš popis zmìn</textarea>\n";
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
  echo "<h3>Byla vydána verze $verze.</h3>";
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
  echo "<h3>Zpracování INI souboru...</h3>\n";
  $radky=explode("\n",$data);
  for ($i=0;$i<count($radky);$i++) {$radky[i]=trim($radky[i]);};
  echo "Naèteno $i øádkù, hledám vozy...<br />";
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

 echo "<p>Stav pøihlášení: ";
 if ($_COOKIE['MANTIS_STRING_COOKIE']) {
  echo "pøihlášen do Mantisu";
 } else {
  echo "nepøihlášen - pøihlaste se <a href=\"http://stanicar.ic.cz/mantis\">zde</a>!";
 }

 layout_end();
?>

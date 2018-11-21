<?
 include './root.php';
 include "{$root}obecne.php";
 layout_header("Stanièáø - podpora vývoje","Stanièáø");
 //moznosti prace podle promenne AKCE:
 //podle prilogovaneho uzivatele:
 //pokud _SESSION["rights"]>0
 //pridava se moznost pridani, modifikace a mazani vozu

 //!$akce -> tabulka vozu, odkaz na aktualni vozy.ini
 //$akce=change $id (-1=>pridani)
 //$akce=save
 //$akce=del

 $_SESSION['userid']='puvodni';
?>
<p>
 Tyto WWW stránky jsou urèeny pro vývojáøe a pøíznivce simulátoru Stanièáø.
</p>

<div style="background-color:#77DD77;color:white;font-weight:bold;padding:20px;">
<p>Vážení pøátelé,</p>
<p>vzhledem k pøechodu serveru na PHP7 jsme trochu rozbili online definice vozù, dokud aplikaci nìkdo neupraví. Vìtšina funkcí zdá se jede, ale chyby vznikají - vím tøeba o nefunèním náhledu pøi editaci obrázkù. Další chyby prosím hlaste do fóra na k-reportu.

Já na opravy nyní upøímnì nemám èas, jsem rád, že jsem našel pár hodin na opìtovné zprovoznìní aspoò nìjak. Dobrovolníci? napište na embedix at centrum.cz </p>
<p>autor Stagu -bbf- 29.10.2018</p>
<p>P.S. S opravami by se také mohlo doøešit pøihlašování. </p>
</div>

<p><b>Pozor:</b> pro správnou funkci naèítání DB vozù je nutné v souboru stag.ini Stagu zmìnit sekci update takto:</p>
<pre>
[update]
base=http://stag.strasil.net/vini/
</pre>



<?
 layout_end();
?>

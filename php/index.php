<?
 include './root.php';
 include "{$root}obecne.php";
 layout_header("Stani��� - podpora v�voje","Stani���");
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
 Tyto WWW str�nky jsou ur�eny pro v�voj��e a p��znivce simul�toru Stani���.
</p>

<div style="background-color:#77DD77;color:white;font-weight:bold;padding:20px;">
<p>V�en� p��tel�,</p>
<p>vzhledem k p�echodu serveru na PHP7 jsme trochu rozbili online definice voz�, dokud aplikaci n�kdo neuprav�. V�t�ina funkc� zd� se jede, ale chyby vznikaj� - v�m t�eba o nefun�n�m n�hledu p�i editaci obr�zk�. Dal�� chyby pros�m hlaste do f�ra na k-reportu.

J� na opravy nyn� up��mn� nem�m �as, jsem r�d, �e jsem na�el p�r hodin na op�tovn� zprovozn�n� aspo� n�jak. Dobrovoln�ci? napi�te na embedix at centrum.cz </p>
<p>autor Stagu -bbf- 29.10.2018</p>
<p>P.S. S opravami by se tak� mohlo do�e�it p�ihla�ov�n�. </p>
</div>

<p><b>Pozor:</b> pro spr�vnou funkci na��t�n� DB voz� je nutn� v souboru stag.ini Stagu zm�nit sekci update takto:</p>
<pre>
[update]
base=http://stag.strasil.net/vini/
</pre>



<?
 layout_end();
?>

<?php
	$sql_host="localhost";
	$sql_user="root";
	$sql_password="ciscocisco";
	$sql_database="platon";
	
	$con=mysqli_connect($sql_host, $sql_user, $sql_password,$sql_database);

	$sqlquery="SELECT 
	case 
		when exists (select fachgebiete.leitung from `fachgebiete` where fachgebiete.leitung = mitarbeiter.mitarbeiterid) then 'Ja'
        else 'Nein'
	end as 'Leitung', 
    mitarbeiter.name, mitarbeiter.vorname, mitarbeiter.geschlecht, mitarbeiter.stundensatz, 
    fachgebiete.name, mitarbeiterstandorte.standort, standorte.koordinatennord, standorte.koordniatensued from `mitarbeiter` 
	inner join `fachgebiete` on mitarbeiter.fachgebiet = fachgebiete.id
	left join `mitarbeiterstandorte` on mitarbeiter.mitarbeiterid= mitarbeiterstandorte.mitarbeiterid
	left join `standorte` on mitarbeiterstandorte.standort = standorte.standort
	order by fachgebiete.name";

	$result = mysqli_query($con,$sqlquery);

	while($row = mysqli_fetch_array($result)){
		echo "<tr>";
		for($i=0;$i<9;$i++){
			echo "<td>";
			echo "$row[$i]";
			echo "</td>";
		}	
		echo "</tr>";
	}
?>

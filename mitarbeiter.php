<html>
<head>
<title>Platon|Mitarbeiter</title>
<meta charset="utf-8">
<script src="jquery-3.3.1.min.js" type="text/javascript"/>
<script src="index.js" type="text/javascript"/>
<link href="custom.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#c7c7c7">

<div>
	<a href="index.html" style="text-decoration: none; "  class="zuruck"> Zurück 
</a>

<a href="projekte.html" style="text-decoration: none; "  class="page">Projekt 
</a>
<header>
	<h1> 
Hier sehen sie die Mitarbeiter
</h1>
</header>

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
	$header = ["Leitung", "Name", "Vorname", "Geschlecht", "Stundensatz", "Fachabteilung", "Standort", "Nördl. Koordinate", "Südl. Koordinate"];
	
	echo "<table>";
	for($i=0;$i<count($header);$i++){
		echo "<th>";
		echo "$header[$i]";
		echo "</th>";
	}
	
	while($row = mysqli_fetch_array($result)){
		echo "<tr>";
		for($i=0;$i<count($header);$i++){
			echo "<td>";
			echo "$row[$i]";
			echo "</td>";
		}	
		echo "</tr>";
		
	}
	echo "</table>";
	
?>

</div>
</body>
</html> 

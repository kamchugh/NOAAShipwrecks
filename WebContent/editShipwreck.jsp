<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Shipwreck</title>
</head>
<body>
	<header>
		<p>Edit Shipwreck</p>
	</header>
	<div>
	<form action="saveEditedShipwreck.do" method="POST">
		<table>
			<tr>
				<td>
					
						<p>NOAA Record number:</p>
						<input type="text" name="record" placeholder= "${wreck.record}"/><br />
				</td>
				<td>
					<p>Name of ship found:</p> <input type="text" name="nameofship"
					value= "${wreck.nameofship}"/><br/>
				</td>
				<td><p>Danger of ship:</p> <select name="dangerofship">
				
						<option value="Visible">Visible</option>
						<option value="Submerged  nondangerous">Submerged, non
							dangerous</option>
						<option value="Submerged  dangerous to surface navigation">
							Submerged, dangerous</option>
						<option value="Not Charted">Not charted</option>
						<option value="no data available">Charted, but no data
							available</option>
				</select>
				</td>
			</tr>
			<tr>
			<td>
				<p>Latitude:</p>
				<input type="text" name="latitute" value= "${wreck.latitute}" /></td>
				<td>
				<p>Longitude:</p>
				<input type="text" name="longitude" value= "${wreck.longitude}" />
				<br />
				</td>
			</tr>
			<tr>
			<td>
				<p>Depth:</p>
				<input type="text" name="depth" value= "${wreck.depth}" />
				</td>
				<td>
				<p>Year Sunk:</p>
				<input type="text" name="yearsunk" value= "${wreck.yearsunk}" />
				</td>
				<td>
				<p>History:</p>
				<input type="text" name="history" value= "${wreck.history}" cols="100" rows="10" />
				</td>
				<td>
				
				<input type="submit" value="Add Wreck" /> 
				</td>
				
			</tr>	
		</table>
		</form>
	</div>
	<footer>
		<p>Designed by Kaylee McHugh</p>
	</footer>
	
</body>


</html>
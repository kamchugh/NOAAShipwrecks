<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="Shipwrecks.css" />
<link href='https://fonts.googleapis.com/css?family=Noto+Sans'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Fjalla+One'
	rel='stylesheet' type='text/css'>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Shipwreck</title>
</head>
<body>
	<header>
		<a href=href="http://www.noaa.gov/"> <img
			src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/NOAA_logo.svg/2000px-NOAA_logo.svg.png"
			style="width: 30px; height: 30px;">
		</a>
	</header>
	<div id="wreckbackground">
		<table id="editTable">
			<tr>
				<td colspan="2">
					<h1>Edit Shipwreck</h1>
					<form action="saveEditedShipwreck.do" method="POST">
					</td>
					</tr>

						<tr>
							<td>

								<p>NOAA Record number:</p> <input type="text" name="record"
								placeholder="${wreck.record}" /><br />
							</td>
							<td>
								<p>Name of ship found:</p> <input type="text" name="nameofship"
								value="${wreck.nameofship}" /><br />
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
							</select></td>
						</tr>
						<tr>
							<td>
								<p>Latitude:</p> <input type="text" name="latitute"
								value="${wreck.latitute}" />
							</td>
							<td>
								<p>Longitude:</p> <input type="text" name="longitude"
								value="${wreck.longitude}" /> <br />
							</td>
						</tr>
						<tr>
							<td>
								<p>Depth:</p> <input type="text" name="depth"
								value="${wreck.depth}" />
							</td>
							<td>
								<p>Year Sunk:</p> <input type="text" name="yearsunk"
								value="${wreck.yearsunk}" />
							</td>
							<td>
								<p>History:</p> <input type="text" name="history"
								value="${wreck.history}" cols="100" rows="10" />
							</td>
							<td><input class="deletebutton" type="submit" value="Resave Wreck" /></td>

						</tr>

					</form>
		</table>
	</div>
	<footer>
		
	</footer>

</body>


</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="Shipwrecks.css" />
<link href='https://fonts.googleapis.com/css?family=Noto+Sans'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Fjalla+One'
	rel='stylesheet' type='text/css'>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Results Page</title>
</head>
<body>
	<header> <a href= "http://www.noaa.gov/"> <img
		 src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/NOAA_logo.svg/2000px-NOAA_logo.svg.png"
		style="width: 30px; height: 30px;"> </a>
		<a class="navelement" href= "getAllShipwrecks.do">  Go back to list </a>
		<a class="navelement" href= "index.html">  Go back to home page </a> </header>
	<div id="wreckbackground">
		<table id="resultstable">
			<tr>
				<td>
					<p>NOAA ID Number: ${wreck.record}</p>
					<p>Name: ${wreck.nameofship} Danger of ship:
						${wreck.dangerofship}</p>
					<p>Depth of ship: ${wreck.depth} Year sunk: ${wreck.yearsunk}</p>
					<p>History put in by NOAA explorer: ${wreck.history}</p>
				<td><script type="text/javascript"
						src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
					<script language="javascript" type="text/javascript">

    var map;
    var geocoder;
    function InitializeMap() {

        var latlng = new google.maps.LatLng(${wreck.latitute}, ${wreck.longitude});
        var myOptions =
        {
            zoom: 8,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            disableDefaultUI: true
        };
        map = new google.maps.Map(document.getElementById("map"), myOptions);
        
        var marker = new google.maps.Marker({
            position: latlng,
            map: map,
            title: 'Hello World!'
          });
    }
    
  

    function FindLocaiton() {
        geocoder = new google.maps.Geocoder();
        InitializeMap();

        var address = document.getElementById("addressinput").value;
        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });

            }
            else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });

    }


    function Button1_onclick() {
        FindLocaiton();
    }

    window.onload = InitializeMap;

</script>
					</head>
					<body>

						<table>

							<tr>
								<td colspan="2">
									<div id="map" style="height: 200px; width: 275px"></div>
								</td>
				
							
							</tr>
						</table>
				</td>
						</tr>
						<tr>
						<td colspan="2">
						<%-- <p>${wreck.latitute}</p>
						<p>${wreck.longitude}</p> --%>
						<a href="deleteShipwreck.do?name=${wreck.record}"><button class="deletebutton"
							type="button" name="delete">Delete</button></a>
						<a href="editShipwreck.do?name=${wreck.record}"><button
							class="deletebutton" type="button" name="${wreck.record}">Edit</button></a>
				</td>
			</tr>
		</table>
	</div>
	<footer>
	</footer>
</body>
</html>
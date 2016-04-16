<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Results Page</title>
</head>
<body>
<h1> Wreck </h1>
	<p> NOAA ID Number: ${wreck.record} </p>
	<p>Name: ${wreck.nameofship}</p>
	<p>Danger of ship: ${wreck.dangerofship}</p>
	<p>Depth of ship: ${wreck.depth}</p>
	<p>Year sunk: ${wreck.yearsunk}</p>
	<p>History put in by NOAA explorer: ${wreck.history}</p>
	<script type="text/javascript"
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
				<div id="map" style="height: 253px; width: 400px"></div>
			</td>
		</tr>
	</table>
	<p>${wreck.latitute}</p>
	<p>${wreck.longitude}</p>
	<a href="deleteShipwreck.do"><button type="button" name="delete">Delete</button></a>
	<a href="editShipwreck.do?name=${wreck.record}"><button type="button" name="${wreck.record}">Edit</button></a>

</body>
</html>
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
<title>All Shipwrecks</title>
</head>
<body class="bluebackground">
	<div>
		<h1 id="allshipwrecksheader">NOAA Shipwrecks</h1>
	</div>
	<c:forEach var="wreck" items="${wrecks}">
		<c:if test="${! empty(wreck)}">
			<table class="yellowbackground">
				<tr>
					<td><a id="recordbutton"
						href="getByRecord.do?name=${wreck.record}"> NOAA ID:
							${wreck.record}</a>
						<p class="shipinfo">Name of ship: ${wreck.nameofship} Danger
							of ship: ${wreck.dangerofship} Depth of ship: ${wreck.depth}</p>
						<p class="shipinfo">Lat: ${wreck.latitute} Long:
							${wreck.longitude}</p></td>
							<td>
						<a href="deleteShipwreck.do"><button class="deletebutton" type="button" name="delete"> X </button></a></td>
				</tr>
			</table>
		</c:if>
	</c:forEach>

</body>
</html>
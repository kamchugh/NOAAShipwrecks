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
	<table class="yellowbackground">
	<tr>
	<td>
		<c:forEach var="wreck" items="${wrecks}">
			<c:if test="${! empty(wreck)}">
				<p><a href="getByRecord.do?name=${wreck.record}"> NOAA ID:
					${wreck.record}</a>
				Name of ship: ${wreck.nameofship} Danger of ship:
					${wreck.dangerofship} Depth of ship: ${wreck.depth}</p>
				<p> Lat: ${wreck.latitute} Long: ${wreck.longitude}</p>
			</c:if>
		</c:forEach>
		</td>
		</tr>
	</table>
</body>
</html>
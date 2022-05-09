<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Asiakaslistaus</title>
<style>
.allright{
	text-align: right;
}
.allleft{
	text-align: left;
}
.center{
	text-align: center;
}
body {
  background-color: whitesmoke;
}
table {
	text-align: center;
	background-color:slateblue
	
}

tr {
	background-color:slateblue;"
}
</style>

</head>
<body>

<form action="haeasiakkaat" method="get">
<table id="list">
	<thead>
		<tr style="background-color:slateblue;">
			<th colspan="6" class="center"><a href='lisaaasiakas.jsp'><span style=color:black;font-weight:bold>Lisää uusi asiakas</span></a></th>
			  
		</tr>	
		<tr style="background-color:slateblue;">
			<th style=text-align:right>Hakusana:</th>
			<th colspan="4"><input type="text" name="searchwrd" id="searchwrd" value="${param['searchwrd']}"></th>
			<th style=text-align:left><input type="submit" value="hae" id="searchbtn"></th>
		</tr>			
		<tr>
			<th> Asiakas nro. </th>
			<th> Etunimi </th>
			<th> Sukunimi </th>
			<th> Puhelin </th>
			<th> S-posti </th>
			<th></th>							
		</tr>
	</thead>
	<tbody>
		<c:set var="color" value="0"/>
		<c:forEach items="${asiakkaat}" var="listItem">
				<c:choose>
					<c:when test="${color=='0'}">
						<tr style="background-color:grey;">
					        <td>${listItem.asiakasnro}</td>
					        <td>${listItem.etunimi}</td>
					        <td>${listItem.sukunimi}</td>
					        <td>${listItem.puhelin}</td>
					        <td>${listItem.sposti}</td>
					        <td>
					        	<a href="muutaasiakas?asiakasid=${listItem.asiakasnro}" class="muuta">muuta</a>
					        	<a onclick="varmista('${listItem.asiakasnro}')" class="poista" style="color:red">poista</a>			        	
					        </td>
				        </tr>
			        <c:set var="color" value="1"/>
					</c:when>
					<c:when test="${color=='1'}">
						<tr style="background-color:lightgrey;">
					        <td>${listItem.asiakasnro}</td>
					        <td>${listItem.etunimi}</td>
					        <td>${listItem.sukunimi}</td>
					        <td>${listItem.puhelin}</td>
					        <td>${listItem.sposti}</td>
					        <td>
					        	<a href="muutaasiakas?asiakasid=${listItem.asiakasnro}" class="muuta">muuta</a>
					        	<a onclick="varmista('${listItem.asiakasnro}')" class="poista" style="color:red">poista</a>			        	
					        </td>
				        </tr>
			        <c:set var="color" value="0"/>
					</c:when>
				
				</c:choose>
				
		    </c:forEach>
	</tbody>
</table>
</form>
<script type="text/javascript">

function varmista(asiakasid){
	if(confirm("Haluatko varmasti poistaa asiakkaan "+ asiakasnro + "?")){
		document.location="poistaasiakas?asiakasid="+asiakasnro;
	}
}


</script>
</body>
</html>


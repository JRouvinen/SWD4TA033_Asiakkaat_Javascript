<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="scripts/main.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Muuta asiakas</title>
<style>
.allright{
	text-align: right;
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
<form id="chgcustomer" action="muutaasiakas" method="post">
	<table>
		<thead>	
			<tr style="background-color:slateblue;">	
				<th colspan="5" class="center"><a href='listaaasiakkaat.jsp'><span style=color:black;font-weight:bold>Takaisin listaukseen</span></a></th>
			</tr>		
			<tr style="background-color:slateblue;">
				<th>Asiakas nro.</th>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>S-posti</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="asiakasid" id="asiakasid" value="${asiakas.asiakasnro}"></td>
				<td><input type="text" name="etun" id="etun" value="${asiakas.etunimi}"></td>
				<td><input type="text" name="sukun" id="sukun" value="${asiakas.sukunimi}"></td>
				<td><input type="text" name="puh" id="puh" value="${asiakas.puhelin}"></td>
				<td><input type="text" name="sposti" id="sposti" value="${asiakas.sposti}"></td> 
				<td><input type="button" id="change" value="Muuta tiedot" onclick="validate()"></td>
			</tr>
		</tbody>
	</table>
	<input type="hidden" name="vanhaasiakasid" id="vanhaasiakasid" value= "${asiakas.asiakasnro}">	
</form>
<span id="info"></span>
</body>
<script>
function validate(){
	
	if(document.getElementById("asiakasid").value.length<0){
		document.getElementById("info").innerHTML="Asiakasnumero ei kelpaa!";
		return;
	
	}else if (document.getElementById("asiakasid").value*1!=document.getElementById("asiakasid").value){
		document.getElementById("info").innerHTML="Asiakasnumero ei ole luku!";
		return;
		
	}else if(document.getElementById("etun").value.length<2){
		document.getElementById("info").innerHTML="Etunimi on liian lyhyt!";
		return;
	}else if(document.getElementById("sukun").value.length<2){
		document.getElementById("info").innerHTML="Sukunimi on liian lyhyt!";
		return;
	}else if(document.getElementById("puh").value*1!=document.getElementById("puh").value){
		document.getElementById("info").innerHTML="Puhelinnumero ei ole luku!";
		return;
	}else if(document.getElementById("sposti").value.length<5){
		document.getElementById("info").innerHTML="Sähköposti on liian lyhyt!";
		return;
	}
	document.getElementById("asiakasid").value=clean(document.getElementById("asiakasid").value);
	document.getElementById("etun").value=clean(document.getElementById("etun").value);
	document.getElementById("sukun").value=clean(document.getElementById("sukun").value);
	document.getElementById("puh").value=clean(document.getElementById("puh").value);
	document.getElementById("sposti").value=clean(document.getElementById("sposti").value);
	document.forms["chgcustomer"].submit();
}

function clean(text){
	text=text.replace("<","");
	text=text.replace(";","");
	text=text.replace("'","''");
	return text;
}
</script>
</html>
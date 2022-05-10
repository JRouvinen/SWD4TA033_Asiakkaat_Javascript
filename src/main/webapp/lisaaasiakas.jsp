<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="scripts/main.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Lisää asiakas</title>
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
<form id="addcustomer" action="lisaaasiakas" method="post">
	<table>
		<thead>	
			<tr style="background-color:slateblue;">	
				<th colspan="5" class="center"><a href='listaaasiakkaat.jsp'><span style=color:black;font-weight:bold>Takaisin listaukseen</span></a></th>
			</tr>		
			<tr style="background-color:slateblue;">
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>S-posti</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="etun" id="etun"></td>
				<td><input type="text" name="sukun" id="sukun"></td>
				<td><input type="text" name="puh" id="puh"></td>
				<td><input type="text" name="sposti" id="sposti"></td> 
				<td><input type="button" id="save" value="Lisää asiakas" onclick="validate()"></td>
				
			</tr>
		</tbody>
	</table> 
	<input type="hidden" name="asiakasid" id="asiakasid">   
</form>
<span id="info"></span>
</body>
<script>
function validate(){
	if(document.getElementById("etun").value.length<3){
		document.getElementById("info").innerHTML="Etunimi on liian lyhyt!";
		return;
	}else if(document.getElementById("sukun").value.length<2){
		document.getElementById("info").innerHTML="Sukunimi on liian lyhyt!";
		return;
	}else if(document.getElementById("puh").value.length<6){
		document.getElementById("info").innerHTML="Puhelinnumero on liian lyhyt!";
		return;
	}else if(document.getElementById("puh").value*1!=document.getElementById("puh").value){
		document.getElementById("info").innerHTML="Puhelinnumero ei ole numero!";
		return;
	}else if(document.getElementById("sposti").value.length<5){
		document.getElementById("info").innerHTML="Sähköposti on liian lyhyt!";
		return;
	}else if(document.getElementById("asiakasid").value*1!=document.getElementById("asiakasid").value){
		document.getElementById("info").innerHTML="Asiakasnumero ei ole numero!";
		return;
	}
	document.getElementById("etun").value=clean(document.getElementById("etun").value);
	document.getElementById("sukun").value=clean(document.getElementById("sukun").value);
	document.getElementById("puh").value=clean(document.getElementById("puh").value);
	document.getElementById("sposti").value=clean(document.getElementById("sposti").value);
	document.getElementById("asiakasid").value=addcustomerid();
	document.forms["addcustomer"].submit();
	document.getElementById("info").innerHTML="Asiakkaan lisääminen onnistui";
	
}

function addcustomerid(custid){
	custid="";
	return custid;
}

function clean(text){
	text=text.replace("<","");
	text=text.replace(";","");
	text=text.replace("'","''");
	return text;
}
</script>
</html>
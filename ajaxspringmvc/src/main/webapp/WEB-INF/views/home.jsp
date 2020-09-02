<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:url var="home" value="/json"/>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
	
	<form action="/" method="POST" id="formSubmit">
		Full name: <input type="text" name="name"><br/>
		Email: <input type="text" name="email"><br/>
		Phone: <input type="text" name="phone"><br/>
		Id: <input type="text" name="idcard"><br/>
		<input type="submit" id="btnSubmit" value="Submit">
	</form>
	
	<table>
	
	</table>
	<p id="fullname"></p>

	<script src="<c:url value = '/resources/jquery-3.5.1.js'/>"></script>
	<script>
		$(document).ready(function(){
			$('#btnSubmit').click(function(e){
				e.preventDefault();
				var dataModel = {};
				var formData = $('#formSubmit').serializeArray();
				$.each(formData, function(i, v){
					dataModel['' + v.name + ''] = v.value;
				});
				submit(dataModel);	
			});
		})
		
		function submit(dataModel){
			$.ajax({
				type : 'POST',
				contentType : 'application/json; charset=utf-8',
				url : '${home}',
				data : JSON.stringify(dataModel),
				dataType : 'json',
				success : function(result) {
					// tao nho la vahy
					$("#fullname").html(result.name);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
	
	</script>

</body>
</html>

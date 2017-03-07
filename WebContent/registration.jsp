<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
</head>
<body>
	<form action='Register' method="post" id="regform">
		<fieldset style= "margin:auto text-align:center">
			<p><label for="usnm">Username</label> <input type="text" name="username" id="usnm" required/></p>		
			<p><label for="eml">Email</label> <input type="text" name="email" id="eml" required/></p>			
			<p><label for="psword">Password</label> <input type="password" id="psword" name="psword" required/></p>			
			<p><label for="cfmpsword">Confirm Password</label> <input type="password" id="cfmpsword" name="cfmpsword" required/></p> 
			<br>
			<input class="submit" type="submit" value="Register"/> 
		</fieldset>		
	</form>
	  <script>
	$(document).ready(function(){
		$("#regform").validate({
			rules: {				
				cfmpsword : 
				{
					equalTo: "#psword"
				}			
			}				
		});		
	});		
	</script>
</body>
</html>
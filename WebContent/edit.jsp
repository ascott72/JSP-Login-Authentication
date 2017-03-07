<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit User</title>
</head>
<body>
<!--Page is Loaded in admin page modal from Login Servlet  -->
				<form action="Register" id="editform" method="post">
							<fieldset style= "margin:auto text-align:center">
								<div>
									<label for="uid" >ID</label>
									<input class="theinput" type="text" readonly="readonly" name="userid" id="uid" value="<c:out value ="${user.userID}"/>" />
								</div>
								<div>
									<label for="usnm">Username</label>
									<input class="theinput" type="text" name="username" id="usnm" value="<c:out value ="${user.username}"/>" required/>	
								</div>
								<div>	
									<label for="psword">Password</label> 
									<input class="theinput" type="text" name="psword" id="psword" value="<c:out value ="${user.psword}"/>" required/>	
								</div>		
								<br>
								<input class="back-home-btn" type="submit" value="Update"/> 
							</fieldset>		
						</form>

</body>
</html>
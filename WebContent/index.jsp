<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Index Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="thestyles.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div id="container">
		<div align="center" id="loginBox">
			<form action='Login' method="post" id="userform">
				<fieldset style= "margin:auto text-align:center">
				<legend class="legend-bold" >Login</legend>
					<div>					
						<label>Username:</label>
						<input class="theinput" type="text" placeholder= "Enter email" name="email" required/>
					</div>
					<div>
						<label>Password:</label>
						<input class="theinput" type="password" placeholder = "Enter password" name="psword" required/>
					</div>				
					<br>
					<input class="submit" type="submit" value="Login"/> 
					
				</fieldset>
				
			</form>
			<br>
			<div id="footer2">
				<p style="color:black"> New? <a href="#registerModal" id="registerLink">Register</a></p>			
				<a href="Login?action=listUsers">Admin page</a>
			</div>
		</div>
		<!-- Modal for registration-->
	  	<div class="modal fade" id="registerModal" role="dialog">
			<div style="text-align: center" class="modal-dialog">
		    
		    	 <!-- Modal content-->
			      <div class="modal-content">
				       <div class="modal-header" style="padding:25px 40px;">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4> Register</h4>
				       </div>
				       <!-- Modal body-->
				       <div class="modal-body" style="padding:30px 40px;">
				        <form action='Register' method="post" id="regform">
							<fieldset style= "margin:auto text-align:center">
								<div>
									<label for="usnm">Username</label> 
									<input class="theinput" type="text" name="username" id="usnm" placeholder="Enter Username" required/>
								</div>		
								<div>
									<label for="eml">Email</label> 
									<input class="theinput" type="text" name="email" id="eml" placeholder="Enter Email" required/>
								</div>			
								<div>
									<label for="psword">Password</label> 
									<input class="theinput" type="password" id="psword" name="psword" placeholder="Enter Password" required/>
								</div>			
								<div>
									<label for="cfmpsword">Confirm Password</label> 
									<input class="theinput" type="password" id="cfmpsword" name="cfmpsword" placeholder="Confirm Password" required/>
								</div> 
								<br>
								<input class="submit" type="submit" value="Register"/> 
							</fieldset>				
						</form>
						</div>
						<!-- Modal footer-->
						<div class="modal-footer">
					          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>          
					    </div>					
				</div>
			</div>
	  	</div>
	  	
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
				$("#registerLink").click(function(){
			        $("#registerModal").modal();
			    });
			});		
		</script>
	</div>
	<div id="footer"></div>
</body>
</html>
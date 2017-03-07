<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.dao.LoginModel" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Users</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="thestyles2.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div class= "top-header">
		<span class= "home-logo"><a href="/JSPLogin"></a></span>
		<h1 class="admin-header">Welcome Admin</h1>
	</div>
	<div class="container">
		<div class="content">
			<table class="admin-table">
				<thead>
					<tr>
						<th>User Id</th>
						<th>Username</th>
						<th>Password</th>
						<th>Email</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
			
				<tbody>
					<c:forEach items="${users}" var="user">
						<tr>
							<td><c:out value= "${user.userID}"/></td>
							<td><c:out value= "${user.username}"/></td>
							<td><c:out value="${user.psword}"/></td>
							<td><c:out value= "${user.email}"/></td>
							<td><a data-toggle="modal" href="#editModal" id="<c:out value="${user.userID}"/>" class="edit-link" >Edit</a></td>
						<td><a href="Login?action=remove&userid=<c:out value="${user.userID}"/>">Remove</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- Modal for Edit-->
	  	<div class="modal fade" id="editModal" role="dialog">
			<div style="text-align: center" class="modal-dialog">
		    
		    	 <!-- Modal content-->
			      <div class="modal-content">
				       <div class="modal-header" style="padding:25px 40px;">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4> Edit User</h4>
				       </div>
				       <!-- Modal body-->
				       <div class="modal-body" style="padding:30px 40px;">
				       		<div class="load-body"></div>	       
				        	
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
					
				$(".edit-link").click(function(){
					var userid= $(this).attr('id');
					var action= 'edit';
					var data= "action="+ action + "&userid=" +userid;
					
					$.ajax({
						type: "Get",
						url: 'Login',
						data: data,
						success: function(response){
							$(".load-body").html(response);
						},
						error : function() {
							alert('error');
						}
					});
				});				
			});
		</script>
	</div>
	<div class="footer"> <button class="back-home-btn" onclick="history.back()">Back</button> </div>
	
</body>
</html>
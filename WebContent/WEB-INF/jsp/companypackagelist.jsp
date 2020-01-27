<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
        	html,body{
			height: 100%;
			margin: 0;
			background: rgb(2,0,36);
            background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(149,199,20,1) 0%, rgba(0,212,255,1) 96%);
		
		}
		
</style>
</head>
<body>
<%String name = (String)session.getAttribute("company_name");
%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
  <div class="container text-center">
  <h1><%=name %></h1>
<h1>Packages List</h1>
<table border="2" width="100%" cellpadding="10">  
<tr><th>Plan Name</th><th>Speed</th><th>FUP</th><th>Post_fup</th><th>One Month</th><th>Three Month</th><th>Six Month</th><th>Twelve Month</th></tr> 
   <c:forEach var="pack" items="${list}">   
    <tr>
  <td>${pack.plan_name}</td>  
   <td>${pack.speed}</td>  
   <td>${pack.fup}</td>  
   <td>${pack.post_fup}</td>
   <td>${pack.one_month}</td>  
   <td>${pack.three_month}</td>  
   <td>${pack.six_month}</td>  
   <td>${pack.twelve_month}</td>  
    <td><a href="editpackage/${pack.package_id}"><button class="btn-success">Edit</button></a></td>  
   <td><a href="deletepackage/${pack.package_id}"><button class="btn-primary">Delete</button></a></td>
    </tr>
   
   </c:forEach>  
   </table><br>
   <a href ="addpackage"><button class="btn-primary">Add Package</button></a>
   <a href ="logout"><button class="btn-success">Logout</button></a>
   </div>
     
</body>
</html>
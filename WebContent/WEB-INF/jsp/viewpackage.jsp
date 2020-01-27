<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Packages List</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <jsp:include page="index1.jsp"></jsp:include>
        <style>
        	html,body{
			height: 100%;
			margin: 0;
			background: rgb(2,0,36);
            background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(149,199,20,1) 0%, rgba(0,212,255,1) 96%);
		
		}
		#p {
  margin: auto;
   margin-top: 60px;
  width: 60%;
  border: 3px solid #73AD21;
  padding: 10px;
}
</style>
</head>
<body>

<%String name = (String)session.getAttribute("company_name");
%>
<h1 class="text-center"><%=name %></h1>
<hr>
<h1 class="text-center">Packages List</h1>
<hr>
<div class="container text-center" id="p">



<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
  
<table  cellpadding="10">  
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
   <td> </td>
    <td> </td>
   <td><a href="buypackage/${pack.package_id}"><button class="btn-primary">Buy Package</button></a></td>  
   </tr>
   
   </c:forEach>  
   
   </table>
  </div>
</body>
</html>
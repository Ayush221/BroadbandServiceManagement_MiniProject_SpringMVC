<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Company Login</title>
<link href="${pageContext.request.contextPath}/resources/css/userlogin.css" rel="stylesheet">
<jsp:include page="index1.jsp"/>
<style>
        	html,body{
			height: 100%;
			margin: 0;
			background: rgb(2,0,36);
            background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(149,199,20,1) 0%, rgba(0,212,255,1) 96%);
		
		}
		#p {
  margin: auto;
   margin-top: 120px;
  width: 60%;
  border: 3px solid #73AD21;
  padding: 10px;
}
		</style>
</head>
<body>
  <div class="container col-md-4 " id="p">
  <h1>Company Login</h1><hr>
   <form method="post" modelAttribute="login" action="cmplogin" >    
 <div>
 ${loginError}
  </div>
  <div>
    <label for="email"><b>User Name</b></label>
    <input type="text"  name="email">
</div>
<div>
    <label for="password"><b>Password</b></label>
    <input type="password"  name="password" >
     </div>   
    <button type="submit">Login</button>
   
    
       </form><br>
<p>Not Registered ?<a href="companyregistration"> New Company Registration</a></p>
</div>
</body>
</html>


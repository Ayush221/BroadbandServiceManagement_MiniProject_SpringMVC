<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Service Provider List</title>
<jsp:include page="index1.jsp" />  
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
<%@page import="com.model.Company,java.io.ByteArrayOutputStream,java.awt.image.BufferedImage,java.io.File,javax.imageio.ImageIO,java.io.ByteArrayInputStream"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
      

   <div class="container" id="p">
                <h1 class="text-center">Service Provider List</h1>
                <hr class="w-25 mx-auto bg-primary "> 
                 <c:forEach var="cmp" items="${list1}">   
                          <div class="row" >
                           <div class="col-md-4 col-12">
                                        
                                       <h4>${cmp.company_name}</h4>
                          </div>
                                <div class="col-md-4 col-12" >
                                      <img src="${pageContext.request.contextPath}/resources/Images/${cmp.image}  " width="100" height="100" class="img-fluid " />
                                       </div> <br><br>
                         <div class="col-md-4 col-12">
                         <a href="userpackage/${cmp.company_id}"><button class="btn-success">view package</button></a>
                         </div> 
                         </div>
                                         </c:forEach> 
                          </div>
  

 
 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <link href="${pageContext.request.contextPath}/resources/css/addpackage.css" rel="stylesheet">
<title>Package Registration</title>
 <style>.error{color:red ;font-weight: bold;}  

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
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row d-flex justify-content-center" id="p">
<div class="container col-md-6 ">
<h1>Add New package</h1>
<form:form action="savepackage" method="post">    
        <table cellpadding="8">    
         <tr>    
          <td>Plan Name</td>   
          <td><form:input type="text" path="plan_name"/></td>
          <td><form:errors path="plan_name" cssClass="error"/></td>  
         </tr> 
            
         <tr>    
          <td>Speed</td>    
          <td><form:input type="text" path="speed"/></td>
          <td><form:errors path="speed" cssClass="error"/></td>   
         </tr>  
         <tr>    
          <td>FUP :</td>    
          <td><form:input type="text" path="fup"/></td>  
         </tr>
         <tr>    
          <td>POST FUP:</td>    
          <td><form:input type="text" path="post_fup"/></td>  
         </tr>
         <tr>    
          <td>ONE MONTH PLAN</td>    
          <td><form:input type="text" path="one_month"/></td>  
         </tr>
         <tr>    
          <td>TWO MONTH PLAN</td>    
          <td><form:input type="text" path="three_month"/></td>  
         </tr>
          <tr>    
          <td>SIX MONTH</td>    
          <td><form:input type="text" path="six_month"/></td>  
         </tr>
          <tr>    
          <td>TWELVE MONTH</td>    
          <td><form:input type="text" path="twelve_month"/></td>  
         </tr>
    
         <tr>    
          <td><input type="submit" class="btn-primary" value="Add Package"></td>  
          <td><input type="reset" class="btn-warning" value="Reset"></td>
         </tr>   
            
        </table>    
       </form:form>
       </div>
       </div> 
</body>
</html>
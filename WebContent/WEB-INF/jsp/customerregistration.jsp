<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
       

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Registration</title>
<script src="<c:url value="/resources/js/customerregvalidation.js" />"></script>
<style>  
.error{color:red}
        	
     html,body{
			height: 100%;
			margin: 0;
			background: rgb(2,0,36);
            background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(149,199,20,1) 0%, rgba(0,212,255,1) 96%);
		
		}
		
</style> 
<script>
function validate(){
var f=document.getElementById("form");
return (validatePassword(f)) ;
}
function  validatePassword(form){
   var error1=document.getElementById("passwordError");
   var error2=document.getElementById("confirmPasswordError");
   error1.innerHTML="Give Password";

   var password=form["pass"].value;

   error1.innerHTML="";
   error2.innerHTML="";

   var confirmPassword=form["cpass"].value;

   if(password != confirmPassword){
    error2.innerHTML="Password Does Not Match"
    return false;
   }
}</script>
</head>
<body >
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

  
  <div class="container col-md-6">
        <h1>New Customer Registration</h1> 
        <hr> 
       <form:form method="post" id="form" action="save" modelAttribute="command">    
        <table >    
         <tr>    
          <th> Customer First Name : </th>     
          <td><form:input id="name_first" path="name_first" onblur="validateuser()" /></td> 
           <td><form:errors path="name_first" cssClass="error"/></td> 
         </tr>  
           <tr>    
          <th> Customer Last Name : </th>     
          <td><form:input id="name_last" path="name_last"  /></td>
          <td><form:errors path="name_last" cssClass="error"/></td>   
         </tr> 
           <tr>    
          <th> Customer Mobile : </th>    
          <td><form:input type="number" path="mobile"  /></td>
         </tr>
           <tr>    
          <th> Customer Email : </th>    
          <td><form:input type="email" path="email"/></td> 
          <td><form:errors path="email" cssClass="error"/></td>  
         </tr> 
           <tr>    
          <th> Password :</th>    
          <td><form:password id="pass" path="password" /></td> 
           <td><form:errors path="password" cssClass="error"/></td>
           <td><font id="passwordError" style="color: red;">${passwordError}
           </font></td>
         </tr>  
           <tr>    
          <th> Confirm Password : </th>    
          <td><form:password id="cpass" path="cpassword" /></td>
          <td><form:errors path="cpassword" cssClass="error"/></td>
         <td><font id="confirmPasswordError" style="color: red;"></font> 
        </td> 
         </tr> 
         <tr>    
         <th>Purpose:</th>   
          <td> <form:radiobutton path="purpose" value="Commercial" label="Commercial"/> 
          <form:radiobutton path="purpose" value="Residential" label="Residential"/> </td> 
         </tr>   
         <tr>    
          <th>Address :</th>    
          <td><form:input path="address" /></td>  
           <td><form:errors path="address" cssClass="error"/></td>
         </tr>  
         
         <tr>    
          <th>City :</th>   
          <td><form:input path="city" /></td>  
         </tr> 
         <tr>    
          <td> </td>     
          <td><input type="submit" value="Register" onclick=" return validate()" class="btn btn-success" />
         <form:button type="reset" class="btn btn-danger ">Reset</form:button>     
         </tr>    
        </table>    
       </form:form>    
</div>
</body>
</html>
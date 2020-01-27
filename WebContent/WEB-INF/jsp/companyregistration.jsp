<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Company Registration</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <style>        
.error{color:red}  
</style>
<script>
   function validate()
   {
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
}
</script> 
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
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<div class="container col-md-6" id="p">
<h1>Company Registration Form</h1>
<form:form id="form" action="save1" method="post">
<table  align="center">
<tr>
<td>Company Name</td><td><form:input type="text" path="company_name"/></td>
 <td><form:errors path="company_name" cssClass="error"/></td>
</tr>


<tr>
<td>Email </td><td><form:input type="email" path="email" /></td>
<td><form:errors path="email" cssClass="error"/></td>
</tr>
<tr>
<td>Password </td><td><form:password id="pass" path="password" /></td>
 <td><form:errors path="password" cssClass="error"/></td>
 <td><font id="passwordError" style="color: red;">${passwordError}
           </font></td>
</tr>
<tr>
<td>Confirm Password </td>
<td><form:password id="cpass" path="confirmpassword"/></td>
<td><font id="confirmPasswordError" style="color: red;"></font></td>
</tr>

<tr>
<td>Address  </td><td><form:input path="address"/></td>
</tr>


<tr>
<td>City </td><td><form:input type="text" path="city"/></td>
</tr>
<tr>
<td>State</td><td><form:input type="text" path="state"/></td>
</tr>
<tr>
<td>Country</td><td><form:input type="text" path="country"/></td>
 <td><form:errors path="country" cssClass="error"/></td>
</tr>

<tr>
<td>Mobile Number</td><td><form:input type="text" path="mobile"/></td>
</tr>

<tr>
<td>GST Number</td><td><form:input type="text" path="gst"/></td>
 <td><form:errors path="gst" cssClass="error"/></td>
</tr>
<tr>
<td>Company Image</td><td><form:input type="file" path="image"/></td>
 <td><form:errors path="image" cssClass="error"/></td>
</tr>
<tr>

<td><input type="submit" value="Register" onclick=" return validate()" class="btn-success" ></td>
<td><input type="reset" value="Reset" class="btn-danger" ></td>
</tr>
</table>
</form:form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
 <h1>Edit Employee</h1>  
     <form:form method="POST" action="/broadbandproject/editsave" ModelAttribute="package">    
        <table >      
      
         <tr>    
          <td> Plan Name : </td>   
          <td><form:input path="plan_name"  /></td>  
         </tr>     
         <tr>    
          <td>Speed :</td>    
           <td><form:input path="speed"  /></td>
           
         </tr>   
         <tr>    
          <td>FUP :</td> 
          <td><form:input path="fup" /></td>    
          
         </tr>   
           
           
          <tr>    
          <td>Post FUP :</td>
          <td><form:input  path="post_fup"/></td>     
          
         </tr>   
           
           <tr>    
          <td>ONE MONTH PLAN :</td>  
           <td><form:input type="number" path="one_month"/></td>    
         
         </tr>   
           
           <tr>    
          <td>THREE MONTH PLAN:</td>    
           <td><form:input type="number" path="three_month"/></td> 
           
         </tr>   
           
           <tr>    
          <td>SIX MONTH PLAN :</td>    
           <td><form:input type="number" path="six_month" /></td>
           
         </tr>   
           
           <tr>    
          <td>TWELVE MONTH PLAN :</td>    
          <td><form:input type="number"  path="twelve_month"/></td>  
           
         </tr>   
           
         <tr>    
          <td> </td>    
          <td><input type="submit" value="Edit Save" /></td>    
         </tr>    
        </table>    
       </form:form>  
</body>
</html>



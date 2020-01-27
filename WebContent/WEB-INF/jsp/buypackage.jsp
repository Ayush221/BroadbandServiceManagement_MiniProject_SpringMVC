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
<title>Order Details</title>
<style>
        	html,body{
			height: 100%;
			margin: 0;
			background: rgb(2,0,36);
            background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(149,199,20,1) 0%, rgba(0,212,255,1) 96%);
		
		}
		div {
  margin: auto;
   margin-top: 120px;
  width: 60%;
  border: 3px solid #73AD21;
  padding: 10px;
}
		</style>
<script>

function textappend(){
	var data=document.getElementById('data').value;
	document.getElementById('output').innerHTML = data;

}
function textappend1(){
	var data=document.getElementById('data1').value;
	document.getElementById('output').innerHTML = data;

}
function textappend2(){
	var data=document.getElementById('data2').value;
	document.getElementById('output').innerHTML = data;

}
function textappend3(){
	var data=document.getElementById('data3').value;
	document.getElementById('output').innerHTML = data;

}

function validate()
{
	var f=document.getElementById("form");
	return (validateBill(f)  ) ;
	
	}
	
	    function validateBill(form)
	    {
		var error=document.getElementById("billerror");

	    var b=form["bill"].value;

	    error.innerHTML="";

	    if( b==null || b=="")
	      {
	        error.innerHTML="Fill This";
	        return false;
	      }
	    
        }
	    
	    function validateDuration(form)
		{
			var error=document.getElementById("durerror");

		    var b=form["data"].value;
		    var b1=form["data1"].value;
		    var b2=form["data2"].value;
		    var b3=form["data3"].value;

		    error.innerHTML="";

		    if( b==null || b1==null || b2==null || b3==null )
		    {
		        error.innerHTML="Choose Plan";
		        return false;
	        }
		}
</script>

</head>
<body>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<div class="container col-md-6">
        <h1>Order Details</h1>  
       <form:form id="form" method="post" modelAttribute="orderdetails" action="/broadbandproject/orderdetailsave">    
        <table >    
         <tr>    
           <th> Billing Address : </th>
          <td><input id="bill" type="text" name="billing_address"  /></td>
          <td><font id="billerror" style="color: red;">${billerror}
           </font></td>  
         </tr>  
           <tr>    
           <th> Name : </th>    
          <td><input type="text" name="buyer_name"/></td>  
         </tr> 
           <tr>    
          <th> Customer Mobile : </th>     
          <td><input type="number" name="mobile"  /></td>  
         </tr>
         <tr>    
          
         <tr>    
          <th>Choose Duration</th>     
         <td> <input type="radio" id="data" name="duration" value="${onemonth}"onclick="textappend()"/> One Month  
         <input type="radio" id="data1" name="duration" value="${threemonth}" onclick="textappend1()"/> Three Month
           <input type="radio" id="data2" name="duration" value="${sixmonth}" onclick="textappend2()" /> Six Month
           <input type="radio" id="data3" name="duration" value="${twelvemonth}" onclick="textappend3()" />Twelve month
            <td><font id="durerror" style="color: red;">${durerror}</font></td> 
         </tr>  
          <tr>    
          <th>Price </th>    
          <td><p id="output"></p></td>    
         </tr>  
         <tr>    
           
          <td><input type="submit" class="btn-success" value="Place Order" onclick="return validate()" /></td>    
         </tr>    
        </table>    
       </form:form>
       
   </div>    
</body>
</html>
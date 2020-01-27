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



}
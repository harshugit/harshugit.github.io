function validate()
{
  var a=document.forms["Register"]["name"].value;
  var b=document.forms["Register"]["mobile"].value;
  var c=document.forms["Register"]["email"].value;  
  var pw=document.forms["Register"]["epassword"].value;
  var cpw=document.forms["Register"]["cpassword"].value;

if(a==null || a=="")
{
 alert("Names cannot be blank");
 return false;
}
else if(a.length<6)
{
 alert("Characters must be more than 6");
 return false;
}
else if(b==null || b=="")
{
 alert("Please enter your mobile number");
 return false;
}
else if(c==null || c=="")
{
 alert("Please enter your email id");
 return false;
}
else if(pw==null || pw=="")
{
alert("Password cannot be blank");
return false;
}
else if(pw.length<5)
{
 alert("Password characters must be more than 5");
 return false;
}
else if(pw.length>15)
{
 alert("Password characters must be less than 10");
 return false;
}
else if(pw!=cpw){
 alert("Password does not match");
}
}/**
 * 
 */
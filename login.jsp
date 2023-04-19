<html>  
<head>  
<title>  
JQuery validation Example 3  
</title>  
<meta name="viewport" content="width=device-width, initial-scale=1">  
<head>  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">  
<style>  
form div {  
  margin-bottom: 10px;  
} 
.error {  
  color: red;  
  margin-left: 5px;  
}  
h2 {  
  font-weight: bold;  
  margin-bottom: 2.5rem;  
  color: #fff;  
  align: center;  
  font-size: 30px;  
  margin-top: 2.5rem;  
}  
[type="submit"] {  
    display: inline-block;  
    padding: 0.35em 1.2em;  
    border: 0.1em solid #3494e6;  
    margin: 0 0.3em 0.3em 0;  
    border-radius: 0.12em;  
    box-sizing: border-box;  
    text-decoration: none;  
    font-family: 'Roboto',sans-serif;  
    font-size: 1rem;  
    text-align: center;  
    transition: all 0.2s; 
    margin-left: right;
    }  
    [type="submit"]:hover {  
    color: #FFFFFF;  
    background-color: #3494e6;  
}  
label.error {  
  display: inline;  
}  
body {  
align: center;  
  font-family: "Poiret One", cursive;  
  background: #3494e6; 
  margin-top: 100px; 

}  
label{
  display: inline-block;
  
}
.form_values{
  margin: auto;
  border: 10px solid black;
  background: -webkit-linear-gradient(  
    to right,  
    #ec6ead,  
    #3494e6  
  );
  background: linear-gradient(  
    to right,  
    #ec6ead,  
    #3494e6  
  ); 
  width: 40%;
  padding: 20px;
  border-width: 25px;
  border-radius: 25px;
  box-shadow: 10px 10px rgb(217, 220, 221);
}
</style>  
</head>  

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>    

<body>  
<!-- First Form -->  
<div class="form_values">
<h2 style="text-align: center;">Guest Sign-up page </h2> 

<form action="check.jsp">    
  <div>  
    <label for="email" style="padding-left:45px"> Enter your Email: </label>  
    <input type="text" id="email" name="email" onchange="email1()" placeholder="Enter your email" size="20%" required></input> 
    <p id="check_email"></p>
    <script>
         function email1(){
         var emails=document.getElementById("email").value;
          console.log(emails);
          var email =document.getElementById("email").value;
         let temp=/^\w+([\.-]\w?+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
          //let temp=email.match()
          if(email.match(temp)){
            document.getElementById("check_email").innerHTML="email is valid";
            document.getElementById("check_email").style="color:green";
          }
          else{
            document.getElementById("check_email").innerHTML="email is invalid";
            document.getElementById("check_email").style="color:red";
          }
        }
    </script>
  </div>  
  <br>
  <div>  
    <label for="password" style="padding-left:15px"> Enter your password: </label>  
    <input type="text" id="password" size="30%" name="password" placeholder="Enter your password" onchange="password1()" required></input> 
  <input type="submit" size="100px" value="Log-in" onclick="verification">
</form> 
  </div>  
    <br>
 
<a href="login_pages.jsp">Sign-up</a>
</div>
</body>  
</html>  
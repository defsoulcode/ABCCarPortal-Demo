<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<title>Post Car - ABC Car Portal</title>
<!--  Enable Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
<link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<!-- Access the Static Resources  using spring Url  -->
<!--
<spring:url value="/css/style.css" var="myCss" />
<spring:url value="/js/custom.js" var="myJS" />

<link href="${myCss}" rel="stylesheet" />
<script src="${myJS}"></script>
-->

<!--  Access the Static Resources without using spring URL -->
<link href="/css/style.css" rel="stylesheet" />
<script src="/js/custom.js"></script>

</head>

<style>


fieldset, img {border:0}

ol, ul, li {list-style:none}

:focus {outline:none}

body {
  
  font-size: 12px;
}

body, button, input {
  font-family: 'Montserrat', sans-serif;
  font-weight: 700;

  color: black;
}

.background {
  display: flex;
  min-height: 100vh;
}

p {
  font-size: 12px;
  width: 150px;

}
h1 {
  font-size: 32px;
  font-weight: 300;
  color: black ;
  text-align: center;
  padding-top: 10px;
  margin-bottom: 10px;
}


.testbox {
  margin: 20px auto;
  width: 343px; 
  height: 464px; 
  -webkit-border-radius: 8px/7px; 
  -moz-border-radius: 8px/7px; 
  border-radius: 8px/7px; 
  background-color: #c8cfdb; 
  -webkit-box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
  -moz-box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
  box-shadow: 1px 2px 5px rgba(0,0,0,.31); 
  border: solid 1px #cbc9c9;
}

.screen-header {
  display: flex;
  align-items: center;
  padding: 10px 20px;
  background: #a9b3c4;
  border-top-left-radius: 15px;
  border-top-right-radius: 15px;
}

.screen-header-left {
  margin-right: auto;
}

.screen-header-button {
  display: inline-block;
  width: 8px;
  height: 8px;
  margin-right: 3px;
  border-radius: 8px;
  background: white;
}

.screen-header-button.close {
  background: #ed1c6f;
}

.screen-header-button.maximize {
  background: #e8e925;
}

.screen-header-button.minimize {
  background: #74c54f;
}

.screen-header-right {
  display: flex;
}

.screen-header-ellipsis {
  width: 3px;
  height: 3px;
  margin-left: 2px;
  border-radius: 8px;
  background: #999;
}

input[type=radio] {
  visibility: hidden;
}

form{
  margin: 0 30px;
}

label.radio {
	cursor: pointer;
  text-indent: 35px;
  overflow: visible;
  display: inline-block;
  position: relative;
  margin-bottom: 15px;
}


input[type=radio]:checked + label:after {
	opacity: 1;
}

hr{
  color: #a9a9a9;
  opacity: 0.3;
}


.accounttype{
  margin-left: 8px;
  margin-top: 20px;
}

a.button {
  font-size: 14px;
  font-weight: 600;
  color: white;
  padding: 6px 25px 0px 20px;
  margin: 10px 8px 20px 0px;
  display: inline-block;
  float: right;
  text-decoration: none;
  width: 50px; height: 27px; 
  -webkit-border-radius: 5px; 
  -moz-border-radius: 5px; 
  border-radius: 5px; 
  background-color: #3a57af; 
  -webkit-box-shadow: 0 3px rgba(58,87,175,.75); 
  -moz-box-shadow: 0 3px rgba(58,87,175,.75); 
  box-shadow: 0 3px rgba(58,87,175,.75);
  transition: all 0.1s linear 0s; 
  top: 0px;
  position: relative;
}

a.button:hover {
  top: 3px;
  background-color:#2e458b;
  -webkit-box-shadow: none; 
  -moz-box-shadow: none; 
  box-shadow: none;
  
}


</style>

<body>

	<!-- Test My JS -->
	<!-- <input type="button" class="button" onclick="sayHello();" value="Click me!">  -->

	<%@ include file="header.jsp"%>


<div class="testbox">
<div class="screen-header">
	 <div class="screen-header-button close"></div>
     <div class="screen-header-button maximize"></div>
     <div class="screen-header-button minimize"></div>
</div>
  <h1></h1>
  
  
<c:url var="post_url" value="cars"/>			
				<form action="${post_url}" id="myform" method="post">
				
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
					
					<div class="form-group">
					<label for="make">Car Make:</label> 
					<input type="text" name="make" id="make" value="" class="form-control" required="true"></input>
					</div>
					
					
					<div class="form-group">
					<label for="model">Car Model:</label> 
					<input type="text" name="model" id="model" value="" class="form-control" required="true"></input> 
					</div>
					
					<div class="form-group">
					<label for="registeration">Registration:</label> 
					<input type="text" name="registeration" id="registeration" value="" class="form-control" required="true"></input>
					</div>
				
					<div class="form-group">
					<label for="price">Car Price:</label> 
					<input type="text" name="price" id="price" value="" class="form-control" required="true"></input>
					</div>
					<!-- div class="form-group">
					<label for="photo">Car Photo:</label> 
					<input type="text" name="photo" id="photo" value="" class="form-control" required="true"></input>
					</div>
					< div class="custom-file">
				      <label for="photo">Car Photo:</label> 
					  <input type="file" class="custom-file-input" id="photo" name="photo">
					  <label class="custom-file-label" for="photo">Choose file</label>
					</div-->
					<input type="submit" name="Add" value="Post a Car for Sale" class="btn btn-primary"/>
					<input type="button" value="Cancel" onclick="cancel()" class="btn btn-danger"/>


					<script>
						function cancel() {
							window.location.href = "cars"
						}
					</script>
				</form>
</div>

	<%@ include file="footer.jsp"%>

</body>
</html>

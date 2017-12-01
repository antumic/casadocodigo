<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://www.springframework.org/tags/form" prefix = "form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



	<head>
	
		<title>Login</title>
		
		<c:url value="/" var="contextPath" />
	    <link href="${contextPath}resources/bootstrap_files/bootstrap.min.css" rel="stylesheet">
	    <link href="${contextPath}resources/bootstrap_files/signin.css" rel="stylesheet">
	    
	</head>
	
	
<body>



	<div class="container">
		<form:form servletRelativeAction="/login" class="form-signin">

        	
       		<label> &nbsp Usuário:</label>
        	<input type="text" name="username" class="form-control" required="" autofocus="">
        
        	<br>  
        
        	<label>&nbsp Senha:</label>
        	<input type="password" name="password" class="form-control" required="">

        	<button class="btn btn-primary btn-block" name="submit" type="submit">Acessar</button>
     
     	 </form:form>
    </div>





</body>
</html>
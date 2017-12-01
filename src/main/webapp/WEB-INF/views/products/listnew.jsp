<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix = "sec" %>
<%@ taglib uri = "http://www.springframework.org/tags" prefix = "spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<head>
		<c:url value="/" var="contextPath" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <meta name="author" content="">
		<title> Lista de produtos </title>
	    <link href="${contextPath}resources/bootstrap_files/bootstrap.min.css" rel="stylesheet">
	    <link href="${contextPath}resources/bootstrap_files/carousel.css" rel="stylesheet">   
	    
	    
	    		
		<style type="text/css">
			#floatbtn {
				margin-right:-150px;
				top:20%;
 				width:60px;
 				height:60px;
 				 
				} 
		</style> 
	     
	    
	    
	</head>

	
<body>

  
    <c:set var = "countEstoque" value ="${fn:length(products)}" /> 
	<c:if test = "${countEstoque < 1}"> 
	<br><br>
		&nbsp Não existem livros cadastrados! <br>
		&nbsp <a href="http://localhost:8080/casadocodigo/products/form">Clique aqui para cadastrar</a>
	</c:if> 
	
	
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="user"/>  </sec:authorize>
	

    <header>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active"> 
            	
              <a class="nav-link" href="http://localhost:8080/casadocodigo/products">Livros<span class="sr-only">(current)</span></a> 
            </li>  
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:8080/casadocodigo/products/form">Formulário de cadastro</a>
            </li>
            <li class="nav-item"> 
              <a class="nav-link" href="http://localhost:8080/casadocodigo/shopping">Meu carrinho (${shoppingCart.quantity}) <span class="sr-only">(current)</span></a> 
            </li>             
          </ul>
          
          
          
          
 
		           
          
			<ul class="nav navbar-nav navbar-right"> 
		            <li class="nav-item dropdown">
				      <a class="nav-item nav-link dropdown-toggle mr-md-2" href="#" id="bd-versions" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
${user.name}

							<!--<sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal" var="user"/>
								<spring:message code="users.welcome" arguments="${user.name}"/>
							</sec:authorize>-->


				      </a>
				      <div class="dropdown-menu dropdown-menu-right" aria-labelledby="bd-versions">
				        <a class="dropdown-item" href="http://localhost:8080/casadocodigo/logout">Sair</a>
				
				      </div>
				    </li>
		     </ul>
		 
 
 
 
 
        </div>
      </nav>
    </header>


<br><br>

 
  



    <main role="main"> 
		 
		<div class="container marketing">
        	<div class="row">
		          <c:forEach var="product" items="${products}">
			          <div class="col-lg-4"> 
			          	<br> 
			            <img itemprop="image" width="160px" height="240px" src='http://cdn.shopify.com/s/files/1/0155/7645/products/cover-apis-java_large.jpeg?v=1423244220'" alt="${product.title}">
			            <br>
			            <h5>${product.title}</h5>
			            <c:url value="/products/${product.id}" var="linkDetalhar"/>
			            <p>
			            	<a class="btn btn-secondary" href="${linkDetalhar}" role="button">Ver detalhes</a>
			              	<a class="btn btn-success" href="#" role="button">Comprar</a>
			          	</p>
			          </div> 
		        </c:forEach> 
        	</div>
		</div>
 

		<c:if test = "${countEstoque > 6}"> 
	      	<footer class="container">
	      		<p class="float-right"><a href="#"><img src="${contextPath}resources/img//top.png" id="floatbtn"></a></p>
			</footer>
		</c:if> 
	
  

	</main>




    <script src="${contextPath}resources/bootstrap_files/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="${contextPath}resources/bootstrap_files/popper.min.js"></script>
    <script src="${contextPath}resources/bootstrap_files/bootstrap.min.js"></script>
    <script src="${contextPath}resources/bootstrap_files/holder.min.js"></script>
   



</body>
</html>
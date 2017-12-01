<%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="spring"
uri="http://www.springframework.org/tags"%>

<%@taglib prefix="form"
uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix = "sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<head>
		<c:url value="/" var="contextPath" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <meta name="author" content="">
		<title> Cadastro de livros </title>
	    <link href="${contextPath}resources/bootstrap_files/bootstrap.min.css" rel="stylesheet">
	    <link href="${contextPath}resources/bootstrap_files/carousel.css" rel="stylesheet">   
	</head>

	
<body>


	
	
		
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="user"/>  </sec:authorize>
	

    <header>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item"> 
            	
              <a class="nav-link" href="http://localhost:8080/casadocodigo/products">Livros<span class="sr-only">(current)</span></a> 
            </li>  
            <li class="nav-item active">
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
        	
        	
        	
        	
        	
<form:form action="${spring:mvcUrl('PC#save').build()}" method="post" commandName="product" enctype="multipart/form-data">
	 
		<div class="form-group">
			<label for="title">Título:</label><br>
			<form:input path="title" id="title" class="form-control" autofocus="autofocus"/>
			<form:errors path="title"/>
		</div>
	 
		<br> 
	
		<div class="form-group">
			<label for="description">Descrição:</label><br>
			<form:textarea path="description" rows="5" cols="10" id="description" class="form-control"/>
			<form:errors path="description"/>
		</div> 
		
		<br>
		
		<div class="form-group">
			<label for="numberOfPages">Número de páginas:</label><br>
			<form:input path="numberOfPages" id="numberOfPages" class="form-control"/>
			<form:errors path="numberOfPages"/>
		</div>
		
		<br>
		
		<div class="form-group">
			<label for="releaseDate">Data de lançamento:</label>
			<input type="date" name="releaseDate" id="releaseDate" class="form-control"/>
			<form:errors path="releaseDate"/>
		</div>
		
		<br>
		
		<div class="form-group">
			<label>Preços:</label>
			<c:forEach items="${types}" var="bookType" varStatus="status"> 
				<div>
					<span class="input-group-addon">${bookType}</span>
					<input type="text" name="prices[${status.index}].value" id="price_${bookType}" class="form-control"/>
					<input type="hidden" name="prices[${status.index}].bookType" value="${bookType}"/>
				</div>
			</c:forEach> 
		</div>		
		
		
		<br>
		
		<div class="form-group">
			<label for="summary">Sumário do livro:</label>
			<input type="file" name="summary" id="summary" class="form-control"/>
			<form:errors path="summaryPath"/>
		</div>
		
		<br>
		


		
		
		
	
	<br>
		<div>
			<input type="button" class="btn btn-danger" value="Cancelar"> 
			<input type="submit" class="btn btn-success" value="Salvar">
		</div>
	 
	</form:form>
		        
		        
		        
		        
		        
		        
		        
        	</div>
		</div>
 

 

	</main>




    <script src="${contextPath}resources/bootstrap_files/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="${contextPath}resources/bootstrap_files/popper.min.js"></script>
    <script src="${contextPath}resources/bootstrap_files/bootstrap.min.js"></script>
    <script src="${contextPath}resources/bootstrap_files/holder.min.js"></script>
   

<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500" viewBox="0 0 500 500" preserveAspectRatio="none" style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs><style type="text/css"></style></defs><text x="0" y="25" style="font-weight:bold;font-size:25pt;font-family:Arial, Helvetica, Open Sans, sans-serif">500x500</text></svg>

</body>
</html>
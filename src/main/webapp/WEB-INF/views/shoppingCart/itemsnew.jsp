<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix = "sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<head>
		<c:url value="/" var="contextPath" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="">
	    <meta name="author" content="">
		<title> Carrinho de compras </title>
		
		<style type="text/css">
			#imgpos {
				position:absolute;
				left:50%;
				top:50%;
				margin-left:-235px;
				margin-top:-150px;
				}
		</style>



	    <link href="${contextPath}resources/bootstrap_files/bootstrap.min.css" rel="stylesheet">
	    <link href="${contextPath}resources/bootstrap_files/carousel.css" rel="stylesheet">   
	</head>

	 
<body>



	<c:if test = "${shoppingCart.quantity == 0}"> 
		<img src="${contextPath}resources/img/emptycart.png" id="imgpos">
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
            <li class="nav-item"> 
            	
              <a class="nav-link" href="http://localhost:8080/casadocodigo/products">Livros<span class="sr-only">(current)</span></a> 
            </li>  
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:8080/casadocodigo/products/form">Formulário de cadastro</a>
            </li>
            <li class="nav-item active"> 
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
			<section class="container middle">
 
 
 
 	<c:if test = "${shoppingCart.quantity >= 1}"> 


				<table class="table table-striped">
					<thead>
				    	<tr>
				      		<th>Item</th>
				      		<th>Preço</th>
				      		<th>Quantidade</th>
				      		<th>Total</th>
				    	</tr>
				  	</thead>
					<tbody>
						<c:forEach items="${shoppingCart.list}" var="item">
							<tr>
								<td class="item-title">${item.product.title}-${item.bookType}</td>
								<td class="numeric-cell">${item.price}</td>
								<td class="quantity-input-cell">${shoppingCart.getQuantity(item)}</td>
								<td class="numeric-cell">${shoppingCart.getTotal(item)}</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">
								<c:url value="/shopping/checkout" var="checkoutUrl"/>
								<form:form action="${checkoutUrl}" method="post">
									<input type="button" class="btn btn-danger" value="Limpar carrinho">  
									<input type="submit" class="checkout btn btn-success" name="checkout" value="Finalizar compra" id="checkout" />
								</form:form>
							</td>
							<td></td>
							<td class="numeric-cell"><b>${shoppingCart.total}</b></td>
						</tr>
					</tfoot>
				</table>
	
	</c:if> 
				
 			</section>
		</div>
 	</main>







    <script src="${contextPath}resources/bootstrap_files/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="${contextPath}resources/bootstrap_files/popper.min.js"></script>
    <script src="${contextPath}resources/bootstrap_files/bootstrap.min.js"></script>
    <script src="${contextPath}resources/bootstrap_files/holder.min.js"></script>
   



</body>
</html>
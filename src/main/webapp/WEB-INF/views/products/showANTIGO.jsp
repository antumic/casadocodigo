<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>${product.title}</title>
		<c:url value="/" var="contextPath" />
		<link rel="icon" href="//cdn.shopify.com/s/files/1/0155/7645/t/177/assets/favicon.ico?11981592617154272979" type="image/ico" />
		<link href="https://plus.googlecom/108540024862647200608" rel="publisher"/>
		<link href="${contextPath}resources/css/cssbase-min.css" rel="stylesheet" type="text/css" media="all" />
		<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'/>
		<link href="${contextPath}resources/css/fonts.css" rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/fontello-ie7.css" rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/fontello-embedded.css" rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/fontello.css" rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/layout-colors.css" rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/responsive-style.css" rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/guia-do-programador-style.css" rel="stylesheet" type="text/css"  media="all"  />
	  	<link href="${contextPath}resources/css/produtos.css" rel="stylesheet" type="text/css"  media="all"  />
	</head>

<c:url value="/shopping" var="shoppingCartUrl" />
<body>

	<ul class="container">
		<li class="category">
			<a href="#">Home</a>
		</li>
		
		<li class="category">
			<a href="/collections/livros-de-agile">
				<fmt:message key="navigation.category.agile"/>
			</a>
		</li>	
		
		<li class="category">
			<a href="/collections/livros-de-front-end">
				<fmt:message key="navigation.category.front"/>
			</a>
		</li>	
	</ul>
 
		<header id="product-highlight" class="clearfix">
			<div id="product-overview" class="container">
				<img itemprop="image" width="280px" height="395px" src='http://cdn.shopify.com/s/files/1/0155/7645/products/cover-apis-java_large.jpeg?v=1423244220' class="product-featured-image" alt="${product.title}">
				<h1 class="product-title" itemprop="name">${product.title}</h1>
				<p class="product-author">
					<span class="product-author-link"></span>
				</p>
 
				<p itemprop="description" class="book-description">
					${product.description}<br/>
					 Veja o <a href="<c:url value='/${product.summaryPath}'/>" target="_blank">sum&#225;rio</a> completo do livro!
				</p>
			</div>
		</header>
		
		<section class="buy-options clearfix">
			<form:form servletRelativeAction="/shopping" method="post" cssClass="container">

				<input type="hidden" value="${product.id}" name="productId"/>
				<ul id="variants" class="clearfix">
					<c:forEach items="${product.prices}" var="price">
						<li class="buy-option">
							<input type="radio" name="bookType" class="variant-radio" id="${product.id}-${price.bookType}"
								value="${price.bookType}" ${price.bookType.name() == 'COMBO' ? 'checked' : ''}>
							 
							<label class="variant-label" for="${product.id}-${price.bookType}"> 
								${price.bookType}
							</label> 
							<p class="variant-price"> R$  ${price.value}</p>
						</li>
					</c:forEach>
				</ul>

				
				<input type="submit" class="submit-image icon-basket-alt" alt="Compre agora" title="Compre agora '${product.title}'!" value="comprar"/>


				<input type="button" onclick="window.location.href='http://localhost:8080/casadocodigo/products'" class="submit-image icon-basket-alt" alt="Cancelar" title="Cancelar" value="Cancelar"/>
			</form:form>
		</section>





</body>
</html>

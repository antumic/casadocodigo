

import java.util.ArrayList;
import java.util.Calendar;

import antlr.collections.List;
import models.BookType;
import models.Price;
import models.Product;

public class ProductsBuilder {
	
	private List<Product> products = new ArrayList<Product>();
	
	private ProductBuilder(Products product){
		product.add(product);
	}
	
	public static ProductsBuilder newProduct(BookType bookType, BigDecimal value){
		Product book = create("Book 1",bookType, value);
		return new ProductsBuilder (book);
	}
	
	public static ProductsBuilder newProduct(){
		Product book = create("Book 1",BookType.COMBO, BigDecimal.TEN);
		return new ProductsBuilder(book);
	}
	
	private static Product create(String bookName, BookType bookType, BigDecimal value) {
		Product book = new Product();
		book.setTitle(bookName);
		book.setReleaseDate(Calendar.getInstance());
		book.setNumberOfPages(150);
		book.setDescription("great book about testing");
		Price price = new Price();
		price.setBookType(bookType);
		price.setValue(value);
		book.getPrices().add(price);
		return book;
	}
	
	public ProductBuilder more(int number){
		Product base = products.get(0);
		Price price = base.getPrices().get(0);
		for (int i = 0; i < number; i++) {
			products.add(create("Book "+i, price.getBookType(), price.getValue()));
		}
		return this;		
	}
	
	public Product buildOne() {
		return products.get(0);
	}
	
	public List<Product> buildAll(){
		return products;
	}
	
	
	
	
	

}

















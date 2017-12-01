package controllers;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import dao.ProductDAO;
import models.BookType;
import models.PaymentData;
import models.Product;
import models.ShoppingCart;
import models.ShoppingItem;


@Controller
@RequestMapping("/shopping")
public class ShoppingCartController {

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ShoppingCart shoppingCart;
	
	@Autowired
	private RestTemplate restTemplate;
	
	@RequestMapping(value="/checkout", method=RequestMethod.POST)
	public String checkout(){
		BigDecimal total = shoppingCart.getTotal();
		
		String uriToPay = "http://book-payment.herokuapp.com/payment";
		
		try {
			String response = restTemplate.postForObject(uriToPay, new PaymentData(total), String.class);
			System.out.println(response);
			return "redirect:/products";
		} catch (HttpClientErrorException exception) {
			System.out.println("Ocorreu erro ao criar o pagamento: " +exception.getMessage());
			return "redirect:/shopping";
		}	
	}
	
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String list() {
		return "shoppingCart/itemsnew";
	}
	
	 
	
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView add(Long productId, @RequestParam BookType bookType) {
		ShoppingItem item = createItem(productId, bookType);
		shoppingCart.add(item);
		return new ModelAndView("redirect:/products");
	}
	
	private ShoppingItem createItem(Long productId, BookType bookType) {
		Product product = productDAO.find(productId);
		ShoppingItem item = new ShoppingItem(product,bookType);
		return item;
	}

}

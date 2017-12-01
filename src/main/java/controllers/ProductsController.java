package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import dao.ProductDAO;
import infra.FileSaver;
import models.BookType;
import models.Product;
import javax.transaction.Transactional;
import javax.validation.Valid;




@Controller
@RequestMapping("/products")
public class ProductsController {


	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private FileSaver fileSaver;
	
	@RequestMapping("/form")
	public ModelAndView form(Product product) {
		ModelAndView modelAndView = new ModelAndView("products/formnew");
		modelAndView.addObject("types", BookType.values());
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	@Transactional
	@CacheEvict(value="lastProducts", allEntries=true)
	public ModelAndView save(MultipartFile summary, @Valid Product product, BindingResult bindingResult, RedirectAttributes redirectAttributes) {	
		
		if(bindingResult.hasErrors()){
			return form(product);
		} 
		
		String webPath = fileSaver.write("uploaded-summaries", summary);
		product.setSummaryPath(webPath);
		productDAO.save(product);
		redirectAttributes.addFlashAttribute("mensagem", "Livro cadastrado com sucesso");
		return new ModelAndView("redirect:products");
	}
	
	  
	
	@RequestMapping(method=RequestMethod.GET)
	@Cacheable(value="lastProducts")
	public ModelAndView list(){
		ModelAndView modelAndView = new ModelAndView("products/listnew");
		modelAndView.addObject("products", productDAO.list());
		return modelAndView;
	}
	  
	 
	@RequestMapping(method=RequestMethod.GET, value="/{id}")
	public ModelAndView show(@PathVariable("id") Long id){
		ModelAndView modelAndView = new ModelAndView("products/showANTIGO");
		modelAndView.addObject("product", productDAO.find(id));
		return modelAndView;
	}
	


}

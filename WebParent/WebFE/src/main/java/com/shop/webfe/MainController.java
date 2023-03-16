package com.shop.webfe;


//import com.shop.webfe.category.CategoryService;
import com.shop.webcommon.entity.Cart;
import com.shop.webfe.customer.CustomerRepository;
import com.shop.webfe.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class MainController {

	@Autowired
	ProductService productService;
	@Autowired
	CustomerRepository customerRepository;
	@GetMapping("/shopping-cart")
	public ModelAndView showCart (@SessionAttribute("cart") Cart cart){
		ModelAndView modelAndView = new ModelAndView("cart");
		modelAndView.addObject("cart",cart);
		return modelAndView;
	}
	@GetMapping
	public ModelAndView viewIndex(){
		ModelAndView modelAndView = new ModelAndView("index");
		modelAndView.addObject("products",productService.listProduct());
		modelAndView.addObject("menShirts",productService.findMenShirtsByVolume());
		modelAndView.addObject("malePants",productService.findMalePantsByVolume());
//		modelAndView.addObject("categories",categoryService.findAllCategory());
		return modelAndView;
	}
	@GetMapping("/login")
	public String viewLoginPage() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null || authentication instanceof AnonymousAuthenticationToken) {
			return "login";
		}
		return "redirect:/";
	}
	@GetMapping("/logout")
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null){
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/";
	}
	@GetMapping("/cart")
	public ModelAndView viewCart(){
		return new ModelAndView("cart");
	}
}

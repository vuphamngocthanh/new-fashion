package com.shop.webfe.controller;


import com.shop.webcommon.entity.Cart;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("cart")
public class CartController {
//    @ModelAttribute("cart")
//    public Cart setupCart(){
//        return new Cart();
//    }

//    @GetMapping("/shopping-cart")
//    public ModelAndView showCart (@SessionAttribute("cart") Cart cart){
//        ModelAndView modelAndView = new ModelAndView("cart");
//        modelAndView.addObject("cart",cart);
//        return modelAndView;
//    }

}

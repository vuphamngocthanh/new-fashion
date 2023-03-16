package com.shop.webfe.controller;

import com.shop.webcommon.entity.Cart;
import com.shop.webcommon.entity.Order;
import com.shop.webfe.config.Environment;
import com.shop.webfe.enums.RequestType;
import com.shop.webfe.momo.PaymentResponse;
import com.shop.webfe.process.CreateOrderMoMo;
import com.shop.webfe.product.ProductService;
import com.shop.webfe.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("cart")
public class ProductController {
    @Autowired
    ProductService productService;
    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/product-detail-{id}")
    public ModelAndView viewProductDetail(@PathVariable(value = "id") Long id) {
        ModelAndView modelAndView = new ModelAndView("product-left-thumbnail");
        modelAndView.addObject("productDetailDto", productService.getDetailProduct(id));
        modelAndView.addObject("relatedProducts", productService.getAllProductByCategory(id));
        return modelAndView;
    }
    @GetMapping("/remove-{id}")
    public String remove(@SessionAttribute("cart") Cart cart,@PathVariable Long id){
        cart.deleteProduct(id);
        return "cart";
    }
    @PostMapping("/add/{id}")
    public ModelAndView viewCart(@RequestParam String color,
                                 @RequestParam String size,
                                 @RequestParam Integer quantity,
                                 @PathVariable Long id,
                                 @ModelAttribute Cart cart,
                                 @RequestParam("action") String action) {
        ModelAndView modelAndView = new ModelAndView("cart");
        Order order = new Order();
        order.setId(id);
        order.setColor(color);
        order.setSize(size);
        order.setQuantity(quantity);
        order.setTotal((float) (quantity * (productService.findById(id).getPrice())));
        order.setProductDetailDto(productService.findById(id));
        cart.addProduct(order);
        System.out.println(cart);
        return modelAndView;
    }

    @ModelAttribute("cart")
    public Cart setupCart() {
        return new Cart();
    }

    @GetMapping("/shop")
    public ModelAndView showShop() {
        ModelAndView modelAndView = new ModelAndView("/shop");
        modelAndView.addObject("products", productRepository.findAll());
        return modelAndView;
    }

    @PostMapping("/momo-payment")
    public String payToMomo(@ModelAttribute Cart cart) throws Exception {
        String returnURL = "http://localhost:8080/Shopme/success";
        String notifyURL = "https://google.com.vn";
        String requestId = String.valueOf(System.currentTimeMillis());
        String orderId = String.valueOf(System.currentTimeMillis());
        Environment environment = Environment.selectEnv();
        System.out.println(cart.countTotalPayment());
        PaymentResponse captureWalletMoMoResponse = CreateOrderMoMo.process(environment,
                orderId, requestId, Long.toString(cart.countTotalPayment()), "Thanh",
                returnURL, notifyURL, "", RequestType.CAPTURE_WALLET, Boolean.TRUE);

        if(captureWalletMoMoResponse == null){
            return "redirect:/erro";
        }
        return "redirect:" + captureWalletMoMoResponse.getPayUrl();
    }

    @GetMapping("/success")
    public String success() {
        return "order-success";
    }
    @GetMapping("/erro")
    public String viewErro(){
        return "404";
    }
}
package com.shop.webfe.security;


import com.shop.webcommon.entity.AuthenticationType;
import com.shop.webcommon.entity.Customer;
import com.shop.webfe.customer.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class DatabaseLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	
	@Autowired private CustomerService customerService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		CustomerUserDetails userDetails = (CustomerUserDetails) authentication.getPrincipal();
		Customer customer = userDetails.getCustomer();
		
		customerService.updateAuthenticationType(customer, AuthenticationType.DATABASE);
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
	
}

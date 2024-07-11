package com.jumstart.Controller;

import com.jumstart.Entities.Order;
import com.jumstart.Service.PaypalService;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class PaypalController {

    @Autowired
    private PaypalService paypalService;
   

    public static final String successUrl = "pay/success";
    public static final String cancelUrl = "pay/cancel";

    @PostMapping("pay")
    public String payment(@ModelAttribute("order") Order theOrder) throws PayPalRESTException {
        try {
            Payment thePayment = paypalService.createPayment(theOrder.getOrderPrice(), theOrder.getCurrency(),
                    theOrder.getMethod(), theOrder.getIntent(), theOrder.getDescription(),"http://localhost:8080/"+ cancelUrl,"http://localhost:8080/"+ successUrl);
            for (Links links: thePayment.getLinks()){
                if(links.getRel().equals("approval_url")){
                	
                    System.out.println(links.getHref());
                    return "redirect:"+links.getHref();
                }
            }
        }
        catch (PayPalRESTException payPalRESTException) {
            payPalRESTException.printStackTrace();
        }
        return "redirect:/";
    }
    
    @GetMapping(value = cancelUrl)
    public String cancelPay() {
        return "cancel";
    }

    @GetMapping(value = successUrl)
    public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId) {
        try {
            Payment payment = paypalService.executePayment(paymentId, payerId);
            System.out.println(payment.toJSON());
            if (payment.getState().equals("approved")) {
                return "success";
            }
        } catch (PayPalRESTException e) {
            System.out.println(e.getMessage());
        }
        return "redirect:/";
    }

}



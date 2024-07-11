package com.jumstart.Service;

import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

@Service
public class PaypalServiceImpl implements PaypalService{

    @Autowired
    private APIContext apiContext;

    @Override
    public Payment createPayment(Integer total, String currency, String method,
                                 String intent, String description, String cancelUrl, String successUrl) throws PayPalRESTException {
        Amount theAmount = new Amount();
        theAmount.setCurrency(currency);
        total = (int) new BigDecimal(total).setScale(2, RoundingMode.HALF_UP).doubleValue();
        theAmount.setTotal(String.format("%d", total));

        Transaction transaction = new Transaction();
        transaction.setDescription(description);
        transaction.setAmount(theAmount);

        List<Transaction> theTransactions = new ArrayList<>();
        theTransactions.add(transaction);

        Payer thePayer = new Payer();
        thePayer.setPaymentMethod(method.toString());

        Payment thePayment = new Payment();
        thePayment.setIntent(intent);
        thePayment.setTransactions(theTransactions);
        thePayment.setPayer(thePayer);

        RedirectUrls theRedirectUrls = new RedirectUrls();
        theRedirectUrls.setCancelUrl(cancelUrl);
        theRedirectUrls.setReturnUrl(successUrl);
        thePayment.setRedirectUrls(theRedirectUrls);

        return thePayment.create(apiContext);
    }

    @Override
    public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException {

        Payment thePayment = new Payment();
        thePayment.setId(paymentId);

        PaymentExecution thPaymentExecution = new PaymentExecution();
        thPaymentExecution.setPayerId(payerId);

        return thePayment.execute(apiContext, thPaymentExecution);
    }
}

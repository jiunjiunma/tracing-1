package com.jiunjiunma.tracingdemo;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@RestController
public class EShopController {

    @RequestMapping("/checkout")
    public String checkout() {
        return "You have successfully checked out your shopping cart";
    }
}

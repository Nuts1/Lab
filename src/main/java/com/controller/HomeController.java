package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @RequestMapping(value = {"/admin*", "/admin**", "/admin"})
    public String goWelcomePage() {
        return "index.html";
    }
}

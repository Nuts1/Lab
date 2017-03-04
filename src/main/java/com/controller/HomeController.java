package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;

/**
 * Created by Nuts on 2/21/2017
 * 10:36 AM.
 */
@Controller
public class HomeController {
    @RequestMapping(value = {"/admin"})
    public String goWelcomePage() {
        return "index.html";
    }
}

package com.controller;

import com.exception.BaseException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Nuts on 2/27/2017
 * 9:24 PM.
 */
@ControllerAdvice
public class ExceptionController {
    @ExceptionHandler(value = BaseException.class)
    @ResponseBody public ResponseEntity<String> exception(HttpServletRequest request, BaseException ex) {
        return new ResponseEntity<>(ex.getDescription(), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(value = NumberFormatException.class)
    @ResponseBody public ResponseEntity<String> integer(HttpServletRequest request, NumberFormatException ex) {
        return new ResponseEntity<>(ex.getMessage(), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(NoHandlerFoundException.class)
    public String notFound() {
        return "index.html";
    }
}

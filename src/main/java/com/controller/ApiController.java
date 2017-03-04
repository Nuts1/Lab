package com.controller;

import com.entity.Book;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Nuts on 3/1/2017
 * 7:01 PM.
 */
@RestController
@RequestMapping("/api")
public class ApiController {
    @Autowired
    private BookRepository bookRepository;

    @JsonFormat
    @GetMapping("/books/{pageNumber}")
    public Page<Book> getBook(@PathVariable String pageNumber) {
        PageRequest page = new PageRequest(Integer.parseInt(pageNumber), 10);
        return bookRepository.findAll(page);
    }

    @JsonFormat
    @GetMapping("/page")
    public Long getPageCount() {
        return bookRepository.count() / 10 + 1;
    }

}

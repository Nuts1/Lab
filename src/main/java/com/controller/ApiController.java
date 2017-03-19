package com.controller;

import com.dto.Message;
import com.entity.Book;
import com.entity.Category;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.repository.BookRepository;
import com.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class ApiController {
    private final BookRepository bookRepository;
    private final CategoryRepository categoryRepository;

    @Autowired
    public ApiController(BookRepository bookRepository,
                         CategoryRepository categoryRepository) {
        this.bookRepository = bookRepository;
        this.categoryRepository = categoryRepository;
    }

    @JsonFormat
    @GetMapping("/books/{pageNumber}/{pageSize}")
    public Page<Book> getBooks(@PathVariable String pageNumber, @PathVariable String pageSize) {
        PageRequest page = new PageRequest(Integer.parseInt(pageNumber), Integer.parseInt(pageSize));
        return bookRepository.findAll(page);
    }

    @JsonFormat
    @GetMapping("/book/{bookId}")
    public Book getBook(@PathVariable String bookId) {
        return bookRepository.findOne(Integer.parseInt(bookId));
    }

    @JsonFormat
    @GetMapping("/page")
    public Long getPageCount() {
        return bookRepository.count();
    }

    @JsonFormat
    @GetMapping("/page/{category}")
    public Long getPageCategoryCount(@PathVariable String category) {
        return bookRepository.countCategoryName(category);
    }

    @JsonFormat
    @PreAuthorize(value = "hasRole('ROLE_ADMIN')")
    @DeleteMapping("/book/{bookId}")
    public ResponseEntity<Message> deleteBook(@PathVariable String bookId) {
        bookRepository.delete(Integer.parseInt(bookId));
        return new ResponseEntity<>(new Message("Deleted"), HttpStatus.OK);
    }

    @JsonFormat
    @GetMapping("/books/{category}/{pageNumber}/{pageSize}")
    public Page<Book> getBookByCategory(@PathVariable String category, @PathVariable String pageNumber, @PathVariable String pageSize) {
        PageRequest page = new PageRequest(Integer.parseInt(pageNumber), Integer.parseInt(pageSize));
        return bookRepository.findByCategoryName(category, page);
    }

    @JsonFormat
    @GetMapping("/category")
    public Iterable<Category> getCategories() {
        return categoryRepository.findAll();
    }

//    @JsonFormat
//    @PreAuthorize(value = "hasRole('ROLE_USER')")
//    @GetMapping("/books/category/{pageNumber}/{pageSize}")
//    public Page<Book> getUserCatalog(@PathVariable String pageNumber, @PathVariable String pageSize, Principal principal) {
//        PageRequest page = new PageRequest(Integer.parseInt(pageNumber), Integer.parseInt(pageSize));
//        return bookRepository.findByCategoryName(principal.getName(), page);
//    }
}

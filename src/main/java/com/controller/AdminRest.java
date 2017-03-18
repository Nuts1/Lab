package com.controller;

import com.dto.BookDto;
import com.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

/**
 * Created by Nuts on 2/28/2017
 * 11:06 PM.
 */
@RestController
public class AdminRest {
    @Autowired
    BookRepository bookRepository;

    @PostMapping("/admin/addBook")
    public ResponseEntity<?> addBook(@Validated @RequestBody BookDto bookDto) {
        return ResponseEntity.ok("Added");
    }

    @PostMapping("/admin/loadFile")
    public ResponseEntity<String> uploadFile(@RequestParam("name") String name,
                                        @RequestParam("file") MultipartFile file) {
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();

                // Creating the directory to store file.sql
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(rootPath + File.separator + "tmpFiles");
                if (!dir.exists())
                    dir.mkdirs();

                // Create the file.sql on server
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + name);
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();

                return ResponseEntity.ok("Loaded");
            } catch (Exception e) {
                return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
            }
        } else {
            return new ResponseEntity<>("File empty", HttpStatus.BAD_REQUEST);
        }
    }
}

package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by nuts on 18/03/17.
 */
@Entity
public class Category {

    @Id
    @Column(name = "id_category")
    private int bookId;

    @Column(name = "name")
    private String name;

    public Category() {
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

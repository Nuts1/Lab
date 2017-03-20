package com.entity;

import javax.persistence.*;

/**
 * Created by nuts on 3/20/17.
 */
@Entity(name = "user_catalog")
public class Order {
    @Id
    @Column(name = "id_user_catalog")
    private int id;

    @ManyToOne
    @JoinColumn(name="id_user")
    private User user;

    @ManyToOne
    @JoinColumn(name="id_book")
    private Book book;

    public Order() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }
}

package com.entity;

import javax.persistence.*;

/**
 * Created by Nuts on 3/1/2017
 * 1:53 PM.
 */
@Entity(name = "author")
public class Author {
    @Id
    @Column(name = "id_author")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column
    private String name;


    public Author() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

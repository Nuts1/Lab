package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by nuts on 3/19/17.
 */
@Entity(name = "role")
public class Role {

    @Id
    @Column(name = "role_id")
    private int id;

    @Column(name = "role")
    private String name;

    public Role() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

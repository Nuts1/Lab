package com.exception;


public class BaseException extends Exception {
    private String description;

    public BaseException(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

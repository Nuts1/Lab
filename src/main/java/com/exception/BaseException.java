package com.exception;

/**
 * Created by Nuts on 2/27/2017
 * 9:32 PM.
 */
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

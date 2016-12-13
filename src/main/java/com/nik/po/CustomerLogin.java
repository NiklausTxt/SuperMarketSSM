package com.nik.po;

public class CustomerLogin extends CustomerLoginKey {
    private String password;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
}
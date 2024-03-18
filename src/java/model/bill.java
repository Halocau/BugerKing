/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */

public class bill {
    private String name,username, phone, email, address;
    private int quantity;
    private float sumprice;
    private Product product;

    public bill() {
    }

    public bill(String name, String username, String phone, String email, String address, int quantity, float sumprice, Product product) {
        this.name = name;
        this.username = username;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.quantity = quantity;
        this.sumprice = sumprice;
        this.product = product;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getSumprice() {
        return sumprice;
    }

    public void setSumprice(float sumprice) {
        this.sumprice = sumprice;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    
}

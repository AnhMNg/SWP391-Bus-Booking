/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author baolo
 */
public class Order {
    private long OrderId;
    private String date;
    private long customerId;
    private float totalPrice;

    public Order() {
    }

    public Order(long OrderId, String date, long customerId, String totalPrice) {
        this.OrderId = OrderId;
        this.date = date;
        this.customerId = customerId;
        this.totalPrice = Float.parseFloat(totalPrice);
    }
    
    public Order(String totalPrice) {
        this.totalPrice = Float.parseFloat(totalPrice);
    }

    public long getOrderId() {
        return OrderId;
    }

    public void setOrderId(long OrderId) {
        this.OrderId = OrderId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(long customerId) {
        this.customerId = customerId;
    }

    public String getTotalPrice() {
        return String.format("%.2f", totalPrice);
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }
    
}

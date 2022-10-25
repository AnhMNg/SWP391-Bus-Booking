/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class OrderDetail extends Order{
    private String productName;
    private float coupon;
    private int numberOfTickets;
    private float subTotal;

    public OrderDetail(String productName, String coupon, String numberOfTickets, String subTotal) {
        this.productName = productName;
        this.coupon = Float.parseFloat(coupon);
        this.subTotal = Float.parseFloat(subTotal);
        this.numberOfTickets = Integer.parseInt(numberOfTickets);
    }

    public OrderDetail(String productName, String coupon, String numberOfTickets, String subTotal, long OrderId, String date, long customerId, String totalPrice) {
        super(OrderId, date, customerId, totalPrice);
        this.productName = productName;
        this.coupon = Float.parseFloat(coupon);
        this.numberOfTickets = Integer.parseInt(numberOfTickets);
        this.subTotal = Float.parseFloat(subTotal);
    }
    
    public OrderDetail(String productName, String coupon, String numberOfTickets, String subTotal, String totalPrice) {
        super(totalPrice);
        this.productName = productName;
        this.coupon = Float.parseFloat(coupon);
        this.numberOfTickets = Integer.parseInt(numberOfTickets);
        this.subTotal = Float.parseFloat(subTotal);
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCoupon() {
        return String.format("%.2f", coupon);
    }

    public void setCoupon(float coupon) {
        this.coupon = coupon;
    }

    public String getNumberOfTickets() {
        return String.format("%d", numberOfTickets);
    }

    public void setNumberOfTickets(int numberOfTickets) {
        this.numberOfTickets = numberOfTickets;
    }

    public String getSubtotal() {
        return String.format("%.2f", subTotal);
    }

    @Override
    public String getTotalPrice() {
        return super.getTotalPrice();
    }

    
}

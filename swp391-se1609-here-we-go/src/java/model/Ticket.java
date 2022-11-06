/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author baolo
 */
public class Ticket {
    private long ticketId;
    private long orderId;
    private long routeDetailId;
    private int position;
    private String passengerName;
    private String passengerPhone;
    private String purchaseDate;

    public Ticket() {
    }

    public Ticket(long ticketId, long orderId, long routeDetailId, int position, String passengerName, String passengerPhone, String purchaseDate) {
        this.ticketId = ticketId;
        this.orderId = orderId;
        this.routeDetailId = routeDetailId;
        this.position = position;
        this.passengerName = passengerName;
        this.passengerPhone = passengerPhone;
        this.purchaseDate = purchaseDate;
    }

    public String getPassengerPhone() {
        return passengerPhone;
    }

    public void setPassengerPhone(String passengerPhone) {
        this.passengerPhone = passengerPhone;
    }

    

    public String getPassengerName() {
        return passengerName;
    }

    public void setPassengerName(String passengerName) {
        this.passengerName = passengerName;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

  

    public long getTicketId() {
        return ticketId;
    }

    public void setTicketId(long ticketId) {
        this.ticketId = ticketId;
    }

    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
    }

    public long getRouteDetailId() {
        return routeDetailId;
    }

    public void setRouteDetailId(long routeDetailId) {
        this.routeDetailId = routeDetailId;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }
    
}

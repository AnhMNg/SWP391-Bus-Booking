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

    public Ticket() {
    }

    public Ticket(long ticketId, long orderId, long routeDetailId, int position) {
        this.ticketId = ticketId;
        this.orderId = orderId;
        this.routeDetailId = routeDetailId;
        this.position = position;
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

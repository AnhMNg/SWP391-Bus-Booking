/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author baolo
 */
public class TicketDetail extends Ticket{
    private String purchaseDate;
    private int price;
    private String timeStart;
    private String timeArrival;
    private String companyName;
    private int capacity;
    private String kind;
    private String depart;
    private String destination;

    public TicketDetail() {
    }

    public TicketDetail(long routeDetailId, int position, String purchaseDate, int price, String timeStart, String timeArrival, String companyName, int capacity, String kind, String depart, String destination,long ticketId, long orderId) {
        super(ticketId, orderId, routeDetailId, position);
        this.purchaseDate = purchaseDate;
        this.price = price;
        this.timeStart = timeStart;
        this.timeArrival = timeArrival;
        this.companyName = companyName;
        this.capacity = capacity;
        this.kind = kind;
        this.depart = depart;
        this.destination = destination;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(String timeStart) {
        this.timeStart = timeStart;
    }

    public String getTimeArrival() {
        return timeArrival;
    }

    public void setTimeArrival(String timeArrival) {
        this.timeArrival = timeArrival;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getDepart() {
        return depart;
    }

    public void setDepart(String depart) {
        this.depart = depart;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }
    
}

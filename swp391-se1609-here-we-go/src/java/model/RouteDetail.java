/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author baolo
 */
public class RouteDetail extends Route{
    private long routeDetailId;
    private int busTypeId;
    private String startTime;
    private int price;
    private String arrivalTime;
    private String departDetail;
    private String destinationDetail;

    public RouteDetail(long routeDetailId, int busTypeId, String startTime, int price, String arrivalTime, String departDetail, String destinationDetail, long routeId, String companyName, String depart, String destination) {
        super(routeId, companyName, depart, destination);
        this.routeDetailId = routeDetailId;
        this.busTypeId = busTypeId;
        this.startTime = startTime;
        this.price = price;
        this.arrivalTime = arrivalTime;
        this.departDetail = departDetail;
        this.destinationDetail =  destinationDetail;
    }

    public long getRouteDetailId() {
        return routeDetailId;
    }

    public void setRouteDetailId(long routeDetailId) {
        this.routeDetailId = routeDetailId;
    }

    public int getBusTypeId() {
        return busTypeId;
    }

    public void setBusTypeId(int busTypeId) {
        this.busTypeId = busTypeId;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public String getDepartDetail() {
        return departDetail;
    }

    public void setDepartDetail(String departDetail) {
        this.departDetail = departDetail;
    }

    public String getDestinationDetail() {
        return destinationDetail;
    }

    public void setDestinationDetail(String destinationDetail) {
        this.destinationDetail = destinationDetail;
    }

    
    
    

    
}

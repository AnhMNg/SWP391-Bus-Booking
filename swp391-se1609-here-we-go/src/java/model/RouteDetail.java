/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author baolo
 */
public class RouteDetail {
    private long routeDetailId;
    private long routeId;
    private int busTypeId;
    private String startTime;
    private int price;
    private String arrivalTime;

    public RouteDetail() {
    }

    public RouteDetail(long routeDetailId, long routeId, int busTypeId, String startTime, int price, String arrivalTime) {
        this.routeDetailId = routeDetailId;
        this.routeId = routeId;
        this.busTypeId = busTypeId;
        this.startTime = startTime;
        this.price = price;
        this.arrivalTime = arrivalTime;
    }

    public long getRouteDetailId() {
        return routeDetailId;
    }

    public void setRouteDetailId(long routeDetailId) {
        this.routeDetailId = routeDetailId;
    }

    public long getRouteId() {
        return routeId;
    }

    public void setRouteId(long routeId) {
        this.routeId = routeId;
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
    
}

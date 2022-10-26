/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import utils.DBUtils;

/**
 *
 * @author baolo
 */
public class RouteDetail extends Route{
    private long routeDetailId;
    private int cappacity;
    private int remaningPosition;
    private String kindBus;
    private String startTime;
    private int price;
    private String arrivalTime;
    private String departDetail;
    private String destinationDetail;
    private int[] listPosition; 

    public RouteDetail(long routeDetailId, int cappacity, int remaningPosition, String kindBus, String startTime, int price, String arrivalTime, String departDetail, String destinationDetail, int[] listPosition, long routeId, String companyName, String depart, String destination) {
        super(routeId, companyName, depart, destination);
        this.routeDetailId = routeDetailId;
        this.cappacity = cappacity;
        this.remaningPosition = remaningPosition;
        this.kindBus = kindBus;
        this.startTime = startTime;
        this.price = price;
        this.arrivalTime = arrivalTime;
        this.departDetail = departDetail;
        this.destinationDetail = destinationDetail;
        this.listPosition = listPosition;
    }

    public long getRouteDetailId() {
        return routeDetailId;
    }

    public void setRouteDetailId(long routeDetailId) {
        this.routeDetailId = routeDetailId;
    }

    public int getCappacity() {
        return cappacity;
    }

    public void setCappacity(int cappacity) {
        this.cappacity = cappacity;
    }

    public int getRemaningPosition() {
        return remaningPosition;
    }

    public void setRemaingPosition(int remaingPosition) {
        this.remaningPosition = remaingPosition;
    }

    public String getKindBus() {
        return kindBus;
    }

    public void setKindBus(String kindBus) {
        this.kindBus = kindBus;
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

    public int[] getListPosition() {
        return listPosition;
    }

    public void setListPosition(int[] listPosition) {
        this.listPosition = listPosition;
    }
    
    public String getconverPrice(){
        return DBUtils.convertMoney(price);
    }

   
}

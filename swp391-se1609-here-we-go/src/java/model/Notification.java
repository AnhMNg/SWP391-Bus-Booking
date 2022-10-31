/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author BAOTRAM
 */
public class Notification {
    private long NotiId;
    private long userId;
    private String message;
    private String date;

    public Notification() {
    }

    public Notification(long NotiId, long userId, String message, String date) {
        this.NotiId = NotiId;
        this.userId = userId;
        this.message = message;
        this.date = date;
    }

    public long getNotiId() {
        return NotiId;
    }

    public void setNotiId(long NotiId) {
        this.NotiId = NotiId;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    @Override
    public String toString() {
        return "NotiId = " + NotiId + " userId = " + userId + " message = " + message + " date = " + date;
    }
    
    
}
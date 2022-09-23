/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author baolo
 */
public class Feedback {
    private long feedbackId;
    private long ticketId;
    private String desription;

    public Feedback() {
    }

    public Feedback(long feedbackId, long ticketId, String desription) {
        this.feedbackId = feedbackId;
        this.ticketId = ticketId;
        this.desription = desription;
    }

    public long getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(long feedbackId) {
        this.feedbackId = feedbackId;
    }

    public long getTicketId() {
        return ticketId;
    }

    public void setTicketId(long ticketId) {
        this.ticketId = ticketId;
    }

    public String getDesription() {
        return desription;
    }

    public void setDesription(String desription) {
        this.desription = desription;
    }
    
}

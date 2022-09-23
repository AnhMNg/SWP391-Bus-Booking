/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author baolo
 */
public class Payment {
    private long  paymentId;
    private long orderId;
    private String paymentAccount;
    private String paymentDate;
    private String creditcardNumber;
    private String creditCardEXPDate;
    private String cardHolderName;

    public Payment() {
    }

    public Payment(long paymentId, long orderId, String paymentAccount, String paymentDate, String creditcardNumber, String creditCardEXPDate, String cardHolderName) {
        this.paymentId = paymentId;
        this.orderId = orderId;
        this.paymentAccount = paymentAccount;
        this.paymentDate = paymentDate;
        this.creditcardNumber = creditcardNumber;
        this.creditCardEXPDate = creditCardEXPDate;
        this.cardHolderName = cardHolderName;
    }

    public long getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(long paymentId) {
        this.paymentId = paymentId;
    }

    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
    }

    public String getPaymentAccount() {
        return paymentAccount;
    }

    public void setPaymentAccount(String paymentAccount) {
        this.paymentAccount = paymentAccount;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getCreditcardNumber() {
        return creditcardNumber;
    }

    public void setCreditcardNumber(String creditcardNumber) {
        this.creditcardNumber = creditcardNumber;
    }

    public String getCreditCardEXPDate() {
        return creditCardEXPDate;
    }

    public void setCreditCardEXPDate(String creditCardEXPDate) {
        this.creditCardEXPDate = creditCardEXPDate;
    }

    public String getCardHolderName() {
        return cardHolderName;
    }

    public void setCardHolderName(String cardHolderName) {
        this.cardHolderName = cardHolderName;
    }
    
}

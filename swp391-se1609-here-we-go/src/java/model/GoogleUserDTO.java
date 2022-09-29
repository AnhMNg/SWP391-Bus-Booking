/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class GoogleUserDTO {

    private String id;
    private String email;
    private String name;
    private String picture;
    private boolean verified_email;

    public GoogleUserDTO(String id, String email, String name, String given_name, String fimaly_Name, String picture, boolean verified_email) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.picture = picture;
        this.verified_email = verified_email;
    }

    public String getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    

    public String getPicture() {
        return picture;
    }

    public boolean isVerified_email() {
        return verified_email;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setName(String name) {
        this.name = name;
    }

    

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public void setVerified_email(boolean verified_email) {
        this.verified_email = verified_email;
    }

    @Override
    public String toString() {
        return "GoogleUserDTO{" + "id=" + id + ", email=" + email + ", name=" + name + ", picture=" + picture + ", verified_email=" + verified_email + '}';
    }
    
}

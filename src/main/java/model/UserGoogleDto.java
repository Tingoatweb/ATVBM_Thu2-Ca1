package model;

import java.io.Serializable;

public class UserGoogleDto implements Serializable {

    private String id;

    private String email;

    private boolean verified_email;

    private String name;

    private String given_name;

    private String family_name;
    private String link;

    private String picture;

    public UserGoogleDto() {
    }

    public UserGoogleDto(String id, String email, boolean verified_email, String name, String given_name, String family_name, String link, String picture) {
        this.id = id;
        this.email = email;
        this.verified_email = verified_email;
        this.name = name;
        this.given_name = given_name;
        this.family_name = family_name;
        this.link = link;
        this.picture = picture;
    }

    public String getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public boolean isVerified_email() {
        return verified_email;
    }

    public String getName() {
        return name;
    }

    public String getGiven_name() {
        return given_name;
    }

    public String getFamily_name() {
        return family_name;
    }

    public String getLink() {
        return link;
    }

    public String getPicture() {
        return picture;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setVerified_email(boolean verified_email) {
        this.verified_email = verified_email;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setGiven_name(String given_name) {
        this.given_name = given_name;
    }

    public void setFamily_name(String family_name) {
        this.family_name = family_name;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    @Override
    public String toString() {
        return "UserGoogleDto{" +
                "id='" + id + '\'' +
                ", email='" + email + '\'' +
                ", verified_email=" + verified_email +
                ", name='" + name + '\'' +
                ", given_name='" + given_name + '\'' +
                ", family_name='" + family_name + '\'' +
                ", link='" + link + '\'' +
                ", picture='" + picture + '\'' +
                '}';
    }
}

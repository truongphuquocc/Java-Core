package org.example;

import java.util.Date;

// Lớp trừu tượng Immigrant chứa các thuộc tính chung và các phương thức trừu tượng
abstract class Immigrant {
    private String immigrantID;
    private String name;
    private Date birthDate;
    private String passport;
    private String nationality;
    private Date immigrantDate;
    private int stayLength;
    private double discountRate;

    public Immigrant(String immigrantID, String name, Date birthDate, String passport, String nationality, Date immigrantDate, int stayLength, double discountRate) {
        this.immigrantID = immigrantID;
        this.name = name;
        this.birthDate = birthDate;
        this.passport = passport;
        this.nationality = nationality;
        this.immigrantDate = immigrantDate;
        this.stayLength = stayLength;
        this.discountRate = discountRate;
    }

    public String getImmigrantID() {
        return immigrantID;
    }

    public String getName() {
        return name;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public String getPassport() {
        return passport;
    }

    public String getNationality() {
        return nationality;
    }

    public Date getImmigrantDate() {
        return immigrantDate;
    }

    public int getStayLength() {
        return stayLength;
    }

    public double getDiscountRate() {
        return discountRate;
    }

    public void setDiscountRate(double discountRate) {
        this.discountRate = discountRate;
    }

    // Phương thức trừu tượng để các lớp con cụ thể hoá
    public abstract void showDetails();
}




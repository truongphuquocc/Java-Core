package org.example;

import java.util.Date;

// Lớp Traveler kế thừa từ lớp Immigrant
class Traveler extends Immigrant {
    private String company;
    private String stayPlace;

    public Traveler(String immigrantID, String name, Date birthDate, String passport, String nationality, Date immigrantDate, int stayLength, double discountRate, String company, String stayPlace) {
        super(immigrantID, name, birthDate, passport, nationality, immigrantDate, stayLength, discountRate);
        this.company = company;
        this.stayPlace = stayPlace;
    }

    public String getCompany() {
        return company;
    }

    public String getStayPlace() {
        return stayPlace;
    }

    @Override
    public void showDetails() {
        System.out.println("Traveler Details:");
        System.out.println("Travel Company: " + company);
        System.out.println("Stay Place: " + stayPlace);
    }
}
package org.example;

import java.util.Date;

class OverseasStudent extends Immigrant {
    private String university;
    private String majors;

    public OverseasStudent(String immigrantID, String name, Date birthDate, String passport, String nationality, Date immigrantDate, int stayLength, double discountRate, String university, String majors) {
        super(immigrantID, name, birthDate, passport, nationality, immigrantDate, stayLength, discountRate);
        this.university = university;
        this.majors = majors;
    }

    public String getUniversity() {
        return university;
    }

    public String getMajors() {
        return majors;
    }

    @Override
    public void showDetails() {
        System.out.println("Overseas Student Details:");
        System.out.println("University: " + university);
        System.out.println("Majors: " + majors);
    }
}
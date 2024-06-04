class OverseaStudent extends Immigrant {
    private String university;
    private String majors;

    public OverseaStudent(String immigrantID, String name, Date birthDate, String passport, String nationality, Date immigrantDate, int stayLength, double discountRate, String university, String majors) {
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
    public String getInfo() {
        return "Oversea Student: " + getName() + ", University: " + getUniversity() + ", Majors: " + getMajors();
    }
}

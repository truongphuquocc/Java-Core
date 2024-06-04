class LaborExport extends Immigrant {
    private String company;
    private String laborType;

    public LaborExport(String immigrantID, String name, Date birthDate, String passport, String nationality, Date immigrantDate, int stayLength, double discountRate, String company, String laborType) {
        super(immigrantID, name, birthDate, passport, nationality, immigrantDate, stayLength, discountRate);
        this.company = company;
        this.laborType = laborType;
    }

    public String getCompany() {
        return company;
    }

    public String getLaborType() {
        return laborType;
    }

    @Override
    public String getInfo() {
        return "Labor Export: " + getName() + ", Company: " + getCompany() + ", Labor Type: " + getLaborType();
    }
}

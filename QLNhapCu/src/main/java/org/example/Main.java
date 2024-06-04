package org.example;

import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvValidationException;

import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Main {
    private static final String DB_URL = "jdbc:sqlserver://localhost:1433;databaseName=QLNhapcanh";
    private static final String USER = "sa";
    private static final String PASS = "123";

    public static void main(String[] args) {
        String csvFile = "D:\\JAVA\\java_core\\data.csv";
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");

        try (CSVReader reader = new CSVReader(new FileReader(csvFile))) {
            Connection connection = DriverManager.getConnection(DB_URL, USER, PASS);
            String[] line;
            while ((line = reader.readNext()) != null) {
                if (line[0].equals("Type")) continue; // Skip header

                String immigrantID = line[1];
                String name = line[2];
                Date birthDate = dateFormat.parse(line[3]);
                String passport = line[4];
                String nationality = line[5];
                Date immigrantDate = dateFormat.parse(line[6]);
                String stayLength = line[7];
                double discountRate = Double.parseDouble(line[14]);

                // Validation
                if (birthDate.after(new Date())) {
                    System.out.println("BirthDate must be before current date!!!");
                    continue;
                }

                if (!passport.matches("[a-zA-Z0-9]+")) {
                    System.out.println("Passport is invalid!!!");
                    continue;
                }

                if (isDuplicateID(connection, immigrantID)) {
                    System.out.println("Immigrant " + immigrantID + " has duplicate ID");
                    continue;
                }

                // Insert into database
                String sql = "INSERT INTO Immigrant (ImmigrantID, Name, BirthDate, Passport, Nationality, ImmigrantDate, StayLength, University, Majors, Company, LaborType, StayPlace, DiscountRate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
                    pstmt.setString(1, immigrantID);
                    pstmt.setString(2, name);
                    pstmt.setDate(3, new java.sql.Date(birthDate.getTime()));
                    pstmt.setString(4, passport);
                    pstmt.setString(5, nationality);
                    pstmt.setDate(6, new java.sql.Date(immigrantDate.getTime()));
                    pstmt.setString(7, stayLength);

                    if (line[0].equals("1")) { // OverseaStudent
                        pstmt.setString(8, line[8]);
                        pstmt.setString(9, line[9]);
                        pstmt.setString(10, null);
                        pstmt.setString(11, null);
                        pstmt.setString(12, null);
                    } else if (line[0].equals("2")) { // LaborExport
                        pstmt.setString(8, null);
                        pstmt.setString(9, null);
                        pstmt.setString(10, line[10]);
                        pstmt.setString(11, line[11]);
                        pstmt.setString(12, null);
                    } else if (line[0].equals("3")) { // Traveler
                        pstmt.setString(8, null);
                        pstmt.setString(9, null);
                        pstmt.setString(10, line[10]);
                        pstmt.setString(11, null);
                        pstmt.setString(12, line[12]);
                    }

                    pstmt.setDouble(13, discountRate);

                    pstmt.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            connection.close();
        } catch (IOException | CsvValidationException | ParseException e) {
            System.out.println("Program have an unexpected error occurred !!!");
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static boolean isDuplicateID(Connection connection, String immigrantID) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Immigrant WHERE ImmigrantID = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, immigrantID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
}

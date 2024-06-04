import java.text.SimpleDateFormat;

public class Main {
    public static void main(String[] args) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            OverseaStudent student = new OverseaStudent("1", "John Doe", sdf.parse("2000-01-01"), "A12345678", "USA", sdf.parse("2024-06-01"), 365, 0.1, "MIT", "Computer Science");
            LaborExport worker = new LaborExport("2", "Jane Smith", sdf.parse("1985-05-10"), "B87654321", "UK", sdf.parse("2024-06-01"), 730, 0.05, "ABC Corp", "Specialized");
            Traveler traveler = new Traveler("3", "Alice Johnson", sdf.parse("1990-12-25"), "C11223344", "Canada", sdf.parse("2024-06-01"), 30, 0.15, "XYZ Travel", "Hotel California");

            System.out.println(student.getInfo());
            System.out.println(worker.getInfo());
            System.out.println(traveler.getInfo());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
public class DateTime {
    public static void main(String[] args) {
        LocalDate myDate = LocalDate.now();
        LocalTime myTime = LocalTime.now();
        LocalDateTime myDateTime = LocalDateTime.now();

        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyy HH:mm:ss");
        String formattedDate = myDateTime.format(myFormatObj);

        System.out.println(myDate);
        System.out.println(myTime);
        System.out.println(myDateTime);
        System.out.println(formattedDate);
    }
}

import java.util.HashSet;
public class HashSetDemo {
    public static void main(String[] args) {

        // Every item is unique

        HashSet<String> cars = new HashSet<String>();

        cars.add("Volvo");
        cars.add("BMW");
        cars.add("Ford");
        cars.add("Mazda");

        System.out.println(cars);

        System.out.println(cars.contains("Mazda"));

        for (String i : cars) {
            System.out.println(i);
        }
    }
}

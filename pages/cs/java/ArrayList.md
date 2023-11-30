## ArrayList
An ArrayList is a dynamic array-like data structure that provides resizable arrays. It's part of the 'java.util' package and implements the List interface. Unlike regulary arrays, ArrayLists can dynamically grow or shrink in size during runtime.
```java
import java.util.ArrayList;
import java.util.Collections;

public class ArrayListDemo {
    public static void main(String[] args) {

        ArrayList<String> cars = new ArrayList<String>();

        cars.add("Volvo");
        cars.add("BMW");
        cars.add("Ford");
        cars.add("Mazda");

        System.out.println(cars);

        System.out.println(cars.get(0));

        cars.set(0, "Opel");

        System.out.println(cars.get(0));

        cars.remove(0);

        System.out.println(cars.get(0));

        System.out.println(cars.size());

        cars.clear();

        System.out.println(cars.size());

        cars.add("Volvo_1");
        cars.add("BMW_2");
        cars.add("Ford_3");
        cars.add("Mazda_4");

        for (int i = 0; i < cars.size(); i++) {
            System.out.println(cars.get(i));
        }

        Collections.sort(cars);

        for (String i : cars) {
            System.out.println(i);
        }
    }
}
```

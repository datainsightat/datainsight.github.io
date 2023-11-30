import java.util.LinkedList;
public class LinkedListDemo {

    // Linked lists store items in containers. The array has references to these containers.
    public static void main(String[] args)  {
        LinkedList<String> cars = new LinkedList<String>();

        cars.add("Volvo");
        cars.add("BMW");
        cars.add("Ford");
        cars.add("Mazda");

        System.out.println(cars);
    }
}

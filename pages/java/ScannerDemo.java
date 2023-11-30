import java.util.Scanner;
public class ScannerDemo {
    public static void main(String[] args) {
        Scanner myObj = new Scanner(System.in);
        System.out.println("Enter name, age and salary");

        String name = myObj.nextLine();
        int age = myObj.nextInt();
        double salary = myObj.nextDouble();

        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
        System.out.println("Salray: " + salary);

        //nextBoolen()
        //nextByte()
        //nextDouble()
        //nextFloat()
        //nextInt()
        //nexLine()
        //nextLong()
        //nextSHort()

    }
}

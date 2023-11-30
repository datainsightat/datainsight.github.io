abstract class AbstractClass {
    public String fname = "John";
    public int age = 24;
    public abstract void study(); // abstract method
}

class Activity extends AbstractClass { // inherited from AbstractClasse
    public int graduationYear = 2018;
    public void study() {
     System.out.println("Studying all day long");
    }
}

class Person {

    private String name;

    // Getter
    public String getName() {
        return name;
    }

    // Setter
    public void setName(String newName) {
        this.name = newName;
    }
}

public class Student {

    public static void main(String[] args) {
        Activity myObj = new Activity();

        System.out.println("Name: " + myObj.fname);
        System.out.println("Age: " + myObj.age);
        System.out.println("Graduation year: " + myObj.graduationYear);

        myObj.study(); // Call abstract method

        // Encapsulatoin

        Person myObj_2 = new Person();
        myObj_2.setName("Bernhard");
        System.out.println(myObj_2.getName());
    }

}


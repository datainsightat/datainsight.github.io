// Maven: https://www.youtube.com/watch?v=Xatr8AZLOsE
// W3 Schools: https://www.w3schools.com/java/

public class Main {

    final int x = 15;
    int y;

    public Main(int z) {
        // Create a class constructor for the Main class
        y = z;
    }

    public static void main(String[] args) {
        /* System.out.println("Hello World");
        System.out.println("I am learning Java.");
        System.out.println("It is awesome!"); */

        // types();
        // operators();
        // math();

        // conditions();
        // loops();
        // arrays();

        // System.out.println(methods("Franz", 57));

        // int myNum_1 = plusMethod(4,5);
        // double myNum_2 = plusMethod(4,5);
        // System.out.println(myNum_1 + " " + myNum_2);

        // System.out.println(sum(5,10));

        Main myObj_1 = new Main(7);
        // myObj_1.x = 7; Error, variable set to final
        myObj_1.y += 30;
        System.out.println(myObj_1.y);

        SomeClass myObj_2 = new SomeClass();
        System.out.println(myObj_2.x);

        myStaticMethod();
        myObj_1.myPublicMethod();
    }

    static void types() {
        /* Examples of Java variable types */

        String name = "John";
        System.out.println("Hello " + name);

        int myNum = 15;
        System.out.println(myNum);

        int myNum2;
        myNum2 = 16;
        System.out.println(myNum2);

        final int myNum3 = 17;
        // myNum3 = 18;
        System.out.println(myNum3);

        System.out.println(myNum + myNum2);

        int x = 5, y = 6, z = 50;
        System.out.println(x + y + z);

        // Integer Data Types

        byte myNumByte = 100; // -128 to 127
        System.out.println(myNumByte);

        short myNumShort = 5000; // -32768 zo 32767
        System.out.println(myNumShort);

        int myNumInt = 100000; // -2147483648 to 2147483647
        System.out.println(myNumInt);

        long myNumLong = 1500000000000L; // 9223372036854775808 to 9223372036854775807
        System.out.println(myNumLong);

        // Floating Point Types

        float myNumFloat = 5.75f;
        System.out.println(myNumFloat); // 3.4e−038 to 3.4e+038, Precision 6

        double myNumDouble = 19.99d; // 1.7e−308 to 1.7e+308, Precision 15
        System.out.println(myNumDouble);

        int myIntDouble = (int) myNumDouble;
        System.out.println(myIntDouble);

        // Scientific Numbers

        float f1 = 35e3f;
        double d1 = 12E4d;
        System.out.println(f1);
        System.out.println(d1);

        // Booleans

        boolean isJavaFun = true;
        boolean isFishTasty = false;
        System.out.println(isJavaFun);
        System.out.println(isFishTasty);

        // Characters

        char myGrade = 'B';
        System.out.println(myGrade);

        char aChar = 65, bChar = 66, cChar = 67;
        System.out.println(aChar);

        // Strings

        String greeting = "Hello World!";
        System.out.println(greeting);
    }

    static void operators() {
        // Artihmetic Operators

        int x = 10 + 5;
        x = 10 - 7;
        x = 10 * 5;
        x = 10 / 2;
        x = 10 % 3;

        ++x; // increment x by 1
        --x; // decrement x by 1

        x = 5;
        x += 5; // increment x by 5
        x -= 3;
        x *= 2;
        x /= 3;
        x %= 5;
        x &= 2; // bitwise AND
        x |= 2; // bitwise OR
        x ^= 2;
        x >>= 3; // right shift bits to left by 3
        x <<= 3; // left shift bits to right by 3

        // Comparison

        x = 5;
        int y = 3;

        System.out.println(x == y);
        System.out.println(x != y);
        System.out.println(x > y);
        System.out.println(x < y);
        System.out.println(x >= y);
        System.out.println(x <= y);

        System.out.println(x<5 && x < 10);
        System.out.println(x<5 || x < 10);
        System.out.println(!(x<5 && x < 10)); // ! not modifier

        // Java Strings

        String greeting = "Hello World!";

        System.out.println("The length of the txt string is: " + greeting.length());
        System.out.println(greeting.toUpperCase());
        System.out.println(greeting.toLowerCase());
        System.out.println(greeting.indexOf("World"));
        System.out.println(greeting.indexOf("World"));

        String firstName = "John";
        String lastName = "Doe";

        System.out.println(firstName + " " + lastName);
        System.out.println(firstName.concat(lastName));

        // Escape Characters

        String txt = "We are the so-callsed \"Vikings\" from the north.";

        System.out.println(txt);

        // Escape Sequences

        txt = "\n new line \r carriage return \t tab \b backspace \f form feed.";

        System.out.println(txt);

    }

    static void math() {

        System.out.println(Math.max(5,10));
        System.out.println(Math.min(5,10));
        System.out.println(Math.sqrt(64));
        System.out.println(Math.abs(-5));
        System.out.println(Math.random());

    }

    static void conditions() {

        // if..elsse

        int x = 20;
        int y = 20;

        if (x > y) {
            System.out.println( x + " > " + y);
        } else if (x < y){
            System.out.println( x + " < " + y);
        } else {
            System.out.println( x + " = " + y);
        }

        boolean z = (x > y) ? true : false;

        System.out.println(z);

        // Switch

        int day = 4;

        switch(day) {
            case 1:
                System.out.println("Monday");
                break;
            case 2:
                System.out.println("Tuesday");
                break;
            case 3:
                System.out.println("Wednesday");
                break;
            case 4:
                System.out.println("Thursday");
                break;
            case 5:
                System.out.println("Friday");
                break;
            case 6:
                System.out.println("Saturday");
                break;
            case 7:
                System.out.println("Sunday");
                break;
            default:
                System.out.println("No valid day");
        }
    }

    static void loops() {

        // While Loop

        int i = 0;

        while (i < 5) {
            System.out.println(i);
            i++;
        }

        i = 0;

        do {
            System.out.println(i);
            i++;
        }
        while (i < 5);

        // For Loop

        for (int j = 0; j < 5; j++) {
            System.out.println(j);
        }

        // For-Each Loop

        String[] cars = {"Volvo","BMW","Ford","Mazda"};

        for (String k : cars) {
            System.out.println(k);
        }

        // Break and Continnue

        for (int l = 0; l < 10; l++) {
            if (l == 4) {
                break;
            }
            System.out.println(l);
        }

        for (int m = 0; m < 10; m++) {
            if (m == 4) {
                continue;
            }
            System.out.println(m);
        }
    }

    static void arrays() {

        String[] cars = {"Volvo","BMW","Ford","Mazda"};

        System.out.println(cars[0]);

        cars[0] = "Opel";

        System.out.println(cars[0] + " " + cars.length);

        // Loop through array

        for (int i = 0; i < cars.length; i++) {
            System.out.println(cars[i]);
        }

        for (String j : cars) {
            System.out.println(j);
        }

        // Multidimensional array

        int[][] myNumbers = {{1,2,3,4},{5,6,7}};
        int x = myNumbers[1][2];

        System.out.println(x);

        for (int j=0;j<myNumbers.length;j++) {
            for (int k=0;k<myNumbers[j].length;k++) {
                System.out.println(myNumbers[j][k]);
            }
        }
    }

    static String methods(String fname, int age) {
        String name = fname + " is " + age;

        return name ;
    }

    static int plusMethod(int x, int y) {
        return x + y;
    }

    static double plusMethod(double x, double y) {
        return x + y;
    }

    static int sum(int start, int end) {
        if (end > start) {
            return end + sum(start, end - 1);
        } else {
            return end;
        }
    }

    static void myStaticMethod(){
        System.out.println("Static methods can be called without creating objects");
    }

    public void myPublicMethod(){
        System.out.println("Public methods must be called by creating objects");
    }

}

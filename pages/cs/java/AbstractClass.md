## Abstract Class
An abstact class is a class that cannot be instantiated on its own and is typically used as a base class for other classes. It may contain abstract methods, which are methods without a body that must be implemented by any concrete (non-abstract) subclass. Abstract classes can also have regular methods with a defined implementation. They provice a way to define a common interface for a group of related classes while allowing for variations in their implementation.

```java
abstract class Sound {
    public abstract void animalSound();
    public void sleep() {
        System.out.println("Zzz");
    }
}

class Pig extends Sound {
    public void animalSound() {
        System.out.println("The pig says: wee wee");
    }
}

public class Animal {
    public static void main(String[] args) {
        Pig myPig = new Pig();
        myPig.animalSound();
        myPig.sleep();
    }
}
```

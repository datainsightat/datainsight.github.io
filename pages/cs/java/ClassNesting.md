## Class Nesting
Class nesting refers to the practice of defining one class within another. There are two main types of class nesting in Java: static nesting (or static inner classes) and non-static nesting (or inner classes).
```java
class OuterClass {
    int x = 10;

    static class StaticInnerClass {
        int y = x + 10;
    }

    class InnerClass {
        int y = x + 5;
    }
}

public class ClassNesting {
    public static void main(String[] args) {
        OuterClass myOuter = new OuterClass();
        OuterClass.InnerClass myInner = myOuter.new InnerClass();
        System.out.println(myInner.y + myOuter.x);
    }
}
```

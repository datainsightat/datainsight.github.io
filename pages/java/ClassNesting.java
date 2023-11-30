class OuterClass {
    int x = 10;

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

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

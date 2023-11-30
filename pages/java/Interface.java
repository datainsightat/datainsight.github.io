interface AnimalInterface_1 {
    public void animalSoundInterface();
}

interface AnimalInterface_2 {
    public void sleepInterface();
}

class PigInterface implements AnimalInterface_1, AnimalInterface_2 {
    public void animalSoundInterface() {
        System.out.println("The pig says: wee wee");
    }

    public void sleepInterface() {
        System.out.println("Zzz");
    }
}

public class Interface {
    public static void main(String[] args) {
        PigInterface myPig = new PigInterface();
        myPig.animalSoundInterface();
        myPig.sleepInterface();
    }
}

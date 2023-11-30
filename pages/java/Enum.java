public class Enum {
    enum Level {
        LOW,
        MEDIUM,
        HIGH
    }

    public static void main(String[] args) {
        Level myLevel = Level.MEDIUM;
        System.out.println(myLevel);

        switch(myLevel) {
            case LOW:
                System.out.println("Low Level");
                break;
            case MEDIUM:
                System.out.println("Medium Level");
                break;
            case HIGH:
                System.out.println("High Level");
                break;
        }

        for (Level myVar: Level.values()) {
            System.out.println(myVar);
        }
    }
}

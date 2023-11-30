## File Handling
```java
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.FileWriter;
import java.util.Scanner;

public class FileDemo {

    public static void main(String[] args) {

        String fileName = "filename.txt";
        File myObj = new File(fileName);

        /*
        canRead()	        Boolean	Tests whether the file is readable or not
        canWrite()	        Boolean	Tests whether the file is writable or not
        createNewFile()	    Boolean	Creates an empty file
        delete()	        Boolean	Deletes a file
        exists()	        Boolean	Tests whether the file exists
        getName()	        String	Returns the name of the file
        getAbsolutePath()	String	Returns the absolute pathname of the file
        length()	Long	Returns the size of the file in bytes
        list()	String[]	Returns an array of the files in the directory
        mkdir()	            Boolean	Creates a directory
        */

        try {
            if (myObj.createNewFile()) {
                System.out.println("File created: " + myObj.getName());
            } else {
                System.out.println("File already exists.");
            }

            FileWriter myWriter = new FileWriter(fileName);
            myWriter.write("Files in Java might be tricky, but it is fun enough!");
            myWriter.close();
            System.out.println("Successfully wrote to the file.");
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }

        try {
            Scanner myReader = new Scanner(myObj);
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                System.out.println(data);
            }
            myReader.close();
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }

        if (myObj.exists()) {
            System.out.println("File name: " + myObj.getName());
            System.out.println("Absolute path: " + myObj.getAbsolutePath());
            System.out.println("Writeable: " + myObj.canWrite());
            System.out.println("Readable: " + myObj.canRead());
            System.out.println("File size in byttes: " + myObj.length());
        } else {
            System.out.println("The file does not exist.");
        }

        if (myObj.delete()) {
            System.out.println("Deleted the file: " + myObj.getName());
        } else {
            System.out.println("Failed to delete the file.");
        }
    }
}
```

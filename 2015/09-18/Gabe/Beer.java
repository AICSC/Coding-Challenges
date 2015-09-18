/**
* This program recites the very annoying song
* "99 bottles of beer on the wall"
*
* @author Gabe Fortier
* Source File: Beer.java
*/
public class Beer {
 public static void main(String[] args) {
    for(int b = 99; b > 0; b--){
       if(b != 1){
          System.out.printf("%d bottles of beer on the wall, %d bottles of beer!\n Ya take one down, pass it around, %d bottles of beer on the wall...\n\n", b, b, b-1);
      }
       else{
          System.out.printf("%d bottle of beer on the wall, %d bottle of beer!\n Ya take one down, pass it around, no more bottles of beer on the wall...\n\n", b, b);
      }
     }
     System.out.println("No more bottles of beer on the wall, no more bottles of beer.");
  }
 }

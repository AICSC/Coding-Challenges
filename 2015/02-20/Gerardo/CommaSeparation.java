/**The user input a number from the prompt and a comma will help separate the numbers
 */
//@author: Gerardo Martinez

import java.util.Scanner;

public class CommaSeparation {

	public static void main(String[] args) {

		int number;

		Scanner keyboard = new Scanner(System.in);
		System.out.print("Please enter an integer between 1000 and 999999: ");
		number = keyboard.nextInt();

		if (number >= 1000 && number <= 999999) {
			System.out.printf("%,d", number);
		} else {
			System.out.print("Error");
		}

		keyboard.close();
	}

}

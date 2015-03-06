/**
 * This program prompts the user to enter an integer between 1000 and 999999
 * without entering commas or spaces. The output adds the comma in the thousands place.
 * 
 * @author Chad Hidalgo
 * Created: 24 FEB 2015	
 *
 */

import java.util.Scanner;

public class Challenge1 {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		int userInput = 0;
		int hundreds = 0;
		int thousands = 0;
		while (userInput < 1000 || userInput > 999999) {
			System.out
					.print("Enter an integer between 1000 and 999999 without "
							+ "spaces or commas: ");
			userInput = input.nextInt();
		}
		hundreds = userInput % 1000;
		thousands = userInput / 1000;
		if (hundreds == 0) {
			System.out.printf(
					"The number you entered, %d, is written as %d,000",
					userInput, thousands);
		} else {
			System.out.printf(
					"The number you entered, %d, is written as %d,%d",
					userInput, thousands, hundreds);
		}
		input.close();
	}

}

//Author:Gerardo Martinez

import java.util.Scanner;

public class TemperatureConverter {

	public static void main(String[] args) {
		String scale = "";
		double temp = 0;
		double finalTemp = 0;

		// the prompt for the user.

		System.out.print("Enter the temperature and scale (eg. 80.0 F): ");
		Scanner keyboard = new Scanner(System.in);

		temp = keyboard.nextDouble();
		scale = keyboard.next();

		// Stings and character don't go well together.
		if (scale.compareTo("C") == 0 || scale.compareTo("c") == 0) {
			// use compareTo for the string to identify C and F of the string.
			finalTemp = temp * 9 / 5 + 32;
			System.out.printf("%.1f\u00b0C == %.1f\u00b0F", temp, finalTemp);
		} else if (scale.compareTo("F") == 0 || scale.compareTo("f") == 0) {
			finalTemp = (temp - 32) * 5 / 9;
			System.out.printf("%.1f\u00b0F == %.1f\u00b0C", temp, finalTemp);
		}
		keyboard.close();
	}

}

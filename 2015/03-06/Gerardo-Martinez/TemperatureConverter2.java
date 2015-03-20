//Author:Gerardo Martinez

import java.util.Scanner;

public class TemperatureConverter2 {

	public static void main(String[] args) {

		char scale = 'F';
		double temp = 0;
		double finalTemp = 0;
		// the prompt
		Scanner keyboard = new Scanner(System.in);
		System.out.println("Enter the temperature and scale (eg. 80.0 F): ");

		temp = keyboard.nextDouble();
		scale = keyboard.next().charAt(0);// this is considered a combination of
											// two classes.

		if (scale == 'C' || scale == 'c') {// this is to make sure if someone
											// input lower case.
			finalTemp = temp * 9 / 5 + 32;
			System.out.printf("%.1f\u00b0C == %.1f\u00b0F", temp, finalTemp);
		} else if (scale == 'F' || scale == 'f') {
			finalTemp = (temp - 32) * 5 / 9;
			System.out.printf("%.1f\u00b0F == %.1f\u00b0C ", temp, finalTemp);
		}
		keyboard.close();
	}
}

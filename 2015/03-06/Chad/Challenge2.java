/**
 * This program uses a dialog box to input temperature in Fahrenheit or Celsius
 * and uses formatted output to show the conversion to Celsius or Fahrenheit
 *  
 * @author Chad Hidalgo
 * Created: Mar 6, 2015
 * Source File: Challenge2.java
 */

import java.util.Scanner;

import javax.swing.JOptionPane;

public class Challenge2 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		final String IN_PROMPT = "Enter the temperature and scale (eg. 80.0F): ";
		final double F = 9.0 / 5.0;
		final double C = 5.0 / 9.0;
		final char SYMBOL = 176;
		double inputTemperature = 0;
		String userInput;
		char inputScale;
		char outputScale;
		double convertedTemperature = 0;

		do {
			userInput = JOptionPane.showInputDialog(IN_PROMPT);
			inputScale = userInput.charAt(userInput.length() - 1);
		} while (inputScale != 'F' && inputScale != 'C');

		inputTemperature = Double.parseDouble(userInput.substring(0,
				userInput.length() - 1));

		if (inputScale == 'F') {
			convertedTemperature = (inputTemperature - 32.0) * C;
			outputScale = 'C';
		} else {
			convertedTemperature = inputTemperature * F + 32.0;
			outputScale = 'F';
		}

		System.out.printf("%.1f%c%c == %.1f%c%c\n", inputTemperature, SYMBOL,
				inputScale, convertedTemperature, SYMBOL, outputScale);

		input.close();
	}
}

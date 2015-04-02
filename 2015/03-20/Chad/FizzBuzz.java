/**
 * This is a Java swing GUI file that determines if the numbers from 1 to 150
 * are divisible by either 3 or 5, or by both. The output is Fizz is by 3,
 * Buzz if by 5, and FizzBuzz if by both.
 * 
 * @author: Chad Hidalgo (portions from Java for Everyone by Cay Horstmann)
 * Created: Mar 31, 2015
 * Source File: FizzBuzz.java
 * Artificial Intelligence Computer Science Club
 * Challenge #3 - issued Mar 20, 2015
 */
 
import java.awt.Color; //allows for the color of the output to be changed
import java.awt.Font; //allows for the font to be changed and sized
import java.awt.Graphics; //provides for the drawString method
import javax.swing.JFrame; //creates an output window (frame)
import javax.swing.JComponent;

public class FizzBuzz {
	public static void FizzBuzzMethod(){
		
	}
	public static void draw(Graphics g) {
		String strOut="";
		int x =150;
		int y= 12;
		int col2=0;
		int col3=0;
		for(int i=1;i<=150;i++) {
			if(i>50 && i<=100){ // second column of output 51 - 100
				x=300;
				y=++col2*14; // using prefix increment operator
			}else if(i>100){ // third column of output 101 - 150
				x=450;
				y=++col3*14; // using prefix increment operator
			}
			if (i % 3 == 0 && i % 5 == 0) { // order of conditions is important for cascading
			
				strOut = "FIZZ BUZZ";
				g.setColor(Color.BLUE);
				g.setFont(new Font("TimesRoman", Font.PLAIN, 16));
				g.drawString(strOut, x-30, y);
				
			} else if (i % 3 == 0) {
				
				strOut = "FIZZ";
				g.setColor(Color.BLUE);
				g.setFont(new Font("TimesRoman", Font.PLAIN, 16));
				g.drawString(strOut, x-5, y);
				
			} else if (i % 5 == 0) {
				
				strOut = "BUZZ";
				g.setColor(Color.BLUE);
				g.setFont(new Font("TimesRoman", Font.PLAIN, 16));
				g.drawString(strOut, x-5, y);
				
			} else {
				strOut = "" + i;
				g.setColor(Color.BLUE);
				g.setFont(new Font("TimesRoman", Font.PLAIN, 16));
				g.drawString(strOut, x, y);
			}
			y+=14;
		}
	}

	public static void main(String[] args) { //the main is directly from the Java text with modifications

		JFrame frame = new JFrame();
		final int FRAME_WIDTH = 700;
		final int FRAME_HEIGHT = 800;

		frame.setSize(FRAME_WIDTH, FRAME_HEIGHT);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		JComponent component = new JComponent() {
			public void paintComponent(Graphics graph) {
				draw(graph);
			}
		};
		frame.add(component);
		frame.setVisible(true);
	}
}

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import javax.swing.JFrame;
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
			if(i>50 && i<=100){
				x=300;
				y=++col2*14;
			}else if(i>100){
				x=450;
				y=++col3*14;
			}
			if (i % 3 == 0 && i % 5 == 0) {
			
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

	public static void main(String[] args) {

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

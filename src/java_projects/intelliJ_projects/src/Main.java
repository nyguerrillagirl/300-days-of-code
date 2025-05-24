
import java.awt.*;
import java.awt.event.*;

public class Main {
    public static void main(String[] args) {
        // Create a new Frame
        Frame frame = new Frame("AWT Example");

        // Create a Button
        Button button = new Button("Click Me");

        // Set the button position
        button.setBounds(50, 50, 100, 30);

        // Add an ActionListener to the button
        button.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                System.out.println("Button Clicked!");
            }
        });

        // Add button to the frame
        frame.add(button);

        // Set frame properties
        frame.setSize(800, 640);
        frame.setLayout(null);
        frame.setVisible(true);

        // Handle window closing event
        frame.addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                frame.dispose();
            }
        });
    }
}
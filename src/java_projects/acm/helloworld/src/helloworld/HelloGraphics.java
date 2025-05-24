package helloworld;

import acm.graphics.*;
import acm.program.*;

public class HelloGraphics extends GraphicsProgram {

	public void run() {
		GLabel label = new GLabel("hello, world");
		label.setFont("SansSerif-100");
		double x = (getWidth() - label.getWidth()) / 2;
		double y = (getHeight() + label.getAscent()) / 2;
		add(label, x, y);
	}

/* Standard Java entry point */
/* This method can be eliminated in most Java environments */
	public static void main(String[] args) {
		new HelloGraphics().start(args);
	}
}
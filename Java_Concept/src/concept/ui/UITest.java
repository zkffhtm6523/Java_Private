package concept.ui;

import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JTextArea;

public class UITest {
	public static void main(String[] args) {
		new ui1();
	}
}
class ui1 extends JFrame{
	public ui1() {
		super("Navi");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(400, 300, 400, 150);
		
		
		JMenuBar jmb = new JMenuBar();
		JMenu jm1 = new JMenu("File");
		JMenu jm2 = new JMenu("Edit");
		JMenu jm3 = new JMenu("Window");
		JMenu jm4 = new JMenu("Help");
		JMenuItem jmi1 = new JMenuItem("New File");
		
		
		jmb.add(jm1);
		jmb.add(jm2);
		jmb.add(jm3);
		jmb.add(jm4);
		
		jm1.add(jmi1);
		this.setJMenuBar(jmb);
		
		getContentPane().setLayout(new GridLayout(3, 2, 5, 5));
		
//		JPanel jp = new JPanel();
		
		JLabel jl1 = new JLabel("ID");
		JLabel jl2 = new JLabel("Password");
		
		JTextArea jt1 = new JTextArea();
		JTextArea jt2 = new JTextArea();
		
		JButton jb1 = new JButton("OK");
		JButton jb2 = new JButton("Cancle");

		getContentPane().add(jl1);
		getContentPane().add(jt1);
		getContentPane().add(jl2);
		getContentPane().add(jt2);
		getContentPane().add(jb1);
		getContentPane().add(jb2);
		
		setVisible(true);
		
	}
}

package mission.zoo;
// Thread 예제
public class ZooTycoon {
	public static void main(String[] args) {
		Cat c = new Cat(); // 순서없이 서로 울게 하기.
		Pig p = new Pig();
		Duck d = new Duck();

		Thread c_t = new Thread(c);
		Thread p_t = new Thread(p);
		Thread d_t = new Thread(d);

		c_t.start();
		p_t.start();

		try {
			c_t.join();
			p_t.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		d_t.start();
	}
}

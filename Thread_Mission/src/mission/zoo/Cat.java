package mission.zoo;

public class Cat implements Runnable {

	void soundCat() {
		System.out.println("야옹~");
	}
	
	@Override
	public void run() {
		for (int i = 0; i < 10; i++) {
			soundCat();
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
	}

}

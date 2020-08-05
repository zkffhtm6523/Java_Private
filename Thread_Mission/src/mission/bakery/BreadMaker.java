package mission.bakery;

public class BreadMaker extends Thread{
	private BreadPlate bread = null;
	
	public BreadMaker() {}
	
	public BreadMaker(BreadPlate bread) {
		setBread(bread);
	}
	
	public BreadPlate getBread() {
		return bread;
	}
	private void setBread(BreadPlate bread) {
		this.bread = bread;
	}

	@Override
	public void run() {
		for (int i = 0; i < 20; i++) {
			bread.makeBread();
			try {
				sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		System.out.println("빵이 다 떨어졌습니다.");
	}
	
	
}

package mission.override;

public interface Soldier {
	int arms = 2;
	final static int legs = 2;
	
	abstract void eat();
	void work();
	void play();
	void sleep();
	void salute();
	
}

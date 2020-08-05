package concept.array;

public class ArTask {
	public static void main(String[] args) {
		int [] arNum = new int[5];
		int [] arNum2 = new int[10];
		//배열 선언 후 1~5까지의 값 넣기(for문 사용)
		for (int i = 0; i < arNum.length; i++) {
			arNum[i] = i+1;
		}
		for (int i = 0; i < arNum.length; i++) {
			System.out.println(arNum[i]);
		}
		//10~1까지의 값 넣기(for문 사용)
		for (int i = 0; i < arNum2.length; i++) {
			arNum2[i] = 10-i;
			System.out.println(arNum2[i]);
		}
		
		
	}
}









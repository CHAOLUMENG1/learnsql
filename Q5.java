package loop;

/**
 * 整数を 10 回入力し、平均値を求めるプログラムを作成しなさい。
 * @author CHAOY
 *
 */

public class Q5 {

	public static void main(String[] args) {
		int sum = 0;
		for(int i = 1;i<=10;i++) {
			sum = sum + i;
		}
		System.out.println("平均値は"+sum/10);
	}

}

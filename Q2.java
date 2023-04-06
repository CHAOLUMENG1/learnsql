package java_education;

/**
 * 5の階乗を求める(for)。
 * @author CHAOY
 *
 */

public class Q2 {

	public static void main(String[] args) {
		int j = 1;
		for (int i = 1; i <= 5; i++) {
			j = j * i ;
		}
		System.out.println(5 + "の階乗は" + j + "です。");
	}

}

package java_education;

import java.util.stream.IntStream;

/**
質問３の配列に値「７」のインデックスを求む。
 * @author CHAOY
 *
 */
public class Q5 {

	public static void main(String[] args) {
		 int[] arr = new int[]{1, 2, 6, 7, 9, 6, 2, 1};

		 int g = 7;

	        int j = IntStream.range(0, arr.length).
	                filter(i -> g == arr[i]).
	                findFirst().orElse(-1);

	        System.out.println("Index of " + g + " is " + j);
	}
}
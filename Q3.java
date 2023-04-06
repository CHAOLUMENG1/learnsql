package java_education;
/**
 * 配列 {1, 2, 6, 7, 9, 6, 2, 1} の最⼤値、最⼩値、和、平均値を求める。
 * @author CHAOY
 *
 */

public class Q3 {

	public static void main(String[] args) {
		int[] arr = new int[]{1, 2, 6, 7, 9, 6, 2, 1};

		int max = arr[0];
		int min = arr[1];
		int sum = arr[2];
		int avg = arr[3];
		for (int i = 1; i < arr.length; i++) {
		    int v = arr[i];
		    if (v > max) {
		        max = v;
		    }
		    if (v < min) {
		        min = v;
		    }
		    sum=sum+i;
		    avg=sum/arr.length;
		}
		System.out.println("最大値は"+max);
		System.out.println("最小値は"+min); 
		System.out.println("和は"+sum);
		System.out.println("平均値は"+avg); 

	}

}
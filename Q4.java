package java_education;

/**
 * ︓質問３の配列に重複ある要素を探す（要素の表⽰次数集計必要なし）。
 * @author CHAOY
 *
 */

public class Q4 {

	public static void main(String[] args) {
		 int[] arr = new int[]{1, 2, 6, 7, 9, 6, 2, 1};
		for(int i =0;i<arr.length;i++) {
			for(int j=i+1;j<arr.length;j++) {
				if(arr[i]==arr[j]) {
					System.out.println(arr[i]);
				}
			}
		}
		    
	}
}


package java_education;
/**
 * 配列を昇順でソートする（java.util等メソッド利⽤禁⽌）。
 * @author CHAOY
 *
 */
public class Q7 {

	public static void main(String[] args) {
		 int[] a = {64, 75, 40, 92, 58};

	        for(int i = 0; i < a.length-1; i++){
	            for(int j = i+1; j < a.length; j++){
	                if(a[j] > a[i]){
	                    int g = a[i];
	                    a[i] = a[j];
	                    a[j] = g;
	                }
	            }
	        }

	        for(int i = 0; i < a.length; i++){
	            System.out.println(a[i]);
	        }
	    }
	}
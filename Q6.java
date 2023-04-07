package java_education;
/**
 * 任意⾏列（２次元配列）の積を求める。
 * @author CHAOY
 *
 */
	public class Q6 {
		   public static void main(String[] args)  {
			   int[][] array = new int[][]{{2,4,6},{3,6,9}};		   
			   int jack=1;
			   for(int i = 0 ;i <array.length ;i++) {
				for(int j= 0 ; j < array[i].length ; j++) {
					jack*=array[i][j];
					
				}   
						System.out.print(jack);
			   }
		      
		  }
	}
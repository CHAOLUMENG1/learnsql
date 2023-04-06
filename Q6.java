package java_education;
/**
 * 任意⾏列（２次元配列）の積を求める。
 * @author CHAOY
 *
 */
	public class Q6 {
		   public static void main(String[] args)  {

		        int [][]R = {{1,0,-1},{2,3,-2},{4,0,5}};
		        int [][]x = {{1},{0},{-1}};
		        int [][]t = {{-1},{2},{-3}};

		        int [][]answer = new int[3][1];

		        for(int i = 0; i < 3; i++){
		            for(int j = 0; j < 1; j++){
		                for(int k = 0; k < 3; k++){
		                    answer[i][j] += R[i][k] * x[k][j];
		                }
		                answer[i][j] -= t[i][j];
		            }
		        }
		        for(int i = 0; i < 3; i++){
		            for(int j = 0; j < 1; j++){
		                System.out.print(answer[i][j] + " ");
		            }
		            System.out.println();
		        }
		  }
	}


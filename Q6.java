package loop;

/**
 * 整数、0 か 1 を 10 回入力する。これを対戦成績と考え、0 を負け、1 を勝ちとして、勝ちの
 * 総数、負けの総数を表示するプログラムを作成しなさい。
 * @author CHAOY
 *
 */

public class Q6 {

	public static void main(String[] args) {
		int victory=0;
		int[] array = new int [] {1,0,1,0,1,1,0,0,1,1};
		for(int i=0;i<array.length;i++) {
			if(array[i]!=0) {
			 victory=victory+1;
			}
		}
		System.out.println("勝ちの総数"+victory+"負けの総数"+(10 - victory));
	}
}

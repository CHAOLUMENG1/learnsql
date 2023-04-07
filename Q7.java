package loop;

import java.util.Scanner;

/**
 * 巨人、阪神戦で毎回の得点を入力する。（１回～９回）
入力が終わったら、それぞれの得点とどちらが勝ったかを表示する。
 * @author CHAOY
 *
 */
public class Q7 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int[] j=new int[9];
		int[] k=new int[9];
		for(int i=0;i<9;i++) {
			System.out.print(i+1+"回表、巨人の得点は？");
			j[i]=sc.nextInt();sc.nextLine();
			System.out.print(i+1+"回表、阪神の得点は？");
			k[i]=sc.nextInt();
		}
		sc.close();
		int sumj=0;
		int sumk=0;
		for(int i=1;i<9;i++) {
			if(j[i]==1)sumj+=1;
			if(k[i]==1)sumk+=1;
		}
		System.out.print("巨人："+sumj+"点,阪神："+sumk+"点");
		if(sumj>sumk) {
			System.out.print("巨人の勝ち");
		}else if(sumj<sumk) {
			System.out.print("阪神の勝ち");
		}else {
			System.out.print("引き分け");
		}
	}
}

package a.textexam.exam_1;

import java.util.Scanner;

public class Divide {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		System.out.println("첫 번째 숫자를 입력하세요 : ");
		int num1 = scanner.nextInt();
		System.out.println("두 번째 숫자를 입력하세요 : ");
		int num2 = scanner.nextInt();

		try {
			int result = divide(num1, num2);
			System.out.println("결과 : " + result);
		} catch (ArithmeticException e) {
			System.out.println("0으로 나눌 수 없습니다.");
		}
	}

	public static int divide(int a, int b) {
		if (b == 0) {
			throw new ArithmeticException("Division by zero");
		}
		return a / b;
	}
}

package test;

import java.util.InputMismatchException;
import java.util.Random;
import java.util.Scanner;

class sample_5 {
	String id;
	String location;
	int totalPoint = 0;
	int successCount = 0;
	int failCount = 0;
	int att = 0;
	int money = 0;
	int price = 500;

	static Scanner scanner = new Scanner(System.in);
	Random random = new Random();

	sample_5(String id, String location) {
		this.id = id;
		this.location = location;
	}

	void charge() {
		try {
			System.out.print("충전 금액을 입력해주세요 ( 1000원 단위 ) : ");
			int amount = scanner.nextInt();

			if (amount % 1000 != 0) {
				System.out.println("충전은 1000원 단위입니다");
			} else if (att > 0) {
				System.out.println("잔여 시도 횟수가 남았습니다");
			} else {
				money += amount;
				att = amount / price;
				System.out.println(amount + "원 충전완료");
				System.out.println("잔여시도 횟수 : " + att);
			}
		} catch (InputMismatchException e) {
			System.out.println("숫자만 입력해주세요.");
			scanner.nextLine(); 
		} 
	}

	void playGame() {
		if (att == 0) {
			System.out.println("충전 횟수가 없어 게임을 시작할 수 없습니다");
			return;
		}
		System.out.println();
		System.out.println("게임을 시작합니다 !");

		while (att > 0) {
			int result = random.nextInt(6) + 1;

			if (result >= 1 && result <= 4) {
				totalPoint += result;
				successCount++;
				System.out.println("성공 ! " + result + "포인트 획득!");
			} else {
				failCount++;
				System.out.println("실패!");
			}
			att--;
			System.out.println("남은 횟수 : " + att);
			System.out.println();
		}
		System.out.println("게임이 종료 되었습니다");
		System.out.println("총 포인트 : " + totalPoint + ", 성공횟수 : " + successCount + ", 실패횟수 : " + failCount);
		System.out.println();
		totalPoint = 0;
		successCount = 0;
		failCount = 0;
	}

	void over() {
		if (att > 0) {
			System.out.println("잔여시도 횟수가 남아있어 마감할 수 없습니다");
		} else {
			System.out.println("총 매출액은 : " + money + "원 입니다");
		}
	}

	void run() {
		while (true) {
			System.out.println();
			System.out.println("메뉴 : 1. 충전  2. 게임 시작  3. 마감");
			System.out.print("선택 : ");
			int choice = scanner.nextInt();

			if (choice == 1) {
				charge();
			} else if (choice == 2) {
				playGame();
			} else if (choice == 3) {
				over();
				break;
			} else {
				System.out.println("올바른 선택을 해주세요");
			}
		}
	}

	public static void main(String[] args) {
		System.out.print("기기 ID를 입력하세요 : ");
		String id = scanner.nextLine();
		System.out.print("지점명을 입력하세요 : ");
		String location = scanner.nextLine();

		sample_5 roulette = new sample_5(id, location);
		roulette.run();
		scanner.close();
	}

}

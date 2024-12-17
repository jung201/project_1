package test;

import java.util.Random;
import java.util.Scanner;

class Roulette {
	String id; // 기기 아이디
	String place; // 지점명
	int totalPoint = 0; // 총합포인트
	int successPoint = 0; // 성공횟수
	int failurePoint = 0; // 실패횟수
	int attempt = 0; // 잔여시도횟수
	int sales = 0; // 매출액
	int price = 500; // 게임 1회 금액

	static Scanner scanner = new Scanner(System.in); // 스캐너
	Random random = new Random(); // 랜덤

	Roulette(String id, String place) {
		this.id = id;
		this.place = place;
	}

	void charge() {
		System.out.print("충전 금액을 입력해주세요 : ");
		int amount = scanner.nextInt();

		if (amount % 1000 != 0) {
			System.out.println("충전금액은 1000단위 입니다");
		} else if (attempt > 0) {
			System.out.println("잔여횟수가 남았습니다");
		} else {
			sales += amount;
			attempt = amount / price;
			System.out.println();
			System.out.println("충전이 완료 되었습니다.");
			System.out.println("충전 금액 : " + amount);
			System.out.println("잔여 횟수 : " + attempt);
		}
	}

	void playGame() {
		if (attempt == 0) {
			System.out.println("충전 횟수가 없어 시작할 수 없습니다");
			return;
		}
		System.out.println();
		System.out.println("게임을 시작합니다 !");

		while (attempt > 0) {
			int result = random.nextInt(6) + 1;

			if (result >= 1 || result <= 4) {
				successPoint++;
				totalPoint += result;
				System.out.println("성공 ! " + result + "포인트 획득 !");
			} else {
				failurePoint++;
				System.out.println("실패 !");
			}
			attempt--;
			System.out.println("남은 횟수 : " + attempt);
			System.out.println();
		}
		System.out.println("총 획득 포인트 : " + totalPoint);
		System.out.println("성공 횟수 : " + successPoint + ", 실패 횟수 : " + failurePoint);
		totalPoint = 0;
		successPoint = 0;
		failurePoint = 0;
	}

	void over() {
		if (attempt > 0) {
			System.out.println("잔여시도 횟수가 남아있어 마감할 수 없습니다");
		} else {
			System.out.println();
			System.out.println("총 매출액은 : " + sales + "원 입니다");
		}
	}

	void run() {
		while (true) {
			System.out.println("\n메뉴 : 1. 충전, 2. 게임 시작, 3. 마감");
			System.out.print("메뉴 선택 : ");
			int choise = scanner.nextInt();
			if (choise == 1) {
				charge();
			} else if (choise == 2) {
				playGame();
			} else if (choise == 3) {
				over();
				break;
			} else {
				System.out.println("메뉴를 확인해 주세요");
			}
		}

	}

	public static void main(String[] args) {
		System.out.print("기기 아이디를 입력하세요 : ");
		String id = scanner.nextLine();
		System.out.print("지점명을 입력하세요 : ");
		String place = scanner.nextLine();

		Roulette roulette = new Roulette(id, place);
		roulette.run();
		scanner.close();
	}
}

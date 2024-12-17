package test;

import java.util.Random;
import java.util.Scanner;

public class sample_2 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		Random random = new Random();

		// 9명의 타자 이름과 통계를 저장하기 위한 배열
		String[] players = { "타자 1", "타자 2", "타자 3", "타자 4", "타자 5", "타자 6", "타자 7", "타자 8", "타자 9" };
		int[] atBats = new int[9]; // 타석 수
		int[] hits = new int[9]; // 안타 수

		int currentBatter = 0; // 현재 타자 순번

		for (int inning = 1; inning <= 3; inning++) { // 1회부터 3회까지
			int outs = 0;
			System.out.println(inning + "회 시작!\n");

			while (outs < 3) {
				System.out.println(players[currentBatter] + " 타석에 등장!");

				// 타율 계산 및 출력
				double battingAverage = (atBats[currentBatter] == 0) ? 0.0 : (double) hits[currentBatter] / atBats[currentBatter];
				System.out.printf("타율: %.3f%n", battingAverage);

				// 투수의 공 던지기
				int pitcherBall = random.nextInt(10) + 1;
				System.out.print("1부터 10까지 숫자를 입력하세요: ");
				int playerInput = scanner.nextInt();

				// 타석 수 증가
				atBats[currentBatter]++;

				if (playerInput == pitcherBall) {
					System.out.println("안타!\n");
					hits[currentBatter]++; // 안타 수 증가
				} else {
					System.out.println("아웃!\n");
					outs++;
				}

				// 다음 타자로 순환
				currentBatter = (currentBatter + 1) % 9;
			}

			System.out.println(inning + "회 종료. 3아웃 발생.");
		}

		System.out.println("게임 종료!");

		// 최종 결과 출력
		for (int i = 0; i < 9; i++) {
			double finalBattingAverage = (atBats[i] == 0) ? 0.0 : (double) hits[i] / atBats[i];
			System.out.printf("%s - 타석: %d, 안타: %d, 타율: %.3f%n", players[i], atBats[i], hits[i], finalBattingAverage);
		}

		scanner.close();
	}
}
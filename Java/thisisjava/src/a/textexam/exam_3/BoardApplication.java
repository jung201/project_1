package a.textexam.exam_3;

import java.util.Scanner;

public class BoardApplication {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		BoardManager boardManager = new BoardManager();
		boolean running = true;

		while (running) {
			System.out.println("\n1. 게시글 추가\n2. 게시글 조회\n3. 게시글 삭제\n4. 종료");
			System.out.print("옵션을 선택하세요: ");
			int choice = scanner.nextInt();
			scanner.nextLine(); // 개행 문자 제거

			switch (choice) {
			case 1:
				System.out.print("제목: ");
				String title = scanner.nextLine();
				System.out.print("내용: ");
				String content = scanner.nextLine();
				boardManager.addPost(title, content);
				break;
			case 2:
				System.out.print("조회할 게시글 ID: ");
				int viewId = scanner.nextInt();
				boardManager.viewPost(viewId);
				break;
			case 3:
				System.out.print("삭제할 게시글 ID: ");
				int deleteId = scanner.nextInt();
				boardManager.deletePost(deleteId);
				break;
			case 4:
				running = false;
				System.out.println("프로그램을 종료합니다.");
				break;
			default:
				System.out.println("잘못된 선택입니다. 다시 시도하세요.");
				break;
			}
		}

		scanner.close();
	}
}

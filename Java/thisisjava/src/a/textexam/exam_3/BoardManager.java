package a.textexam.exam_3;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

//게시판 관리 클래스
class BoardManager {
	private List<BoardPost> posts;
	private int nextId;

	public BoardManager() {
		posts = new ArrayList<>();
		nextId = 1;
	}

	// 게시글 추가
	public void addPost(String title, String content) {
		BoardPost post = new BoardPost(nextId++, title, content);
		posts.add(post);
		System.out.println("게시글이 추가되었습니다: " + post.getId());
	}

	// 게시글 조회
	public void viewPost(int id) {
		for (BoardPost post : posts) {
			if (post.getId() == id) {
				System.out.println("게시글 조회:\n" + post);
				return;
			}
		}
		System.out.println("해당 ID의 게시글이 없습니다.");
	}

	// 게시글 삭제
	public void deletePost(int id) {
		for (BoardPost post : posts) {
			if (post.getId() == id) {
				posts.remove(post);
				System.out.println("게시글이 삭제되었습니다: " + id);
				return;
			}
		}
		System.out.println("해당 ID의 게시글이 없습니다.");
	}
}

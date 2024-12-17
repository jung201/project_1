package a.textexam.exam_3;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

// 게시글 클래스
class BoardPost {
	private int id;
	private String title;
	private String content;

	public BoardPost(int id, String title, String content) {
		this.id = id;
		this.title = title;
		this.content = content;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "ID: " + id + "\n제목: " + title + "\n내용: " + content;
	}
}
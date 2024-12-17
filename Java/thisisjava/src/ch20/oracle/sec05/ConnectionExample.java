package ch20.oracle.sec05;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionExample {
	public static void main(String[] args) {
		// 오라클 DB 연결하기
		
		// try 안에도 있고 finally 안에도 있어서 전역변수로
		Connection conn = null;
		try {
			// JDBC Driver 등록
			// 오라클 드라이버 연결 방식 - 통신준비
			Class.forName("oracle.jdbc.OracleDriver");

			// 오라클 DB 연결하기
			conn = DriverManager.getConnection( // << 이 메서드를 통해 데이터베이스에 연결
					"jdbc:oracle:thin:@localhost:1521/XE", // 오라클 연결 문자열
					"c##human", // 아이디
					"human" // 비번
			);

			// 연결이 되면 출력
			System.out.println("연결 성공");

			// 드라이버 로딩 실패 시
		} catch (ClassNotFoundException e) {
			e.printStackTrace(); // 원인 출력

			// 연결 과정에서 오류가 발생할 시
		} catch (SQLException e) {
			e.printStackTrace(); // 원인출력

			// conn이 null이 아니면 conn.close를 호출하여 연결을 종료
		} finally {
			if (conn != null) {
				try {
					// 연결 끊기
					conn.close();
					System.out.println("연결 끊기");
				} catch (SQLException e) {
				}
			}
		}

	}
}

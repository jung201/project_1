package ch20.oracle.sec08;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BoardDeleteExample {
	public static void main(String[] args) {
		// board 내용 삭제하기
		
		// try 안에도 있고 finally 안에도 있어서 전역변수로
		Connection conn = null;
		try {
			// JDBC Driver 등록
			// 오라클 드라이버 연결 방식 - 통신준비
			Class.forName("oracle.jdbc.OracleDriver");

			// 연결하기
			conn = DriverManager.getConnection( //<< 이 메서드를 통해 데이터베이스에 연결
					"jdbc:oracle:thin:@localhost:1521/XE", // 오라클 연결 문자열
					"c##human", // 아이디
					"human" // 비번
					);
			
			String sql = "DELETE FROM boards WHERE bno=?";

			// PreparedStatement 얻기 및 값 지정
			// JDBC ( Java Database Connectivity )에서 SQL 쿼리를 사전에 컴파일 하고 실행할 준비를
			// 하는 객체를 생성하는 구문
			// PreparedStatement는 SQL 쿼리에 동적으로 매개변수 값을 설정할 수 있게 하며, SQL 
			// 인젝션 방지와 성능 향상에 유리한 방식
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,6);
			
			// insert, update, delete 일 경우에는 executeUpdate() 메소드 호출
			// 데이터를 가져오는 select 일 경우에는 executeQuery() 메소드 호출
			int rows = pstmt.executeUpdate();
			System.out.println("삭제된 행 수 : " + rows);

			// PreparedStatement 닫기
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					// 연결 끊기
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
		
	}
}

package sec02.ex01;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	// 필드
	private Connection con; // DB와의 연결을 관리하는 객체
	private PreparedStatement pstmt; // SQL문을 미리 컴파일 하고 실행하는 객체
	private DataSource dataFactory; // DB 연결을 위한 커넥션 풀을 제공하는 객체

	// 생성자
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env"); // DB 연결풀의 이름
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle"); // DB 연결
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List listMembers(MemberVO memberVO) {
		List membersList = new ArrayList();
		String _name = memberVO.getName();
		try {
			con = dataFactory.getConnection();
			String query = "select * from t_member ";

			if ((_name != null && _name.length() != 0)) { // null이 아니고 빈 문자열이 아니라면
				query += " where name=?"; // where절을 통해 특정 이름에 해당하는 회원만 조회
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, _name);
			} else {
				pstmt = con.prepareStatement(query);
			}

			System.out.println("prepareStatememt: " + query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");
				MemberVO vo = new MemberVO();
				vo.setId(id);
				vo.setPwd(pwd);
				vo.setName(name);
				vo.setEmail(email);
				vo.setJoinDate(joinDate);
				membersList.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return membersList;
	}
}
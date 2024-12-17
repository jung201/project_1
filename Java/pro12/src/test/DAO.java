package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import test.DTO.Item;

public class DAO {

	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;

	public DAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int insertData(DTO data) {
		int result = 0;

		try {
			con = dataFactory.getConnection();

			String sql = "insert into s_data(code, name, rnum) "
					+ "values (?, ?, ?)";

			List<test.DTO.Item> itemList = data.getBody().getList();
			int count = 0;
			for (test.DTO.Item item : itemList) {
				pstmt = con.prepareStatement(sql);
				System.out.println(sql);
				System.out.println(item.getCode() + ":" + item.getName() + ":" + item.getRnum());

				pstmt.setInt(1, item.getCode());
				pstmt.setString(2, item.getName());
				pstmt.setInt(3, item.getRnum());

				result = pstmt.executeUpdate();

				if (result < 1)
					throw new Exception("입력 중 오류 발생");
				if (count++ > 10)
					break;
			}

			pstmt.close();
			con.close();

		} catch (Exception e) {
			System.out.println("SQL구문 실행 중 예외 발생");
		}
		return result;
	}

// select
	public List<Item> getList() {
		List<Item> itemList = new ArrayList<>();

		try {
			String sql = "select * from s_data ";
			con = dataFactory.getConnection();

			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Item item = new Item();
				item.setCode(rs.getInt("code"));
				item.setName(rs.getString("name"));
				item.setRnum(rs.getInt("Rnum"));
				itemList.add(item);
			}

			rs.close();
			pstmt.close();
			con.close();

		} catch (Exception e) {
			System.out.println("조회 중 에러 발생");
		}

		return itemList;
	}

}
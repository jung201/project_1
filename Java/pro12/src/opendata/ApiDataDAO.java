package opendata;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import opendata.ApiDataDTO.Item;

public class ApiDataDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;

	public ApiDataDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * ApiDataDTO 데이터를 t_data 테이블에 저장한다
	 * 
	 * @param data
	 * 
	 * @return
	 */
	public int insertData(ApiDataDTO data) {
		int result = 0;

		try {
			con = dataFactory.getConnection();

			String sql = "insert into t_data(seq, arsid, busrouteid, direction, station, stationnm) "
					+ "values (?, ?, ?, ?, ?, ?)";

			List<Item> itemList = data.getMsgBody().getItemList();
			int count = 0;
			for (Item item : itemList) {
				pstmt = con.prepareStatement(sql);
				System.out.println(sql);
				System.out.println(item.getSeq() + ":" + item.getArsId() + ":" + item.getBusRouteId() + ":"
						+ item.getDirection() + ":" + item.getStation() + ":" + item.getStationNm());

				pstmt.setInt(1, item.getSeq());
				pstmt.setInt(2, item.getArsId());
				pstmt.setString(3, item.getBusRouteId());
				pstmt.setString(4, item.getDirection());
				pstmt.setString(5, item.getStation());
				pstmt.setString(6, item.getStationNm());

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
			String sql = "select * from t_data ";
			con = dataFactory.getConnection();

			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Item item = new Item();
				item.setSeq(rs.getInt("seq"));
				item.setArsId(rs.getInt("arsid"));
				item.setBusRouteId(rs.getString("busrouteid"));
				item.setDirection(rs.getString("direction"));
				item.setStation(rs.getString("station"));
				item.setStationNm(rs.getString("stationnm"));

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
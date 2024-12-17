package pro13.ex01;

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
    private Connection con; // 데이터베이스와 연결을 나타내는 객체
    private PreparedStatement pstmt; // SQL 쿼리문을 미리 컴파일해서 데이터베이스에 실행할 때 사용하는 객체. ( 보안에 좋고 속도도 빠르다 )
    private DataSource dataFactory; // 데이터베이스 연결을 제공하는 "공장"같은 역할 필요할때마다 DataSource에서 Connection 객체를 만들어 사용가능
    
    // MemberDAO클래스는 데이터베이스와 연결이 필요한 기능들을 구현
    public MemberDAO() {
        try {
            InitialContext ctx = new InitialContext(); // 특정한 자원을 찾는데 사용. ctx라는 객체를 만들어 필요한 설정 정보를 찾아 올 준비
            Context envContext = (Context) ctx.lookup("java:/comp/env"); // java 환경설정을 찾는 과정, 경로를 통해 설정이 정의된 영역을참조
            dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
            // envContext 객체 안에서 jdbc/oracle이라는 이름으로 등록된 DataSource를 찾아 dataFactory에 저장. jdbc/oracle은 미리 설정된 데이터베이스 자원을 의미
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // 데이터베이스에서 회원 정보를 조회하며 리스트로 반환하는 역할 
    public List listMembers() { // List 형식의 데이터를 반환
        List list = new ArrayList(); // ArrayList를 사용해 list라는 이름의 빈 리스트를 만들어두고, 나중에 이 리스트에 회원정보를 추가
        try {
            con = dataFactory.getConnection(); 
            // dataFactory에서 getConnection() 메서드를 호출해 데이터베이스와의 연결을 설정 con객체는 데이터베이스와 연결
            String query = "select * from t_member order by joinDate desc";
            // query라는 변수에 SQL쿼리문을 작성. 여기서 t_member라는 테이블에서 모든 데이터를 가져오되, 최신 가입일 순서로 정렬해서 가져옴
            System.out.println("prepareStatememt: " + query);
            // 쿼리문을 출력하는 코드로, 디버깅(확인)용
            pstmt = con.prepareStatement(query);
            // con 객체에서 prepareStatement 메서드를 호출해 쿼리문을 준비. 이렇게하면 쿼리가 컴파일되고, 나중에 데이터베이스를 빠르게 실행 가능
            
            ResultSet rs = pstmt.executeQuery();
            // pstmt.executeQuery()로 쿼리를 실행하고 결과를 ResultSet에 저장.
            while (rs.next()) {
            	// rs에서 컬럼명을 통해 데이터를 읽어옴
                String id = rs.getString("id");
                String pwd = rs.getString("pwd");
                String name = rs.getString("name");
                String email = rs.getString("email");
                Date joinDate = rs.getDate("joinDate");
                
                // 객체생성
                MemberBean vo = new MemberBean();
                vo.setId(id);
                vo.setPwd(pwd);
                vo.setName(name);
                vo.setEmail(email);
                vo.setJoinDate(joinDate);
                // list에 vo객체를 추가함. 반복문이 끝나면 list에는 모든 회원 정보가 MemberBean 객체로 담겨짐
                list.add(vo);
            }
            // 사용이 끝난 ResultSet, PreparedStatement, Connection 객체를 닫아줌
            // 데이터베이스 연결을 해제하는 중요한 작업
            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 모든 작업이 끝나면 회원 정보가 담긴 list를 반환함
        return list;
    }
    
    // 새로운 회원 정보를 데이터베이스에 추가하는 역할
    public void addMember(MemberBean memberBean) {
        try {
        	//dataFactory에서 getConnection() 메서드를 호출하여 데이터베이스와 연결하고, con이라는 Connection 객체를 생성
        	// 이 객체를 통해 데이터베이스에 접근가능
            Connection con = dataFactory.getConnection();
            String id = memberBean.getId();
            String pwd = memberBean.getPwd();
            String name = memberBean.getName();
            String email = memberBean.getEmail();
            
            // t_member에 SQL 쿼리문 작성
            String query = "insert into t_member";
            // id,pwd,name,email 순서대로 값이 삽입될 것이므로 해당 필드 이름을 추가
            query += " (id,pwd,name,email)";
            // 각각의 ?는 이후에 들어갈 값을 나타냄
            query += " values(?,?,?,?)";
            System.out.println("prepareStatememt: " + query);
            
            // con 객체의 prepareStatement 메서드를 호출하여 쿼리를 미리 준비함.
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, id); // 첫번째 ? 위치에 id 값을 넣음
            pstmt.setString(2, pwd);
            pstmt.setString(3, name);
            pstmt.setString(4, email);
            
            // executeUpdate 메서드로 쿼리 실행
            pstmt.executeUpdate();
            // 객체를 닫음. 데이터베이스 관련 객체는 사용이 끝나면 반드시 닫아줘야함
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
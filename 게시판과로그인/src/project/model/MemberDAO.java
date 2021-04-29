package project.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public void insertMember(MemberDTO dto) {
		try {
			conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
			//                             insert into member(id,pw,status) values(?,?,1);
			pstmt = conn.prepareStatement("insert into member values(?,?,?,?,sysdate,1)");
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getAge());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(conn, pstmt, rs);
		}
	}
	//  boolean , int , String , DTO 
	public boolean loginCheck(String id , String pw) {
		boolean result = false;
		try {
			conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
			pstmt = conn.prepareStatement("select * from member where id=? and pw=? and status != 3 ");            
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(conn, pstmt, rs);
		}
		return result;
	}
	
	//  boolean , int , String , DTO 
	public MemberDTO getMember(String id) {
		MemberDTO dto = new MemberDTO();
		try {
			conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
			pstmt = conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setPw(rs.getString("pw"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age")+"");
				dto.setReg(rs.getTimestamp("reg"));
				dto.setStatus(rs.getInt("status"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(conn, pstmt, rs);
		}
		return dto;
	}
	
//  boolean , int , String , DTO , void
	
	public void updateMember(MemberDTO dto) {
		try {
			conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
			pstmt = conn.prepareStatement("update member set pw=?,name=?,age=? where id=?");
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getAge());
			pstmt.setString(4, dto.getId());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(conn, pstmt, rs);
		}
	}
	
	public void statusChange(String id) {
		try {
			conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
			pstmt = conn.prepareStatement("update member set status=3 where id=?");
			pstmt.setString(1,id);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(conn, pstmt, rs);
		}
	}
}















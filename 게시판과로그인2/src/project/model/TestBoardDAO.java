package project.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TestBoardDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	public void insertBoard(TestBoardDTO dto) {
		try {
			conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
			pstmt = conn.prepareStatement("insert into testboard values(testboard_seq.nextval,?,?,?,?,sysdate,0,1)");       
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getSave());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(conn, pstmt, rs);
		}
	}
	
	public ArrayList<TestBoardDTO> getList() {
		ArrayList<TestBoardDTO> list = new ArrayList<TestBoardDTO>();
		try {
			conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
			pstmt = conn.prepareStatement("select * from testboard order by reg desc"); 
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TestBoardDTO dto = new TestBoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setSave(rs.getString("save"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setStatus(rs.getInt("status"));
				dto.setReg(rs.getTimestamp("reg"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(conn, pstmt, rs);
		}
		return list;
	}
	
	public void readCount(int num) {
		try {
			conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
			pstmt = conn.prepareStatement("update testboard set readcount=readcount+1 where num=? "); 
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(conn, pstmt, rs);
		}
	}	
	
	public TestBoardDTO getContent(int num) {
		TestBoardDTO dto = new TestBoardDTO();
		try {
			conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
			pstmt = conn.prepareStatement("select * from testboard where num=? "); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setSave(rs.getString("save"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setStatus(rs.getInt("status"));
				dto.setReg(rs.getTimestamp("reg"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(conn, pstmt, rs);
		}
		return dto;
	}
	
	public void deleteBoard(int num) {
		try {
			conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출
			pstmt = conn.prepareStatement("update testboard set status=3 where num=? "); 
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(conn, pstmt, rs);
		}
	}
	
	public void updateBoard(TestBoardDTO dto) {
		try {
			conn = ConnectionDAO.getConnection();  // 1/2단계 메서드 호출			
			String sql = "update testboard set writer=?,subject=?,content=?,save=? where num=?";
			if(dto.getSave() == null) {
				sql = "update testboard set writer=?,subject=?,content=? where num=?";
			}
			pstmt = conn.prepareStatement(sql);       
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			if(dto.getSave() == null) {
				pstmt.setInt(4, dto.getNum());
			}else {
				pstmt.setString(4, dto.getSave());
				pstmt.setInt(5, dto.getNum());
			}
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(conn, pstmt, rs);
		}
	}
}







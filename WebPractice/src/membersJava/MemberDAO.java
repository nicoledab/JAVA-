package membersJava;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

//import test.model.bean.ConnectionDAO;
//import test.model.bean.empDTO;

//import membersJava.MConnectionDAO;
//import membersJava.Limit0409;

public class MemberDAO {
	private Connection conn= null; 
	private PreparedStatement pstmt = null;
	private ResultSet rs= null;
	
	public void insert(Limit0409 mem) {
		try {
			conn = MConnectionDAO.getConnection(); //1,2���� ������ �ϸ鼭 ����� Ŀ�ؼ� ��ü�� �������ش�. 
			String sql="insert into MEMBER Values(?,?,?,?,?,?,?,?)";
			pstmt= conn.prepareStatement(sql); //3�ܰ�
			
			pstmt.setString(1, mem.getId());
			pstmt.setString(2, mem.getPw());
			pstmt.setString(3, mem.getName());
			pstmt.setString(4, mem.getGender());
			pstmt.setString(5, mem.getAge());
			pstmt.setString(6, mem.getTel_h1());
			pstmt.setString(7, mem.getEmail());
			pstmt.setString(8, mem.getAddre());
			
			
			
			  /*  pstmt.setInt(1, Integer.parseInt(emp.getEmpno()));
			    pstmt.setString(2, emp.getEname());
			    pstmt.setString(3, emp.getJob());
			    pstmt.setInt(4, Integer.parseInt(emp.getMgr()));
			    // pstmt.setString(5, emp.getHiredate());
			    pstmt.setInt(5, Integer.parseInt(emp.getSal()));
			    pstmt.setInt(6, Integer.parseInt(emp.getComm()));
			    pstmt.setInt(7, Integer.parseInt(emp.getDeptno()));*/
			
			    pstmt.executeUpdate(); //4�ܰ� 
			    
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
				MConnectionDAO.close(rs, pstmt, conn);
		}
	}
	
	public ArrayList<Limit0409> select() {
		ArrayList<Limit0409> list = null;
		try {
			conn = MConnectionDAO.getConnection();
		    String sql="select*from MEMBER";
		    pstmt = conn.prepareStatement(sql);
		    rs = pstmt.executeQuery();
		    
		    list = new ArrayList<Limit0409>();
		    while(rs.next()) { //rs.next() -ù��° ���ڵ� true ���θ� Ȯ�����ش�. 
		    	Limit0409 mem = new Limit0409();
		    	
		    	mem.setId(rs.getString("id"));
		    	mem.setPw(rs.getString("pw"));
		    	mem.setName(rs.getString("name"));
		    	mem.setGender(rs.getString("gender"));
		    	mem.setAge(rs.getString("age"));
		    	mem.setTel_h1(rs.getString("tel"));
		    	mem.setEmail(rs.getString("email"));
		    	mem.setAddre(rs.getString("addre"));
		    	
		    	/*emp.setEmpno(rs.getInt("empno") +"");  //get���� ������ 
		    	emp.setEname(rs.getString("ename"));
		    	emp.setJob(rs.getString("job"));
		    	emp.setHiredate(rs.getTimestamp("hiredate").toString()); //��¥�޾Ƽ� tostring
		        emp.setMgr(rs.getInt("mgr")+"");
		        emp.setComm(rs.getInt("comm")+"");
		        emp.setSal(rs.getInt("sal")+"");
		        emp.setDeptno(rs.getInt("deptno")+"");*/
		    	
		        list.add(mem);
		    }// db���� �������� dto�� 
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MConnectionDAO.close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	
}

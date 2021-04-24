package membersJava;



import java.sql.Connection;
//import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import membersJava.Limit0409;
import membersJava.MConnectionDAO;

public class MemberDAO2 {  
	 
	private Connection conn= null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null; 
	
	public boolean idCheck(String id) {
		boolean result = false; //id ��� ���� 
		try {
			conn = MConnectionDAO.getConnection();
			String sql = "select *from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			   if(rs.next()) {
			    	result = true;   //id ��� �Ұ���
			    }
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				MConnectionDAO.close(rs, pstmt, conn);
			}
			return result;
		
	}

	
	//---
	public void insert(Limit0409 mem) {
		try {
			conn = MConnectionDAO.getConnection(); //1,2���� ������ �ϸ鼭 ����� Ŀ�ؼ� ��ü�� �������ش�. 
			String sql="insert into member Values(?,?,?,?,?,?,?,?,?)";
			pstmt= conn.prepareStatement(sql); //3�ܰ�
			
			pstmt.setString(1, mem.getId());
			pstmt.setString(2, mem.getPw());
			pstmt.setString(3, mem.getName());
			pstmt.setString(4, mem.getGender());
			pstmt.setString(5, mem.getAge());
			pstmt.setString(6, mem.getTel_h1());
			pstmt.setString(7, mem.getEmail());
			pstmt.setString(8, mem.getAddre());
			pstmt.setString(9, mem.getJumin1());
			
			
			
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
		    String sql="select*from member";
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
		    	mem.setAddre(rs.getString("jumin1"));
		    	
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
	
	
	
	
	//------------------------------------------0416
	public boolean loginCheck(Limit0409 dto) {
		boolean result = false;
		try {
			 conn= MConnectionDAO.getConnection();
			 String sql="select*from member where id=? and pw=?";
			 
				pstmt= conn.prepareStatement(sql); //3�ܰ�
				
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPw());
		    rs= pstmt.executeQuery();  //�����޼ҵ�� ȣ��
		    if(rs.next()) {
		    	result = true;   //��� ���Դ� 
		    }
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MConnectionDAO.close(rs, pstmt, conn);
		}
		return result;
		
	}
	
	
	
	public boolean deleteMember(String id, String pw) {
		boolean result = false;
		try {
			conn = MConnectionDAO.getConnection();
			 String sql="select * from member where id=? and pw=?";   
			    pstmt = conn.prepareStatement(sql);
			    pstmt.setString(1, id);
			    pstmt.setString(2, pw);
			    rs= pstmt.executeQuery(); 
			    if(rs.next()) {   /// true�� ���� �ϱ�!!!!
			    	sql = "delete from member where id=?";
			    	pstmt = conn.prepareStatement(sql);
			    	pstmt.setString(1, id);
			    	pstmt.executeUpdate();
			    	result = true;
			    }
			  
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MConnectionDAO.close(rs, pstmt, conn);
		}
		return result;
	}
	 
	
	//�Ϸ� ^^        //   ������Ʈ !!!!!!!
	public Limit0409 getMember(String id) {
		Limit0409 dto =null;
		try {
			conn = MConnectionDAO.getConnection();
			String sql = "select *from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new Limit0409();
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getString("age"));
				dto.setEmail(rs.getString("email"));
				//dto.setTel_h1(rs.getString("tel_h1"));
				
				
			//	dto.setEmail(rs.getString("email"));
			//	dto.setPhone(rs.getString("phone"));
				//dto.setAge(rs.getInt("age")+"");
				//dto.setImg(rs.getString("img"));  ���⵵ �������� ���� 
				dto.setReg(rs.getTimestamp("joindate")); // ��¥�� joindate 
			}
	    }catch(Exception e) {
			e.printStackTrace();
		}finally {
			MConnectionDAO.close(rs, pstmt, conn);
		}
		return dto;
		
	}
	// member ���̺��� img �÷��� ������.. 
	// member ���̺� �÷��� Ȯ���ϰ� ���� ^^ 
	public void updateMember(Limit0409 dto) {
		try {
			conn = MConnectionDAO.getConnection();
			String sql = "update member set pw=?,name=?,age=?,email=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getAge());
			pstmt.setString(4, dto.getEmail());
			
			//pstmt.setString(4, dto.getTel_h1());
			
			//pstmt.setString(4, dto.getEmail());
		//	pstmt.setString(5, dto.getPhone());
			
			//pstmt.setString(4, dto.getAddress());
			//pstmt.setString(5, dto.getEmail());
			//int age = Integer.parseInt(dto.getAge());
			//pstmt.setString(3, dto.getImg());
			pstmt.setString(5, dto.getId());
		    
			pstmt.executeUpdate();
	    }catch(Exception e) {
			e.printStackTrace();
		}finally {
			MConnectionDAO.close(rs, pstmt, conn);
		}
		
		
	}
	
}

	
	


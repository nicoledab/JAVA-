package user.dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import user.dto.ConnectionDAO;
import user.dto.ReviewBoardDTO;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import user.dto.ReviewBoardDTO;

public class ReviewBoardDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs= null;
	
	/*public void insertBoard(ReviewBoardDTO dto) {
		try {
			conn = ConnectionDAO.getConnection(); //1~2�ܰ� �޼��� ȣ�� 
			
			//3�ܰ� 
			pstmt = conn.prepareStatement("insert into reviewboard values(testboard_seq.nextval,?,?,?,?,sysdate)");
			pstmt.setString(1, dto.getWriter()); //dto�� id�� ������ set �ϰڴ�! 
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getSave());
			
			pstmt.executeUpdate(); //4�ܰ� 
			//pstmt.executeQuery() �̰� ��� ������ ���� 
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	}*/
	
	public void insertreviewBoard(ReviewBoardDTO dto) throws Exception {
		
		try {
			conn = ConnectionDAO.getConnection();
			
			                                                      //   num,writer,subject,content,save,reg_date,ref,ref_step,re_level, ��ȸ��, ����
			pstmt = conn.prepareStatement("insert into reviewboard values(reviewboard_seq.nextval,?,?,?,?,sysdate,0,1)");
			pstmt.setString(1, dto.getWriter()); //dto�� id�� ������ set �ϰڴ�! 
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getSave());
			
			pstmt.executeUpdate(); //4�ܰ� 
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	}
	
	
	public ArrayList<ReviewBoardDTO> getList() {
		ArrayList<ReviewBoardDTO> list = new ArrayList<ReviewBoardDTO>();
		
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select * from reviewboard order by reg_date desc");
			rs = pstmt.executeQuery();
			
			//   rs.next() -ù��° ���� true Ȯ��, �ι�°~ ���������� ��� �ݺ�!   
			while(rs.next()) {
				ReviewBoardDTO dto = new ReviewBoardDTO(); 
				
				dto.setNum(rs.getInt("num"));
			    dto.setWriter(rs.getString("writer"));
			    dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setSave(rs.getString("save"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setStatus(rs.getInt("status"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				
				list.add(dto);// list�� �ִ´�
			}
					
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return list;
	}
	
	
	public void readCount (int num) {
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("update reviewboard set readcount=readcount+1 where num= ? ");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	}
	
	
	//select *from reviewboard where num=3; �� sql �� �˻�, ���� Ȯ���Ҽ��ִ�
	public ReviewBoardDTO getContent(int num) {
		
		ReviewBoardDTO dto = new ReviewBoardDTO();
		
		
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select *from reviewboard where num=? ");
			pstmt.setInt(1, num);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
			    dto.setWriter(rs.getString("writer"));
			    dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setSave(rs.getString("save"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setStatus(rs.getInt("status"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return dto;
	}
	
	
	// ��ü reviewboard ���̺��� ���ڵ� �� ����!! 
		public int getreviewCount() throws Exception {
			int x=0;
			try {
				conn = ConnectionDAO.getConnection();
				pstmt = conn.prepareStatement("select count(*) from reviewboard"); //count-���� (�Խñ���)
				rs = pstmt.executeQuery();
				if (rs.next()) {
					x= rs.getInt(1); 
				}
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				ConnectionDAO.close(rs, pstmt, conn);
			}
			return x; 
		}
	
		
        ///���º���   3-���� 
		public void deleteBoard(int num) {
			try {                                 // ���¸� ��ȭ "update reviewboard set status=3 where num=? ")
				conn = ConnectionDAO.getConnection();   // "delete from reviewboard where num=?"
				pstmt = conn.prepareStatement("delete from reviewboard where num=?");
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
	
			}catch(Exception e) {
	e.printStackTrace();
			}finally {
				ConnectionDAO.close(rs, pstmt, conn);
			}
		}	
		
		
		public void updateBoard(ReviewBoardDTO dto) {
			try {
				conn = ConnectionDAO.getConnection();  // 1/2�ܰ� �޼��� ȣ��			
				String sql = "update reviewboard set writer=?,subject=?,content=?,save=? where num=?";
				if(dto.getSave() == null) {
					sql = "update reviewboard set writer=?,subject=?,content=? where num=?";
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
				ConnectionDAO.close(rs, pstmt, conn);
			}
		}
		
		
		//5 �˻� ���                            , int start, int end
		public List getreview(String col, String search) throws Exception {
			List reviewList=null;
			try {
				conn = ConnectionDAO.getConnection();//"select * from reviewboard where "+col+" like %"+search+"%' order by reg_date desc "
				pstmt = conn.prepareStatement("select num, writer,subject, content,save,reg_date, readcount, status, ref+step, r" +
						  "from ( select num, writer,subject, content,save,reg_date, readcount, status, ref+step, rownum r"+
						  "from ( select num, writer,subject, content,save,reg_date, readcount, status, ref+step, rownum r"+
						"from reviewboard where  where " +col+" like '%"+search+"%' order by reg_date desc)  where r >= ? and r <= ? ");
						//pstmt.setInt(1, start);                          
						//pstmt.setInt(2, end); 

						
						rs = pstmt.executeQuery();
						/*if (rs.next()) {
							articleList = new ArrayList(end); 
							do{ 
								BoardDataBean article= new BoardDataBean();
								article.setNum(rs.getInt("num"));
								article.setWriter(rs.getString("writer"));
								article.setEmail(rs.getString("email"));
								article.setSubject(rs.getString("subject"));
								article.setPasswd(rs.getString("passwd"));
								article.setReg_date(rs.getTimestamp("reg_date"));
								article.setReadcount(rs.getInt("readcount"));
								article.setRef(rs.getInt("ref"));
								article.setRe_step(rs.getInt("re_step"));
								article.setRe_level(rs.getInt("re_level"));
								article.setContent(rs.getString("content"));
								article.setIp(rs.getString("ip"));
								articleList.add(article); 
							}while(rs.next());
						}*/
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				ConnectionDAO.close(rs, pstmt, conn);
			}

			return reviewList;
		}
		
		// 5�� ..
		public int getreviewCount(String col, String search ) throws Exception {
			int x=0;
			try {
				conn = ConnectionDAO.getConnection();
				String sql ="select count(*) from reviewboard where " +col+" like '%"+search+"%'";
				pstmt = conn.prepareStatement(sql); 
				rs = pstmt.executeQuery();
				if (rs.next()) {
					x= rs.getInt(1); 
				}
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				ConnectionDAO.close(rs, pstmt, conn);
			}
			return x; 
		}
		
		
		
		
		
		
	/*	   // ��ø select �� 
		public List getArticles(int start, int end) throws Exception {
			List articleList=null;
			try {
				conn = ConnectionDAO.getConnection();
				pstmt = conn.prepareStatement(
						"select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,r "+
						"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r " +
						"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount " +
						"from reviewboard order by ref desc, re_step asc) order by ref desc, re_step asc ) where r >= ? and r <= ? ");
						pstmt.setInt(1, start);                          // ref ��������, restep �������� 
						pstmt.setInt(2, end); 

						rs = pstmt.executeQuery();
						if (rs.next()) {
							articleList = new ArrayList(end); 
							do{ 
								BoardDataBean article= new BoardDataBean();
								article.setNum(rs.getInt("num"));
								article.setWriter(rs.getString("writer"));
								article.setEmail(rs.getString("email"));
								article.setSubject(rs.getString("subject"));
								article.setPasswd(rs.getString("passwd"));
								article.setReg_date(rs.getTimestamp("reg_date"));
								article.setReadcount(rs.getInt("readcount"));
								article.setRef(rs.getInt("ref"));
								article.setRe_step(rs.getInt("re_step"));
								article.setRe_level(rs.getInt("re_level"));
								article.setContent(rs.getString("content"));
								article.setIp(rs.getString("ip"));
								articleList.add(article); 
							}while(rs.next());
						}
			} catch(Exception ex) {
				ex.printStackTrace();
			} finally {
				ConnectionDAO.close(rs, pstmt, conn);
			}

			return articleList;
		}
	*/
	
	/*
	//--------------------for reviewPractice 
	public class BoardDAO {
		 
	    Connection con;
	    PreparedStatement pstmt;
	    ResultSet rs;
	     
	    //������ ���̽��� Ŀ�ؼ��� ����ϵ��� �����ϴ� �޼ҵ�
	    //lib ��  ojdbc7.jar ���̺귯�� ��� �Ұ�  maver.repository ����Ʈ �˻��� �ٿ�ε�
	    public void getCon(){
	        try{
	            //�ܺο��� �����͸� �о���� �ϱ⿡
	            Context initctx =new InitialContext();
	            //���� ������ ������ ��Ƴ��� ������ �̵�
	            Context envctx =(Context) initctx.lookup("java:comp/env/");
	            //������ �ҽ� ��ü�� ����
	            DataSource ds =(DataSource) envctx.lookup("jdbc/pool");
	            //������ �ҽ��� �������� Ŀ�ؼ��� �������ֽÿ�
	            con =ds.getConnection();
	             
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	    }
	}*/
	
	
	
	
}

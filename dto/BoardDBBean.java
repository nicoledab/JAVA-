package user.dto;
import java.sql.*;
import java.util.*; 
import user.dto.ConnectionDAO;

public class BoardDBBean {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	
	
	
	
	
	
	
	public void insertArticle(BoardDataBean article) throws Exception {
		int num=article.getNum();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		int number=0;
		String sql="";
		try {
			conn = ConnectionDAO.getConnection(); 
			pstmt = conn.prepareStatement("select max(num) from board");
			rs = pstmt.executeQuery();
			if (rs.next()) 
				number=rs.getInt(1)+1;	
			else
				number=1; 
			if (num!=0) 
			{                          // �ֱٱ��� 1.            where ref= 14 and re_step > 0
				sql="update board set re_step=re_step+1 where ref= ? and re_step> ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);      //��� 
				pstmt.setInt(2, re_step);   //��� 
				pstmt.executeUpdate();
				re_step=re_step+1;      
				re_level=re_level+1;    
			}else{      //���� �ۼ� 
				ref=number;
				re_step=0;
				re_level=0;
			}
 
			sql = "insert into board(num,writer,email,subject,passwd,reg_date,";
			sql+="ref,re_step,re_level,content,ip) values(board_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
	}
	
	// ��ü board ���̺��� ���ڵ� �� ����!! 
	public int getArticleCount() throws Exception {
		int x=0;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select count(*) from board"); //count-���� (�Խñ���)
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
	
	
	//mylist �߰� 
	public int getArticleCount(String id) throws Exception {
		int x=0;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement("select count(*) from board where writer=?"); 
			pstmt.setString(1, id);
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
	
	// 5�� ..
	public int getArticleCount(String col, String search ) throws Exception {
		int x=0;
		try {
			conn = ConnectionDAO.getConnection();
			String sql ="select count(*) from board where " +col+" like '%"+search+"%'";
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
	
	
	

	   // ��ø select �� 
	public List getArticles(int start, int end) throws Exception {
		List articleList=null;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
					"select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,r "+
					"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r " +
					"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount " +
					"from board order by ref desc, re_step asc) order by ref desc, re_step asc ) where r >= ? and r <= ? ");
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
	
	
	
	//mylist �߰� 
	public List getArticles(String id, int start, int end) throws Exception {
		List articleList=null;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
					"select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,r "+
					"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r " +
					"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r " +
					"from board where writer=? order by reg_date desc) order by reg_date desc ) where r >= ? and r <= ? ");
					pstmt.setString(1, id);                          // ����ǥ 3��.. 
					pstmt.setInt(2, start);                          
					pstmt.setInt(3, end); 

					
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
	
	//5 �˻� ��� 
	public List getArticles(String col, String search, int start, int end) throws Exception {
		List articleList=null;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
					"select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,r "+
					"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r " +
					"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r " +
					"from board  where " +col+" like '%"+search+"%' order by reg_date desc) order by reg_date desc ) where r >= ? and r <= ? ");
					pstmt.setInt(1, start);                          
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
	
	
	
	
	public BoardDataBean getArticle(int num) throws Exception {
		BoardDataBean article=null;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
			"update board set readcount=readcount+1 where num = ?"); 
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(
			"select * from board where num = ?"); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new BoardDataBean();
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
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		
		return article;
	}
	
	
	public BoardDataBean updateGetArticle(int num) throws Exception {
		BoardDataBean article=null;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
			"select * from board where num = ?"); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new BoardDataBean();
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
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}

		return article;
	}
	

	public int updateArticle(BoardDataBean article) throws Exception {
		String dbpasswd="";
		String sql="";
		int x=-1;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
			"select passwd from board where num = ?");
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			if(rs.next()){
				dbpasswd= rs.getString("passwd"); 
				if(dbpasswd.equals(article.getPasswd())){
					sql="update board set writer=?,email=?,subject=?,passwd=?";
					sql+=",content=? where num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getEmail());
					pstmt.setString(3, article.getSubject());
					pstmt.setString(4, article.getPasswd());
					pstmt.setString(5, article.getContent());
					pstmt.setInt(6, article.getNum());
					pstmt.executeUpdate();
					x= 1;
				}else{
					x= 0;
				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return x;
	}
	

	public int deleteArticle(int num, String passwd) throws Exception {
		String dbpasswd="";
		int x=-1;
		try {
			conn = ConnectionDAO.getConnection();
			pstmt = conn.prepareStatement(
			"select passwd from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dbpasswd= rs.getString("passwd");
				if(dbpasswd.equals(passwd)){
					pstmt = conn.prepareStatement("delete from board where num=?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x= 1; 
				}else
					x= 0; 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionDAO.close(rs, pstmt, conn);
		}
		return x;
	}



//6 ��б� �����   deleteArticle �� ���� �Ȱ��� 
public int passwdCheck(int num, String passwd) throws Exception {
	String dbpasswd="";
	int x=-1;   // �۹�ȣ �߸��Ǿ���. 
	try {
		conn = ConnectionDAO.getConnection();
		pstmt = conn.prepareStatement(
		"select passwd from board where num = ?");
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		if(rs.next()){
			dbpasswd= rs.getString("passwd");
			if(dbpasswd.equals(passwd)){
				x= 1;    // �۹�ȣ�� ��й�ȣȮ�� 
			}else
				x= 0;  // ��й�ȣ Ʋ�ȴ�.
		}
	} catch(Exception ex) {
		ex.printStackTrace();
	} finally {
		ConnectionDAO.close(rs, pstmt, conn);
	}
	return x;
}
}
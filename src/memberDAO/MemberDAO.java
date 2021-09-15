package memberDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBConn.DBConn;
import memberVO.MemberVO;



public class MemberDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public MemberDAO() throws ClassNotFoundException, SQLException{
		con=new DBConn().getConnection(); 
	}
	
	public void pstmtClose() throws SQLException {
		if(pstmt != null) {
			pstmt.close();
		}
	}
	public MemberVO getInfo(String email1) throws SQLException{
		MemberVO member=null;
		
		String sql="select * from kajamember where mail1=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, email1);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			
			String firstname=rs.getString("firstname");
			String lastname=rs.getString("lastname");
			String tel=rs.getString("tel");
			String mail1=rs.getString("mail1");
			String mail2=rs.getString("mail2");
			String pwd =rs.getString("pwd");
			int memnum=rs.getInt("memnum");
			member=new MemberVO(firstname, lastname, mail1, mail2, tel, pwd, memnum);
			
		}else {
			member=null;
		}
		return member;
	}
	public MemberVO getInfoMemnum(int memNum) throws SQLException{
		MemberVO member=null;
		
		String sql="SELECT * FROM kajamember where memnum=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, memNum);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			int memnum=rs.getInt("memnum");
			String firstname=rs.getString("firstname");
			String lastname=rs.getString("lastname");
			String tel=rs.getString("tel");
			String mail1=rs.getString("mail1");
			String mail2=rs.getString("mail2");
			String pwd =rs.getString("pwd");
			
			member=new MemberVO(firstname, lastname, mail1, mail2, tel, pwd, memnum);
			
		}else {
			member=null;
		}
		return member;
	}
	
	public ArrayList<MemberVO> getAllMemberInfo() throws SQLException{
		ArrayList<MemberVO> marray =new ArrayList<MemberVO>();
		String sql ="SELECT * FROM kajamember order by memnum";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			int memnum=rs.getInt("memnunm");
			String firstname=rs.getString("firstname");
			String lastname=rs.getString("lastname");
			String tel=rs.getString("tel");
			String mail1=rs.getString("mail1");
			String mail2=rs.getString("mail2");
			
			String pwd =rs.getString("pwd");
					
			MemberVO mvo =new MemberVO(firstname, lastname,mail1,mail2, tel, pwd, memnum);
			marray.add(mvo);
		}
		return marray;
		
	}
	//회원 입력
	public boolean insertMember(String firstname,String lastname,String tel,String email1,String email2,String pwd) {
		String sql="INSERT into kajamember (firstname,lastname,tel,mail1,mail2,pwd) values(?,?,?,?,?,?)";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, firstname);
			pstmt.setString(2, lastname);
			pstmt.setString(3, tel);
			pstmt.setString(4, email1);
			pstmt.setString(5, email2);
			pstmt.setString(6, pwd);
			
			pstmt.executeLargeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("member insert error");
			return false;
		}
		return true;
	}
	
	
	public boolean CheckValidLogin(String mail1,String mail2,String inputpwd) throws SQLException {
		String correctpwd="";
		String email2="";
		String sql ="select * from kajamember where mail1=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,mail1);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			String email1=rs.getString("MAIL1");
			email2=rs.getString("MAIL2");
			 correctpwd =rs.getString("PWD");
		}
		if(email2.equals(mail2) && correctpwd.equals(inputpwd)) {
			return true;			
		}
		else
			return false;
		
	}

}

package bkinfoDAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBConn.DBConn;
import bkinfoVO.bkInfoVO;



public class bkInfoDAO {

	private Connection con;			

	PreparedStatement pstmt=null;
	ResultSet rs=null;			


	public bkInfoDAO() throws ClassNotFoundException, SQLException {
		con=new DBConn().getConnection(); 
		
	} 

	public void pstmtClose() throws SQLException {
		if(pstmt != null) 
			pstmt.close();
	}
	//예약 입력하기
	public boolean insertBkInfo(String chkin, String chkout, String rmtype, String tel, 
								int headcnt,String firstname ,String lastname, int memnum) {
		String sql="INSERT into reservation (CHKIN,CHKOUT,RMTYPE,TEL,HEADCNT,FIRSTNAME,LASTNAME,memnum) values(TO_DATE(?,'YYYY-MM-DD'),TO_DATE(?,'YYYY-MM-DD'),?,?,?,?,?,?)";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, chkin);
			pstmt.setString(2, chkout);
			pstmt.setString(3, rmtype);
			pstmt.setString(4, tel);
			pstmt.setInt(5, headcnt);
			pstmt.setString(6, firstname);
			pstmt.setString(7, lastname);
			pstmt.setInt(8, memnum);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("insert error!!!!");
			return false;
			
		}
		
		return true;
	}
	//예약변경을 위한 예약 정보 불러오기
	public bkInfoVO getInfo(int bkNum2) throws SQLException{
		String sql="SELECT * FROM reservation WHERE BKNUM=?";
		bkInfoVO bk=null;
		
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, bkNum2);
		rs= pstmt.executeQuery();
		if(rs.next()) {
			int bkNum=rs.getInt("BKNUM");
			Date chk_inNum=rs.getDate("CHKIN");
			Date chk_outNum=rs.getDate("CHKOUT");
			String room_type=rs.getString("RMTYPE");
			String bkFName=rs.getString("FIRSTNAME");
			String bkLName=rs.getString("LASTNAME");
			int head_cnt=rs.getInt("HEADCNT");
			String tel=rs.getString("TEL");
			int mem_num=rs.getInt("MEMNUM");
			
			bk=new bkInfoVO(bkNum, chk_inNum, chk_outNum, room_type, bkFName, bkLName, head_cnt, tel, mem_num);
		}else {
			bk=null;
		}
		return bk;
	}
	
	
	//회원번호로 예약한 내역 전체보기
	public ArrayList<bkInfoVO> getAllInfo(int memNum)			
			throws SQLException{
		
		String sql = "SELECT * FROM reservation where MEMNUM=? ORDER BY BKNUM DESC";	
		ArrayList<bkInfoVO> blist=new ArrayList<bkInfoVO>();
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, memNum);
		rs = pstmt.executeQuery();
		while(rs.next()){	
			int bkNum=rs.getInt("BKNUM");
			Date chk_inNum=rs.getDate("CHKIN");
			Date chk_outNum=rs.getDate("CHKOUT");
			String room_type=rs.getString("RMTYPE");
			String bkFName=rs.getString("FIRSTNAME");
			String bkLName=rs.getString("LASTNAME");
			int head_cnt=rs.getInt("HEADCNT");
			String tel=rs.getString("TEL");
			int mem_num=rs.getInt("MEMNUM");
			
			bkInfoVO bk=new bkInfoVO(bkNum, chk_inNum, chk_outNum, room_type, bkFName, bkLName, head_cnt, tel, mem_num);
			blist.add(bk);
		}
		return blist;		
	}
	//예약지우기
	public boolean delBk(String BKNUM) {
		String sql="delete from reservation where BKNUM=?";
		int bk_num=Integer.parseInt(BKNUM);
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bk_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("delete error!!!");
			return false;
		}
		
		return true;
	}

	//예약 수정
	public boolean updateBk(String chkin,String chkout,String rmtype,int headcnt,String bknum2) throws SQLException {
		String sql="update reservation set CHKIN=TO_DATE(?,'YYYY-MM-DD'),CHKOUT=TO_DATE(?,'YYYY-MM-DD'),RMTYPE=?,HEADCNT=? WHERE BKNUM=?";
		int bknum=Integer.parseInt(bknum2);
		
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(5, bknum);
		pstmt.setString(1, chkin);
		pstmt.setString(2, chkout);
		pstmt.setString(3, rmtype);
		pstmt.setInt(4, headcnt);
		pstmt.executeUpdate();
		
		return true;
	}
}
package dao;

import java.sql.*;
import java.util.*;
import java.text.*;

import common.*;
import dto.Qanda_DTO;

public class Qanda_DAO {
	
	DBConnectionOracle common = new DBConnectionOracle();
	Connection          con = null;
	PreparedStatement   ps  = null;
	ResultSet 			rs  = null;	


public ArrayList<Qanda_DTO> getQandaList(){
				
				
		ArrayList<Qanda_DTO> dtos = new ArrayList<Qanda_DTO>();
		 
		String query= "select Qna_no ,Title, Content,Reg_id,	Qna_date,Reply,Reply_id,Reply_date, "
				+" decode(checked_answer , 'n' , '답변대기', 'y' , '답변완료' ) from TRACK2_3조_WEB_QANDA   order by Qna_no desc" ;
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String Qanda_no = rs.getString(1);
				
				String Title = rs.getString(2);
				String Content = rs.getString(3);
				String Reg_id = rs.getString(4);
				String Qna_date = rs.getString(5);
				
				String Reply = rs.getString(6);
				String Reply_id = rs.getString(7);
				String Reply_date = rs.getString(8);
				String Checked_answer = rs.getString(9);
			
				Qanda_DTO dto = new Qanda_DTO(Qanda_no ,Title, Content,Reg_id,	
				Qna_date,Reply,Reply_id,Reply_date, Checked_answer);
				dtos.add(dto);						
			}
			}catch(SQLException se) {
			System.out.println("SQLException getQandaList():"+se.getMessage());
			}catch(Exception e){
			System.out.println("Exception getQandaList():"+e.getMessage());
			}finally{
			try{ 
				common.close(con,ps,rs);
			}catch(Exception e){
				System.out.println("getQandaList() close" + e.getMessage());
			}
		}						
		return dtos;
	}	
	////////////////////////////////////////////////

	//qna 질문쓰기
	public int insertQanda(String qanda_no ,String title,
		String content,String reg_id,String qna_date){
		int result =0;
		String query =" insert into TRACK2_3조_WEB_QANDA "+
			" (qna_no, title, content, reg_id, qna_date) "+
			" values "+
			" ('"+qanda_no+"','"+title+"','"+content+"','"+reg_id+"','"+qna_date+"') ";	
	 
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException se) {
			System.out.println("SQLException insertNotice():"+se.getMessage());
		}catch(Exception e){
			System.out.println("Exception insertNotice():"+e.getMessage());
		}finally{
			try{
				common.close(con,ps,rs);
			}catch(Exception e){
				System.out.println("insertNotice() close" + e.getMessage());
			}
		}			
		return result;
	}	
	
	//게시판 글 삭제
	public int deleteQanda(String Qanda_no)
	{
		int result =0;
		String query =" delete from TRACK2_3조_WEB_QANDA  where Qna_no ='"+Qanda_no+"' ";
		try{
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
			
		}catch(SQLException se) {
			System.out.println("SQLException insertQanda():"+se.getMessage());
		}catch(Exception e){
			System.out.println("Exception insertQanda():"+e.getMessage());
		}finally{
			try{
				common.close(con,ps,rs);
			}catch(Exception e){
				System.out.println("insertQanda() close" + e.getMessage());
			}
		}
		return result;
	}
	
		
	//상세조회
	public Qanda_DTO getQandaView(String qna_no){
	
	Qanda_DTO dto =null;
	String query= "select Qna_no ,Title, Content,Reg_id,	Qna_date,Reply,Reply_id,Reply_date, "
				+" decode(checked_answer , 'n' , '답변대기', 'y' , '답변완료' ) from TRACK2_3조_WEB_QANDA "
				+"where qna_no = '"+qna_no+"' ";
				
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String Qanda_no = rs.getString(1);
				
				String Title = rs.getString(2);
				String Content = rs.getString(3);
				String Reg_id = rs.getString(4);
				String Qna_date = rs.getString(5);
				
				String Reply = rs.getString(6);
				String Reply_id = rs.getString(7);
				String Reply_date = rs.getString(8);
				String Checked_answer = rs.getString(9);
			
				  dto = new Qanda_DTO(Qanda_no ,Title, Content,Reg_id,	
				Qna_date,Reply,Reply_id,Reply_date, Checked_answer);
				 					
			}
			}catch(SQLException se) {
			System.out.println("SQLException getQandaList():"+se.getMessage());
			}catch(Exception e){
			System.out.println("Exception getQandaList():"+e.getMessage());
			}finally{
			try{ 
				common.close(con,ps,rs);
			}catch(Exception e){
				System.out.println("getQandaList() close" + e.getMessage());
			}
		}						
		return dto;
	}	
	
	
	//게시판 글 수정
	public int updateQanda(String qanda_no,String title,String content, String reg_id, String qna_date )
	{
		int result =0;
		String query =" update TRACK2_3조_WEB_QANDA set title='"+title+"' ,content = '"+content+"' "
		+" , reg_id = '"+reg_id+"', qna_date ='"+qna_date+"'   "
		+" where QNA_NO = '"+qanda_no+"' and CHECKED_ANSWER ='n' ";
		
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
			
		}catch(SQLException se) {
			System.out.println("SQLException insertQanda():"+se.getMessage());
		}catch(Exception e){
			System.out.println("Exception insertQanda():"+e.getMessage());
		}finally{
			try{
				common.close(con,ps,rs);
			}catch(Exception e){
				System.out.println("insertQanda() close" + e.getMessage());
			}
		}			
		return result;
	}
	
	
		
		//질문에 답변 달아주기
		public int reflyInsertQanda(String qanda_no ,String reply,
		String reply_id,String reply_date,String checked_answer){
		int result =0;
	
		String query =" update TRACK2_3조_WEB_QANDA set REPLY='"+reply+"' ,REPLY_ID = '"+reply_id+"' "
		+" , REPLY_DATE = '"+reply_date+"', CHECKED_ANSWER ='"+checked_answer+"'   "
		+" where QNA_NO = '"+qanda_no+"' and CHECKED_ANSWER ='n' ";
		
	
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException se) {
			System.out.println("SQLException insertNotice():"+se.getMessage());
		}catch(Exception e){
			System.out.println("Exception insertNotice():"+e.getMessage());
		}finally{
			try{
				common.close(con,ps,rs);
			}catch(Exception e){
				System.out.println("insertNotice() close" + e.getMessage());
			}
		}			
		return result;
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String getMaxNo(){
		String query = " select max(QNA_NO) "+
						" from TRACK2_3조_WEB_QANDA ";
		String result = null;
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				result = rs.getString(1);
			}
		}catch(SQLException se) {
			System.out.println("SQLException getMaxNo():"+se.getMessage());
		}catch(Exception e){
			System.out.println("Exception getMaxNo():"+e.getMessage());
		}finally{
			try{
				common.close(con,ps,rs);
			}catch(Exception e){
				System.out.println("getMaxNo() close" + e.getMessage());
			}
		}			
		return result;
	}
	
	public String getQandaNo() {
		
		String QandaNo = getMaxNo();
		// String QandaNo ="19-0001";
		
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        
        String nowYear = Integer.toString(year);
        nowYear = nowYear.substring(2,4); 
        
        if(QandaNo == null) {
        	QandaNo = nowYear +"_0001";
        } else {	
	        String dataYear = QandaNo.substring(0, 2); 
	        
	        if(nowYear.equals(dataYear)) {
	        	int y = Integer.parseInt(QandaNo.substring(3)); 
	        	y++; 
	        	String r = CommonUtil.getLPad(Integer.toString(y), 4, "0");
	        	QandaNo = dataYear +"_"+ r;
	        } else {
	        	QandaNo = nowYear +"_0001";
	        }
        }    

		return QandaNo;
	}

}





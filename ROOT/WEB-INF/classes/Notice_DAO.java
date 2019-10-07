package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import common.*;
import dto.Notice_DTO;

public class Notice_DAO {
	DBConnectionOracle common = new DBConnectionOracle();
	Connection          con = null;
	PreparedStatement   ps  = null;
	ResultSet 			rs  = null;	
	
	//게시판 글 삭제
	public int deleteNotice(String notice_no)
	{
		int result =0;
		String query =" delete from a18_track2_web_notice  where notice_no ='"+notice_no+"' ";
		try{
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
	
	//게시판 글 수정
	public int updateNotice(String notice_no,String title,String content, String reg_id, String reg_date )
	{
		int result =0;
		String query =" update a18_track2_web_notice set title='"+title+"' ,content = '"+content+"' "
		+" , reg_id = '"+reg_id+"', reg_date ='"+reg_date+"'  where notice_no = '"+notice_no+"' ";
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
	//조회수 증가
	public int noticeHit(String noti_no){
		int result=0;
		String query =" update a18_track2_web_notice set hit = hit+1 "+
					  " where notice_no ='"+noti_no+"'";
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException se) {
			System.out.println("SQLException noticeHit():"+se.getMessage());
		}catch(Exception e){
			System.out.println("Exception noticeHit():"+e.getMessage());
		}finally{
			try{
				common.close(con,ps,rs);
			}catch(Exception e){
				System.out.println("noticeHit() close" + e.getMessage());
			}
		}
		return result;
	}	
	
	//상세조회
	public Notice_DTO getNoticeView(String noti_no){
		Notice_DTO dto = null;
		String query =" select notice_no, title, content, file_name_1, "+
						" reg_id, to_char(reg_date,'yy-MM-dd'), hit "+
						" from a18_track2_web_notice "+
						" where notice_no ='"+noti_no+"'";
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String notice_no = rs.getString(1);
				String title 	 = rs.getString(2);
				String content   = rs.getString(3);
				String file_name_1 = rs.getString(4);
				String reg_id    = rs.getString(5);
				String reg_date  = rs.getString(6);
				int hit          = rs.getInt(7);
				dto = new Notice_DTO(notice_no,title,content,file_name_1,
					   reg_id,reg_date,hit);
			}
		}catch(SQLException se) {
			System.out.println("SQLException getNoticeList():"+se.getMessage());
		}catch(Exception e){
			System.out.println("Exception getNoticeList():"+e.getMessage());
		}finally{
			try{
				common.close(con,ps,rs);
			}catch(Exception e){
				System.out.println("getNoticeList() close" + e.getMessage());
			}
		}	
		return dto;
	}	
	
	// 목록조회
	public ArrayList<Notice_DTO> 
			getNoticeList(String selValue,String txtValue){
				
		ArrayList<Notice_DTO> dtos = new ArrayList<Notice_DTO>();
		String query =" select notice_no, title, content, file_name_1, "+
						" reg_id, to_char(reg_date,'yy-MM-dd'), hit "+
						" from a18_track2_web_notice "+
						" where "+selValue+" like '%"+txtValue+"%' "+
						" order by notice_no desc";
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String notice_no = rs.getString(1);
				String title 	 = rs.getString(2);
				String content   = rs.getString(3);
				String file_name_1 = rs.getString(4);
				String reg_id    = rs.getString(5);
				String reg_date  = rs.getString(6);
				int hit          = rs.getInt(7);
				Notice_DTO dto = 
						new Notice_DTO(notice_no,title,content,file_name_1,
						   			   reg_id,reg_date,hit);
				dtos.add(dto);						
			}
		}catch(SQLException se) {
			System.out.println("SQLException getNoticeList():"+se.getMessage());
		}catch(Exception e){
			System.out.println("Exception getNoticeList():"+e.getMessage());
		}finally{
			try{
				common.close(con,ps,rs);
			}catch(Exception e){
				System.out.println("getNoticeList() close" + e.getMessage());
			}
		}						
		
		return dtos;
	}	
	
	
	// 공지사항 등록
	public int insertNotice(Notice_DTO dto){
		int result =0;
		String query =" insert into a18_track2_web_notice "+
			" (notice_no, title, content, reg_id, reg_date) "+
			" values "+
			" ('"+dto.getNotice_no()+"','"+dto.getTitle()+"','"+dto.getContent()+"','"+dto.getReg_id()+"','"+dto.getReg_date()+"')";	

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
	
	// 공지사항 등록
	public int insertNotice(String notice_no,String title,
		String content,String reg_id,String reg_date){
		int result =0;
		String query =" insert into a18_track2_web_notice "+
			" (notice_no, title, content, reg_id, reg_date) "+
			" values "+
			" ('"+notice_no+"','"+title+"','"+content+"','"+reg_id+"','"+reg_date+"')";	

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
	
	
	String getMaxNo(){
		String query = " select max(notice_no) "+
						" from a18_track2_web_notice ";
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
	
	public String getNoticeNo() {
		String noticeNo = getMaxNo();
//		String noticeNo ="19-0001";
		
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        
        String nowYear = Integer.toString(year);
        nowYear = nowYear.substring(2,4); 
        
        if(noticeNo == null) {
        	noticeNo = nowYear +"_0001";
        } else {	
	        String dataYear = noticeNo.substring(0, 2); 
	        
	        if(nowYear.equals(dataYear)) {
	        	int y = Integer.parseInt(noticeNo.substring(3)); 
	        	y++; 
	        	String r = CommonUtil.getLPad(Integer.toString(y), 4, "0");
	        	noticeNo = dataYear +"_"+ r;
	        } else {
	        	noticeNo = nowYear +"_0001";
	        }
        }    

		return noticeNo;
	}

	
}







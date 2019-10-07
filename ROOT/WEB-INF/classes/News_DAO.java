package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import common.*;
import dto.News_DTO;

public class News_DAO {
	DBConnectionOracle common = new DBConnectionOracle();
	Connection          con = null;
	PreparedStatement   ps  = null;
	ResultSet 			rs  = null;	
	
		//게시판 글 삭제
	public int deleteNews(String news_no)
	{
		int result =0;
		String query =" delete from a18_track2_web_news  where news_no ='"+news_no+"' ";
		try{
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException se) {
			System.out.println("SQLException insertNews():"+se.getMessage());
		}catch(Exception e){
			System.out.println("Exception insertNews():"+e.getMessage());
		}finally{
			try{
				common.close(con,ps,rs);
			}catch(Exception e){
				System.out.println("insertNews() close" + e.getMessage());
			}
		}			
		return result;
	}
	
	//게시판 글 수정
	public int updateNews(String news_no,String title,String content, String reg_id, String reg_date )
	{
		int result =0;
		String query =" update a18_track2_web_news set title='"+title+"' ,content = '"+content+"' "
		+" , reg_id = '"+reg_id+"', reg_date ='"+reg_date+"'  where news_no = '"+news_no+"' ";
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException se) {
			System.out.println("SQLException insertNews():"+se.getMessage());
		}catch(Exception e){
			System.out.println("Exception insertNews():"+e.getMessage());
		}finally{
			try{
				common.close(con,ps,rs);
			}catch(Exception e){
				System.out.println("insertNews() close" + e.getMessage());
			}
		}			
		return result;
	}
	//조회수 증가
	public int NewsHit(String noti_no){
		int result=0;
		String query =" update a18_track2_web_news set hit = hit+1 "+
					  " where news_no ='"+noti_no+"'";
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException se) {
			System.out.println("SQLException NewsHit():"+se.getMessage());
		}catch(Exception e){
			System.out.println("Exception NewsHit():"+e.getMessage());
		}finally{
			try{
				common.close(con,ps,rs);
			}catch(Exception e){
				System.out.println("NewsHit() close" + e.getMessage());
			}
		}
		return result;
	}	
	
	//상세조회
	public News_DTO getNewsView(String noti_no){
		News_DTO dto = null;
		String query =" select News_no, title, content,  "+
						" reg_id, to_char(reg_date,'yy-MM-dd'), hit "+
						" from a18_track2_web_news "+
						" where news_no ='"+noti_no+"'";
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String News_no = rs.getString(1);
				String title 	 = rs.getString(2);
				String content   = rs.getString(3);
				
				String reg_id    = rs.getString(4);
				String reg_date  = rs.getString(5);
				int hit          = rs.getInt(6);
				dto = new News_DTO(News_no,title,content,
					   reg_id,reg_date,hit);
			}
		}catch(SQLException se) {
			System.out.println("SQLException getNewsList():"+se.getMessage());
		}catch(Exception e){
			System.out.println("Exception getNewsList():"+e.getMessage());
		}finally{
			try{
				common.close(con,ps,rs);
			}catch(Exception e){
				System.out.println("getNewsList() close" + e.getMessage());
			}
		}	
		return dto;
	}	
	
	// 목록조회
	public ArrayList<News_DTO> 
			getNewsList(String selValue,String txtValue){
				
		ArrayList<News_DTO> dtos = new ArrayList<News_DTO>();
		String query =" select News_no, title, content , "+
						" reg_id, to_char(reg_date,'yy-MM-dd'), hit "+
						" from a18_track2_web_news "+
						" where "+selValue+" like '%"+txtValue+"%' "+
						" order by news_no desc";
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String news_no = rs.getString(1);
				String title 	 = rs.getString(2);
				String content   = rs.getString(3);
			
				String reg_id    = rs.getString(4);
				String reg_date  = rs.getString(5);
				int hit          = rs.getInt(6);
				News_DTO dto = 
						new News_DTO(news_no,title,content,
						   			   reg_id,reg_date,hit);
				dtos.add(dto);						
			}
		}catch(SQLException se) {
			System.out.println("SQLException getNewsList():"+se.getMessage());
		}catch(Exception e){
			System.out.println("Exception getNewsList():"+e.getMessage());
		}finally{
			try{
				common.close(con,ps,rs);
			}catch(Exception e){
				System.out.println("getNewsList() close" + e.getMessage());
			}
		}						
		
		return dtos;
	}	
	
	
	// 공지사항 등록
	public int insertNews(News_DTO dto){
		int result =0;
		String query =" insert into a18_track2_web_news "+
			" (News_no, title, content, reg_id, reg_date) "+
			" values "+
			" ('"+dto.getNews_no()+"','"+dto.getTitle()+"','"+dto.getContent()+"','"+dto.getReg_id()+"','"+dto.getReg_date()+"')";	

		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException se) {
			System.out.println("SQLException insertNews():"+se.getMessage());
		}catch(Exception e){
			System.out.println("Exception insertNews():"+e.getMessage());
		}finally{
			try{
				common.close(con,ps,rs);
			}catch(Exception e){
				System.out.println("insertNews() close" + e.getMessage());
			}
		}			
		return result;
	}	
	
	// 공지사항 등록
	public int insertNews(String news_no,String title,
		String content,String reg_id,String reg_date){
		int result =0;
		String query =" insert into a18_track2_web_news "+
			" (News_no, title, content, reg_id, reg_date) "+
			" values "+
			" ('"+news_no+"','"+title+"','"+content+"','"+reg_id+"','"+reg_date+"')";	

		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException se) {
			System.out.println("SQLException insertNews():"+se.getMessage());
		}catch(Exception e){
			System.out.println("Exception insertNews():"+e.getMessage());
		}finally{
			try{
				common.close(con,ps,rs);
			}catch(Exception e){
				System.out.println("insertNews() close" + e.getMessage());
			}
		}			
		return result;
	}	
	
	
	String getMaxNo(){
		String query = " select max(News_no) "+
						" from a18_track2_web_news ";
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
	
	public String getNewsNo() {
		String newsNo = getMaxNo();
//		String NewsNo ="19-0001";
		
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        
        String nowYear = Integer.toString(year);
        nowYear = nowYear.substring(2,4); 
        
        if(newsNo == null) {
        	newsNo = nowYear +"_0001";
        } else {	
	        String dataYear = newsNo.substring(0, 2); 
	        
	        if(nowYear.equals(dataYear)) {
	        	int y = Integer.parseInt(newsNo.substring(3)); 
	        	y++; 
	        	String r = CommonUtil.getLPad(Integer.toString(y), 4, "0");
	        	newsNo = dataYear +"_"+ r;
	        } else {
	        	newsNo = nowYear +"_0001";
	        }
        }    

		return newsNo;
	}

	
}







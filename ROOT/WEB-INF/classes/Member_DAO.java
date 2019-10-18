package dao;
import java.sql.*;
import java.util.*;

import common.*;
import dto.Member_DTO;

public class Member_DAO {
	
	DBConnectionOracle common = new DBConnectionOracle();
	Connection          con = null;
	PreparedStatement   ps  = null;
	ResultSet 			rs  = null;	
	

	
	
	//id 중복 검사
	public String getCheckCount(String id)
	{
		String result="";
		String query = "select count(*) from a18_track2_web_member "
					  +" where id= '"+id+"'  " ;
		
		try{
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				result = rs.getString(1);
			}
		}
		catch(SQLException e)
		{
			System.out.print(e+" : Member_DAO getCheckCount -> SQLException err");
		}
		catch(Exception e)
		{
			System.out.print(e+" : Member_DAO getCheckCount -> Exception err");	
		}
		finally
		{
			try{
				common.close(con ,ps , rs);
			}
			catch(Exception e)
			{
				System.out.print("close 하는데 에러가 뜰수있음 db 문제로");
			}
		}
		
		return result;
	}
	
	//회원 가입 하기
	public int insertMember(String id, String pw, String name, String birth, String area, String address , 
	String telecom , String phone_1 , String phone_2  , String phone_3 , String email_1 , String email_2 ,
	String att_desk , String att_note , String att_print , String att_beam , String reg_date , String status )
	{
	int result=0;
	String query = "insert into a18_track2_web_member(id, pw, name, birth, area, address , telecom , phone_1 , "
	+" phone_2 , phone_3 , email_1 , email_2 ,att_desk , att_note , att_print , att_beam , reg_date , status)  "
	+" values('"+id+"','"+pw+"','"+name+"','"+birth+"','"+area+"','"+address+"','"+telecom+"','"+phone_1+"', "
	+" '"+phone_2+"','"+phone_3+"','"+email_1+"','"+email_2+"','"+att_desk+"','"+att_note+"','"+att_print+"', "
	+" '"+att_beam+"','"+reg_date+"', '"+status+"') ";
		
		try{
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
			
		}
		catch(SQLException e)
		{
			System.out.print(e+" : Member_DAO getCheckCount -> SQLException err");
		}
		catch(Exception e)
		{
			System.out.print(e+" : Member_DAO getCheckCount -> Exception err");	
		}
		finally
		{
			try{
				common.close(con ,ps , rs);
			}
			catch(Exception e)
			{
				System.out.print("close 하는데 에러가 뜰수있음 db 문제로");
			}
		}
		
		return result;
	}
	

	//정보 수정 
	public int updateMember(String id , String name, String birth, String area, String address , 
	String telecom , String phone_1 , String phone_2  , String phone_3 , String email_1 , String email_2 ,
	String att_desk , String att_note , String att_print , String att_beam , String update_date , String status)
	{
	int result=0;
	String query = " update a18_track2_web_member set ID ='"+id+"' , NAME ='"+name+"'  , BIRTH ='"+birth+"'  , AREA ='"+area+"' , ADDRESS ='"+address+"' , TELECOM ='"+telecom+"' "
			+ ", PHONE_1= '"+phone_1+"'  ,PHONE_2 ='"+phone_2+"'  ,PHONE_3 ='"+phone_3+"'  , EMAIL_1 ='"+email_1+"'  , EMAIL_2 ='"+email_2+"'  , ATT_DESK ='"+ att_desk+"'  , "
			+" ATT_NOTE='"+att_note+"'  , ATT_PRINT='"+att_print+"'  , ATT_BEAM ='"+att_beam+"'  , update_date='"+update_date+"'  "
			+" where id ='"+id+"'  and status = '"+status+"' ";
		
		try{
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
			
		}
		catch(SQLException e)
		{
			System.out.print(e+" : Member_DAO getCheckCount -> SQLException err");
		}
		catch(Exception e)
		{
			System.out.print(e+" : Member_DAO getCheckCount -> Exception err");	
		}
		finally
		{
			try{
				common.close(con ,ps , rs);
			}
			catch(Exception e)
			{
				System.out.print("close 하는데 에러가 뜰수있음 db 문제로");
			}
		}
		
		return result;
	}
	
	
	
	
	//회원 탈퇴 
	public int deleteMember(String id)
	{
	int result=0;
	String query = " delete from a18_track2_web_member "
			+" where id ='"+id+"' ";
		
		try{
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
			
		}
		catch(SQLException e)
		{
			System.out.print(e+" : Member_DAO getCheckCount -> SQLException err");
		}
		catch(Exception e)
		{
			System.out.print(e+" : Member_DAO getCheckCount -> Exception err");	
		}
		finally
		{
			try{
				common.close(con ,ps , rs);
			}
			catch(Exception e)
			{
				System.out.print("close 하는데 에러가 뜰수있음 db 문제로");
			}
		}
		
		return result;
	}
	
	
	
	// 로그인 체크하기 이름받기
	public String checkLogin(String id , String pw)
	{
		String result= null;
		String query = "select name from a18_track2_web_member where id='"+id+"' and pw = '"+pw+"' and status= 'y' ";
	
		
		try{
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next())
			{
				result = rs.getString(1);
			
			}
		}
		catch(SQLException e)
		{
			System.out.print(e+" : Member_DAO getCheckCount -> SQLException err");
		}
		catch(Exception e)
		{
			System.out.print(e+" : Member_DAO getCheckCount -> Exception err");	
		}
		finally
		{
			try{
				common.close(con ,ps , rs);
			}
			catch(Exception e)
			{
				System.out.print("close 하는데 에러가 뜰수있음 db 문제로");
			}
		}
		
		return result;
	}
	
	//멤버업데이트 불러오기
	public Member_DTO getMemberInfo(String member_id){
				
		Member_DTO dto = null;
		String query = "select ID, PW, NAME,BIRTH, AREA, ADDRESS,TELECOM,PHONE_1,PHONE_2,PHONE_3,EMAIL_1, "
					  +" EMAIL_2,ATT_DESK,ATT_NOTE,ATT_PRINT,ATT_BEAM , reg_date ,update_date, status from a18_track2_web_member "
					  +" where id = '"+member_id+"' ";
		

	try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();

			while(rs.next()) {
				String id		 = rs.getString(1);
				String pw  		 = rs.getString(2);
				String name  	 = rs.getString(3);
				String birth	 = rs.getString(4);
				String area 	 = rs.getString(5);
				String address   = rs.getString(6);
				String telecom   = rs.getString(7);
				String phone_1   = rs.getString(8);
				String phone_2   = rs.getString(9);
				String phone_3   = rs.getString(10);
				String email_1   = rs.getString(11);
				String email_2   = rs.getString(12);
				String att_desk  = rs.getString(13);
				String att_note  = rs.getString(14);
				String att_print = rs.getString(15);
				String att_beam  = rs.getString(16);
				String reg_date  = rs.getString(17);
				String update_date = rs.getString(18);
				String status 	 = rs.getString(19);
			
				dto	= new Member_DTO(id,pw,name,birth,area,address,telecom,phone_1,
						phone_2,phone_3,email_1,email_2,att_desk,att_note,att_print,att_beam ,"" ,"", "");
					
			}
				
		}catch(SQLException se) {
			System.out.println("SQLException getMemberList():"+se.getMessage());
		}catch(Exception e){
			System.out.println("Exception getMemberList():"+e.getMessage());
		}finally{
			try{
				common.close(con,ps,rs);
			}catch(Exception e){
				System.out.println("getMemberList() close" + e.getMessage());
			}
		}						
		
		return dto;
	}	
	
	

	
}





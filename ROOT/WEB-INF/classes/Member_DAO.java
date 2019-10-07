package dao;
import java.sql.*;
import java.util.*;

import common.*;
//import dto.News_DTO;

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
}







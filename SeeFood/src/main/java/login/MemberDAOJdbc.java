package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAOJdbc implements MemberDAO {
	
	public DataSource datasource;
	public MemberDAOJdbc() {
		try {
			InitialContext context=new InitialContext();
			datasource=(DataSource)context.lookup("java:comp/env/jdbc/xxx");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
    private static final String SELECT_BY_MEMBERADDRESS="select * from member where memberAddress=?";
	@Override
	public MemberBean select(String memberAddress) {
		Connection conn=null;
		PreparedStatement prst=null;
		ResultSet rs=null;
		MemberBean result=null;
		
		try {
			conn=datasource.getConnection();
			prst=conn.prepareStatement(SELECT_BY_MEMBERADDRESS);
			prst.setString(1, memberAddress);
			rs=prst.executeQuery();
			
			if(rs.next()){
				result=new MemberBean();
				result.setDepId(rs.getInt("depId"));
				result.setMemberId(rs.getInt("memberId"));
				result.setMemberAddress(rs.getString("memberAddress"));
				result.setMemberPassword(rs.getString("memberPassword"));
				result.setMemberNicknName(rs.getString("memberNicknName"));
				result.setMemberBigPhoto(rs.getString("memberBigPhoto"));
				result.setMemberBonus(rs.getInt("MemberBonus"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)
				rs.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			try {
				if(prst!=null)
				prst.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(conn!=null)
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return result;
	}
	
}

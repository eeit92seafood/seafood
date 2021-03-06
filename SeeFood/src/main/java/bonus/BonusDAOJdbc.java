package bonus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import login.MemberBean;

public class BonusDAOJdbc implements BonusDAO {
	
	public DataSource datasource;

	public BonusDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			datasource = (DataSource) ctx.lookup("java:comp/env/jdbc/xxx");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	private static final String SELECT_BY_MEMBERID ="select * from member where memberId=?";
	@Override
	public MemberBean selectBonus(int memberId) {
		MemberBean result=null;
		ResultSet rset = null;
		try(
				Connection conn = datasource.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SELECT_BY_MEMBERID);) {
				stmt.setInt(1, memberId);
				rset = stmt.executeQuery();
				if(rset.next()) {
					result = new MemberBean();
					result.setDepId(rset.getInt("depId"));
					result.setMemberId(rset.getInt("memberId"));
					result.setMemberAddress(rset.getString("memberAddress"));
					result.setMemberPassword(rset.getString("memberPassword"));
					result.setMemberNicknName(rset.getString("memberNicknName"));
					result.setMemberBigPhoto(rset.getString("memberBigPhoto"));
					result.setMemberBonus(rset.getInt("MemberBonus"));
					result.setLoginTime(rset.getDate("loginTime"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if (rset!=null) {
					try {
						rset.close();
					} catch (SQLException e) {
						e.printStackTrace();
					} 
				}
			}
		return result;
	}



	private static final String UPDATE = "update member set memberBonus=? where memberId=?";
	@Override
	public MemberBean updataBonus(int memberId, int memberBonus) {
		System.out.println("修改會員紅利(update)");
		MemberBean result=null;
		try(Connection conn = datasource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(UPDATE);){
			stmt.setInt(1,memberBonus );
			stmt.setInt(2, memberId);
			int i = stmt.executeUpdate();
			if(i==1) {
				System.out.println("會員紅利更新成功");
				result = this.selectBonus(memberId);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return result;
	}

}

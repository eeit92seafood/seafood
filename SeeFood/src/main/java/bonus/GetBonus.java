package bonus;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.MemberBean;


@WebServlet("/pages/bonus/GetBonus")
public class GetBonus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetBonus() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("================來自GetBonus.java的訊息================");
		HttpSession session = request.getSession();// 取得session
		MemberBean bean = (MemberBean) session.getAttribute("bean"); // 取得網頁裡session的會員資料
		if (bean == null) { // 檢查有無登入(以防萬一用),送回首頁
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			System.out.println("====================訊息結束====================");
			return;
		}
		int a=(int)(Math.random()*100.0+50.0);  //隨機產生紅利點數
		session.setAttribute("bonus", "恭喜你獲得  "+a+" 點");// bean存進session當作登入標準,網頁以暱稱做判斷${bean.memberNicknName}
		System.out.println("現有點數="+bean.getMemberBonus());
		System.out.println("獲得點數="+a);
		int memberBonus=bean.getMemberBonus()+a;//原有紅利加上獲得紅利
		System.out.println("總紅利="+bean.getMemberBonus()+"+"+a+"="+memberBonus);
		bean=new BonusDAOJdbc().updataBonus(bean.getMemberId(), memberBonus);
		request.setAttribute("bean", bean);
		RequestDispatcher rd = request.getRequestDispatcher("/pages/bonus/bonusmsg.jsp");
		rd.forward(request, response);
		return;

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}

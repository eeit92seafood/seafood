package article;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.MemberBean;

@WebServlet("/pages/changearticle")
public class changearticle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("================來自changearticle.java的訊息================");
		// 接收資料
		HttpSession session = request.getSession(); // 取得連線
		MemberBean bean = (MemberBean) session.getAttribute("bean"); // 取得網頁裡session的會員資料
		System.out.println("bean=" + bean); // 測試

		String word = request.getParameter("content"); // 取得文章內容
		String title = request.getParameter("title"); // 取得文章標題
		Map<String, String> errors = new HashMap<String, String>(); // 建立物件存放錯誤訊息,關鍵字"errors"
		request.setAttribute("errors", errors);
		// 驗證資料
		if (bean == null) { // 檢查有無登入(以防萬一用),送回首頁
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			System.out.println("====================訊息結束====================");
			return;
		}
		if (title == null || title.trim().length() == 0) { // 沒有標題
			System.out.println("沒有標題的訊息");
			errors.put("title", "你尚未輸入標題"); // 放錯誤訊息,關鍵字"errors.notitle"
			request.getRequestDispatcher("/pages/article/article.jsp").forward(request, response);// 回傳錯誤訊息,並停留原頁面
			System.out.println("====================訊息結束====================");
			return;
		}
		
		if (word == null || word.trim().length() == 0) { // 沒有文章內容
			System.out.println("沒有文章的訊息");
			errors.put("noword", "你尚未輸入文字"); // 放錯誤訊息,關鍵字"errors.noword"
			request.getRequestDispatcher("/pages/article/article.jsp").forward(request, response);// 回傳錯誤訊息,並停留原頁面
			System.out.println("====================訊息結束====================");
			return;
		}
		System.out.println("TEST");
		String tagPattern = "<{1}[^>]{1,}>{1}"; // 設定刪除標籤的條件
		String cutWord = word.replaceAll(tagPattern, " "); // 除去標籤
		cutWord = cutWord.replaceAll("&nbsp;", " "); // 除去 &nbsp; (空白鍵)
		
		if (cutWord.trim().length() < 80) { // 檢查除去後是否有超過30字
			System.out.println("少於80字的消息");
			errors.put("wordLess", "文章內容少於80字"); // 放錯誤訊息,關鍵字"errors.wordLess"
			request.getRequestDispatcher("/pages/article/article.jsp").forward(request, response);// 回傳錯誤訊息,並停留原頁面
			System.out.println("====================訊息結束====================");
			return;
		}
		
		cutWord = cutWord.substring(0, 80); // 擷取剛好80字
		
		
		///////////////////////////////////////////////////////////////////////
//		if (word == null || word.trim().length() == 0) { // 沒有文章內容
//			request.setAttribute("errors", errors);
//			errors.put("noword", "你尚未輸入文字"); // 放錯誤訊息,關鍵字"errors.noword"
//			request.getRequestDispatcher("/pages/article/article.jsp").forward(request, response);// 回傳錯誤訊息,並停留原頁面
//			return;
//		}
//		if (title == null || title.trim().length() == 0) { // 沒有標題
//			errors.put("notitle", "你尚未輸入標題"); // 放錯誤訊息,關鍵字"errors.notitle"
//			request.getRequestDispatcher("/pages/article/article.jsp").forward(request, response);// 回傳錯誤訊息,並停留原頁面
//			return;
//		}

		// 執行DAO
		if (cutWord != null) {
			ArticleBean artic = new ArticleBean(); // 產生文章的bean物件,準備存放資料
			artic.setMemberId(bean.getMemberId()); // 會員Bean的MemberId塞進文章的MemberId
			artic.setArticleData(word); // 放文章內容
			artic.setArticleTitle(title); // 放文章標題
			artic.setCutData(cutWord); // 放去標籤後文章
			artic.setMemberNicknName(bean.getMemberNicknName()); // 取得暱稱

			if (request.getParameter("id") != null) {
				int id = Integer.parseInt(request.getParameter("id")); // 取得文章編號
				String memberNicknName = bean.getMemberNicknName().toString();

				artic = new ArticleDAOJdbc().update(id, title, word, memberNicknName, cutWord); // 執行修改文章的動作
				Map<String, String> show = new HashMap<String, String>();
				session.setAttribute("article", show);
				show.put("showArticle", word); // 回傳文章內容

				artic = new ArticleDAOJdbc().selecttopone(); // 搜尋最新一筆
				session.setAttribute("articleid", artic); // 結果回傳 ${articleid}

				RequestDispatcher rd = request.getRequestDispatcher("/pages/article/seearticle.jsp");
				rd.forward(request, response);
				System.out.println("====================訊息結束====================");
				return;
			}

		}

	}

}

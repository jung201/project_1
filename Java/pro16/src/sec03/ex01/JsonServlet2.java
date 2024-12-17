package sec03.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/json2")
public class JsonServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		JSONObject totalObject = new JSONObject();
		JSONArray membersArray = new JSONArray();
		JSONObject memberInfo = new JSONObject();

		memberInfo.put("name", "둘리");
		memberInfo.put("age", "20");
		memberInfo.put("gender", "공룡");
		memberInfo.put("nickname", "호이");
		// 배열에 입력
		membersArray.add(memberInfo);

		memberInfo = new JSONObject();
		memberInfo.put("name", "또치");
		memberInfo.put("age", "20");
		memberInfo.put("gender", "타조");
		memberInfo.put("nickname", "공주병");
		membersArray.add(memberInfo);

		totalObject.put("members", membersArray);

		String jsonInfo = totalObject.toJSONString();
		System.out.print(jsonInfo);
		writer.print(jsonInfo);
	}

}
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

/**
 * Servlet implementation class JsonServlet3
 */
@WebServlet("/json3")
public class JsonServlet3 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandle(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)    throws ServletException, IOException {
        doHandle(request, response);
    }

    private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        membersArray.add(memberInfo);

        memberInfo = new JSONObject();
        memberInfo.put("name", "또치");
        memberInfo.put("age", "20");
        memberInfo.put("gender", "타조");
        memberInfo.put("nickname", "깐따라삐야");
        membersArray.add(memberInfo);
        totalObject.put("members", membersArray);

        JSONArray bookArray = new JSONArray();
        JSONObject bookInfo = new JSONObject();
        bookInfo.put("title", "모두의 파이썬");
        bookInfo.put("writer", "이승찬");
        bookInfo.put("price", "12000");
        bookInfo.put("genre", "IT");
        bookInfo.put("image", "http://127.0.0.1:8080/pro16/image/dog.PNG");
        bookArray.add(bookInfo);

        bookInfo = new JSONObject();
        bookInfo.put("title", "모두의 파이썬");
        bookInfo.put("writer", "이승찬");
        bookInfo.put("price", "12000");
        bookInfo.put("genre", "IT");
        bookInfo.put("image", "http://127.0.0.1:8080/pro16/image/cat.PNG");
        bookArray.add(bookInfo);

        totalObject.put("books", bookArray);

        String jsonInfo = totalObject.toJSONString();
        System.out.print(jsonInfo);
        writer.print(jsonInfo);
    }

}
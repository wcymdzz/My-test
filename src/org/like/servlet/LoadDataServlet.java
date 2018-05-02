package org.like.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class LoadDataServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 开始进行数据处理。
		// 连接数据库，并读取到想要的数据
		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/student", "root", "3333");
			String sql = "SELECT userid,COUNT(product_id) FROM product_fav GROUP BY userid";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();

			JSONArray array = new JSONArray();

			while (rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("userid", rs.getString(1));
				obj.put("fav_count", rs.getInt(2));
				array.add(obj);
			}

			rs.close();
			pst.close();
			conn.close();
			// 将准备好的JSON数据返回给页面。
			// 通过IO流输出来返回
			// 返回前需要先处理返回的乱码问题
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.print(array);
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
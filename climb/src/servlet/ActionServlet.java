package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ClimbDao;
import entity.Climber;


public class ActionServlet extends HttpServlet{
	
	public void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		String[] depts={"其他","行政","医疗","金融","网管","技术","重点","特种"};
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		String uri=request.getRequestURI();
		HttpSession session=request.getSession();
		String action=uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		if(action.equals("/regist")){
			String username=request.getParameter("username");
			String dept=request.getParameter("dept");
			String num=request.getParameter("num");
			String phone=request.getParameter("phone");
			int index=Integer.parseInt(dept);
			System.out.println(username+","+dept+","+num+","+phone);
			ClimbDao dao=new ClimbDao();
			boolean issuccess = dao.addClimber(username, depts[index], num, phone);
			System.out.println("插入是否成功："+issuccess);
			//User u=new User();
			//u.setUsername(username);
			//u.setPassword(password);
			
			//session.setAttribute("user",u);//绑定user到session中
			/*if(username!=""){
				
				request.setAttribute("username", username);
				request.getRequestDispatcher("welcome.jsp").forward(request, response);
			}*/
			String msg="";
			if(issuccess){
				msg="ok";
				//request.setAttribute("msgStr", "提交成功");
				//request.getRequestDispatcher("index.jsp").forward(request, response);
			}else{
				msg="error";
				//request.setAttribute("msgStr", "提交失败，已存在");
				//request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			out.print(msg);
			
		}else if(action.equals("/check_IDnum")){
			
			String num=request.getParameter("num");
			System.out.println("num:"+num);
			ClimbDao dao=new ClimbDao();
			Climber climber = dao.getClimber(num);
			String msg="";
			if(climber!=null){//说明存在这个用户
				msg="error";
			}else{
				msg="ok";
			}
			System.out.println("身份验证："+msg);
			out.print(msg);
			//System.out.println("试题列表");
			/**/
			
		}else if(action.equals("/list")){
			ClimbDao dao=new ClimbDao();
			List<Climber> climbers =dao.findAllClimbers();
			
			request.setAttribute("climbers", climbers);
			
			request.getRequestDispatcher("list.jsp").forward(request, response);
		}
	}
}

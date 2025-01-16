package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class dangNhapController
 */
@WebServlet("/dangNhapController")
public class dangNhapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangNhapController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		if (username != null && password != null) {
			if (username.equals("abc") && password.equals("123")) {
				RequestDispatcher rd = request.getRequestDispatcher("sachController");
				rd.forward(request, response);
				session.setAttribute("login", true);
				return; 
			} else {
				 request.setAttribute("username", username);
				 request.setAttribute("password", password);
				 request.setAttribute("saimk","<script>alert('Sai tài khoản hoặc mật khẩu');</script>");
			}
		}
		
		if(session.getAttribute("login")==null){
			session.setAttribute("login", false);
		}

		
		RequestDispatcher rd = request.getRequestDispatcher("dangnhap.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

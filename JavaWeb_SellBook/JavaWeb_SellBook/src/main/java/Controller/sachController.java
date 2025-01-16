package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import loaiModal.loaibo;
import sachModal.sach;
import sachModal.sachbo;

/**
 * Servlet implementation class sachController
 */
@WebServlet("/sachController")
public class sachController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sachController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		loaibo lbo = new loaibo();
		request.setAttribute("dsloai", lbo.getloai());
		sachbo sbo = new sachbo();
		
		String ml = request.getParameter("ml");
		String key = request.getParameter("q");
		ArrayList<sach> ds;
		
		if (key != null && !key.isEmpty()) {
		    ds = sbo.Tim(key, ml);
		} else {
		    if (ml != null && ml !="") {
		        ds = sbo.TimMa(ml); 
		    } else {
		        ds = sbo.getsach();
		    }
		}
		request.setAttribute("dssach", ds);
		request.setAttribute("maLoai", ml);
		request.setAttribute("key", key);
		RequestDispatcher rd = request.getRequestDispatcher("tc.jsp");
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

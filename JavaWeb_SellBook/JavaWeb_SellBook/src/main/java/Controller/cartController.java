package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cartModal.cartbo;
import sachModal.sach;
import sachModal.sachbo;

/**
 * Servlet implementation class cartController
 */
@WebServlet("/cartController")
public class cartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public cartController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		cartbo cart = (cartbo) session.getAttribute("cart");
		if (cart == null) {
			cart = new cartbo();
			session.setAttribute("cart", cart);
		}

		String action = request.getParameter("action");
		String id = request.getParameter("id");


	    if (id != null) {
	        sach product = new sachbo().getProductById(id);
	        if ("buy".equals(action)) {
	            cart.addItem(product, 1);
	            response.sendRedirect("cart.jsp");
	            return;
	        } else if ("addToCart".equals(action)) {
	            cart.addItem(product, 1);
	            request.getRequestDispatcher("sachController").forward(request, response);
	            return;
	        }
	    }

		if (action != null) {
			if (action.startsWith("delete_")) {
				String bookId = action.substring(action.indexOf("_") + 1);
				cart.removeItem(bookId);
			} else if (action.startsWith("updateId_")) {
				String bookId = action.substring(action.indexOf("_") + 1);
				String quantityParam = request.getParameter("quantity_" + bookId);
				if (quantityParam != null && !quantityParam.isEmpty()) {
					cart.updateQuantity(bookId, Integer.parseInt(quantityParam));
				}
			} else if ("clearAll".equals(action)) {
				cart.getCartItems().clear();
			}
		}

		String[] selectedBooks = request.getParameterValues("selectedBooks");
		if (selectedBooks != null) {
			for (String bookId : selectedBooks) {
				cart.removeItem(bookId);
			}
		}

		session.setAttribute("cart", cart);
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package controller.user.search;

import database.ProductDAO;
import database.UserDAO;
import model.ErrorBean;
import model.Product;
import model.User;
import util.Email;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class Search
 */
@WebServlet(name = "search", value = "/search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Search() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String productName = request.getParameter("productName");

		ProductDAO productDAO = new ProductDAO();
		ArrayList<Product> listProductSearchByName = productDAO.selectByProductName(productName);
		System.out.println(listProductSearchByName.size()+"kich thuoc");

		session.setAttribute("listProduct", listProductSearchByName);

		session.setAttribute("searchKeyword", productName);
		// lay toan bo danh sach khi khong tim thay ket qua
//


		ArrayList<Product> products = productDAO.selectAll();
		int page, numpage = 6;
		int size = products.size();
		int num = (size % numpage == 0) ? (size / numpage) : ((size / numpage) + 1);
		String xpage = request.getParameter("page");

		if (xpage == null || xpage.isEmpty()) {
			page = 1;
		} else {
			page = Integer.parseInt(xpage);
		}

		int start = (page - 1) * numpage;
		int end = Math.min(page * numpage, size);
		List<Product> list = productDAO.getListByPage(products, start, end);
		int pageS, numpageS = 1;
		int sizeS = listProductSearchByName.size();
		int numS = (sizeS % numpageS == 0) ? (sizeS / numpageS) : ((sizeS / numpageS) + 1);
		String xpageS = request.getParameter("pageS");

		if (xpageS == null || xpageS.isEmpty()) {
			pageS = 1;
		} else {
			pageS = Integer.parseInt(xpageS);
		}

		int startS = (pageS - 1) * numpageS;
		int endS = Math.min(pageS * numpageS, sizeS);
		List<Product> listS = productDAO.getListByPage(listProductSearchByName, startS, endS);

		session.setAttribute("listProduct", list);

		session.setAttribute("page", page);
		session.setAttribute("num", num);
		session.setAttribute("listProduct", listProductSearchByName);
		session.setAttribute("pageS", pageS);
		session.setAttribute("numS", numS);

		// chuyen huong trang

		String url = request.getContextPath() + "/WEB-INF/book/shop-grid.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



	}

}
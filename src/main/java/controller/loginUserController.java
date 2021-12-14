package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserJpaDAO;
import model.User;

/**
 * Servlet implementation class loginUserController
 */
@WebServlet("/loginUserController")
public class loginUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginUserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		String message = "";
		User user = new User();

		String email = request.getParameter("email").trim();
		String password = request.getParameter("senha");

		if (email != null && password != null) {
			// Verifica email e senha no banco
			user = UserJpaDAO.getInstance().getLogin(email, password);
			if (user == null) { // Não cadastrado
				message = "Usuário não cadastrado!";
				request.setAttribute("message", message);
				dispatcher.forward(request, response);
			} else { // Usuário encontrado
				message = "Usuário logado com sucesso!";
				request.setAttribute("message", message);
				dispatcher = request.getRequestDispatcher("home.jsp");
				dispatcher.forward(request, response);
			}
		} else {
			message = "Campo vazio!";
			request.setAttribute("message", message);
			dispatcher.forward(request, response);
		}
	}

}

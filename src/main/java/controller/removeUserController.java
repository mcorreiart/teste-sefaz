package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.UserJpaDAO;
import model.User;

/**
 * Servlet implementation class removeUserController
 */
@WebServlet("/removeUserController")
public class removeUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public removeUserController() {
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

		String message = "Removido";
		String idToRemove = request.getParameter("id").trim();

		if (idToRemove == null || idToRemove.isEmpty()) {
			message = "Informe o usuário.";
		} else {
			// Busca o usuário pelo ID
			User user = UserJpaDAO.getInstance().getById(Integer.parseInt(idToRemove));
			if (user != null) {
				// Caso encontre, apaga do banco
				UserJpaDAO.getInstance().removeById(Integer.parseInt(idToRemove));
			} else {
				message = "Usuário não encontrado.";
			}
		}
		
		response.getWriter().write(message);
	}

}

package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserJpaDAO;
import model.User;

/**
 * Servlet implementation class getUserController
 */
@WebServlet("/getUserController")
public class getUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public getUserController() {
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
		// response.getWriter().append("Served at: ").append(request.getContextPath());
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

		String name = request.getParameter("nome").trim();
		String message = "";

		// Se o campo tiver vazio, retorna o erro
		if (name == null || name.isEmpty()) {
			message = "Informe um nome";
		} else {
			List<User> user = new ArrayList<User>();

			// Caso o nome seja "(listAllUsers)", busca todos os usuários no banco
			if (name.equals("(listAllUsers)")) {

				user = UserJpaDAO.getInstance().findAll();

			} else { // Caso contrário, busca todas as ocorrências no banco através de like
				user = UserJpaDAO.getInstance().getByName(name);
			}

			if (!(user == null || user.isEmpty())) {
				// Pega os dados do usuário para enviar
				for (int i = 0; i < user.size(); i++) {
					message = message + user.get(i).getId() + "--" + user.get(i).getName() + "--"
							+ user.get(i).getEmail() + "--";
					for (int j = 0; j < user.get(i).getTel().size(); j++) {
						message = message + user.get(i).getTel().get(j).getType() + " - ("
								+ user.get(i).getTel().get(j).getDdd() + ") " + user.get(i).getTel().get(j).getNumber()
								+ "<br/>";
					}

					if (i + 1 < user.size()) {
						message = message + "---";
					}
				}
			} else {
				message = "Usuário não encontrado.";
			}
		}
		response.getWriter().write(message);
	}

}

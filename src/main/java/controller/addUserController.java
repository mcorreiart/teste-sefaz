package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserJpaDAO;
import model.Telephone;
import model.User;

/**
 * Servlet implementation class addUserController
 */
@WebServlet("/addUserController")
public class addUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addUserController() {
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String message = "";
		User user = new User();
		Telephone telephone = new Telephone();
		String name = request.getParameter("nome").trim();
		String password = request.getParameter("senha").trim();
		String email = request.getParameter("email").trim();
		String type = request.getParameter("tipo").trim();
		String ddd = request.getParameter("ddd").trim();
		String tel = request.getParameter("telefone").trim();

		String[] types, ddds, numbers;

		// Valida email
		if (!User.validateEmail(email)) {
			message = message + " E-mail\n";
		} else {
			if (UserJpaDAO.getInstance().getByEmail(email) == null) {
				// Valida o nome
				if (!User.validateName(name)) {
					message = message + " Nome\n";
				}

				// Valida senha
				if (!User.validatePassword(password)) {
					message = message + " Senha deve ter pelo menos 6 caracteres\n";
				}

				// Pega todos os telefones informados e valida cada um
				if (message.equals("") && (type != null && !type.isEmpty()) && (ddd != null && !ddd.isEmpty())
						&& (tel != null && !tel.isEmpty())) {
					types = type.split("//");
					ddds = ddd.split("//");
					numbers = tel.split("//");

					int menorDado = types.length;
					if (menorDado > ddds.length) {
						menorDado = ddds.length;
					} else if (menorDado > numbers.length) {
						menorDado = numbers.length;
					}

					if (menorDado > 0) {
						for (int i = 0; i < menorDado; i++) {
							if (!telephone.validateDdd(ddds[i])) {
								message = message + " DDD\n";
							}

							if (types[i].equals("Celular")) {
								if (!telephone.validateNumber(numbers[i], true)) {
									message = message + " Celular\n";
								}
							} else {
								if (!telephone.validateNumber(numbers[i], false)) {
									message = message + " Telefone\n";
								}
							}

							// Se tiver tudo ok, adiciona os telefones na lista do usuário
							if (message.equals("")) {
								user.getTel().add(new Telephone(Integer.parseInt(ddds[i]), numbers[i], types[i]));
							}
						}
					} else {
						message = message + "Informe pelo menos um telefone";
					}
				}

				// Cadastra o usuário
				if (message.equals("")) {
					user.setName(name);
					user.setEmail(email);
					user.setPassword(password);

					UserJpaDAO.getInstance().merge(user);
					message = "Usuário Cadastrado.";
				}
			} else {
				message = "E-mail já cadastrado.";
			}
		}

		response.getWriter().write(message);

	}

}

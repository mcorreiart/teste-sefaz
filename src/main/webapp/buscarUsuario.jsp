<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>Buscar Usuário</title>
</head>
<body>
	<div class="d-flex" id="wrapper">
		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="list-group list-group-flush">
				<a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="login.jsp">Login</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="buscarUsuario.jsp">Buscar Usuário</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="cadastrarUsuario.jsp">Incluir Usuário </a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="deletarUsuario.jsp">Remover Usuário</a> <a
					class="list-group-item list-group-item-action list-group-item-light p-3"
					href="alterarUsuario.jsp">Alterar Usuário</a>
			</div>
		</div>
		<div style="padding-top: 40px" class="container">
			<form class="row g-3" method="post">
				<div class="mb-3">
					<label class="form-label">Nome</label> <input class="form-control"
						type="text" id="inputName" name="nome">
				</div>


			</form>
			<div id="buttonSubmit" class="col-md-2">
				<button class="btn btn-primary" id="getUserButton" name="get">Buscar</button>
				<button class="btn btn-primary" id="getAllUserButton" name="getAll">Buscar
					Todos</button>
			</div>


			<div class="container">
				<table id="tableResult" class="table">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Name</th>
							<th scope="col">E-mail</th>
							<th scope="col">Telefone</th>
						</tr>
					</thead>
					<tbody id="bodyResult">

					</tbody>
				</table>
			</div>
		</div>
		<div></div>
	</div>
</body>
</html>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#getUserButton')
								.click(
										function(event) {
											$("tr").remove(".trData");

											var name = $('#inputName').val();
											$
													.post(
															'getUser',
															{
																nome : name
															},
															function(
																	responseText) {
																if (responseText.indexOf("--") == -1) {

																	alert(responseText);

																} else {
																	var finalAppend = "";
																	var resAppend = '<tr class="trData"><th scope="row">dadoaqui</th><td>dadoaqui</td><td>dadoaqui</td><td>dadoaqui</td></tr>';
																	var i = 0;
																	var j = 0;
																	var dataUser;
																	var userResult = responseText;
																	userResult = userResult
																			.split("---");
																	while (i < userResult.length) {
																		dataUser = userResult[i];
																		dataUser = dataUser
																				.split("--");

																		var resAppendAux = resAppend;
																		j = 0;
																		while (j < dataUser.length) {

																			resAppendAux = resAppendAux
																					.replace(
																							"dadoaqui",
																							dataUser[j]);
																			j = j + 1;
																		}
																		finalAppend = finalAppend
																				+ resAppendAux;
																		i = i + 1;
																	}

																	$(
																			"#bodyResult")
																			.append(
																					finalAppend);
																}

															});

										});
					});
	$(document)
			.ready(
					function() {
						$('#getAllUserButton')
								.click(
										function(event) {
											$("tr").remove(".trData");

											$
													.post(
															'getUser',
															{
																nome : '(listAllUsers)'
															},
															function(
																	responseText) {
																if (responseText.indexOf("--") == -1) {

																	alert(responseText);

																} else {
																	var finalAppend = "";
																	var resAppend = '<tr class="trData"><th scope="row">dadoaqui</th><td>dadoaqui</td><td>dadoaqui</td><td>dadoaqui</td></tr>';
																	var i = 0;
																	var j = 0;
																	var dataUser;
																	var userResult = responseText;
																	userResult = userResult
																			.split("---");
																	while (i < userResult.length) {
																		dataUser = userResult[i];
																		dataUser = dataUser
																				.split("--");

																		var resAppendAux = resAppend;
																		j = 0;
																		while (j < dataUser.length) {

																			resAppendAux = resAppendAux
																					.replace(
																							"dadoaqui",
																							dataUser[j]);
																			j = j + 1;
																		}
																		finalAppend = finalAppend
																				+ resAppendAux;
																		i = i + 1;
																	}

																	$(
																			"#bodyResult")
																			.append(
																					finalAppend);
																}

															});
										});
					});
</script>
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
<title>Cadastrar Usuário</title>
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
			<form id="formDataUser" class="row g-3"	method="post">

				<div class="mb-3">
					<label class="form-label">Nome</label> <input id="nameUser" class="form-control"
						type="text" name="nome">
				</div>
				<div class="mb-3">
					<label class="form-label">E-mail</label> <input
						class="form-control" type="text" id="emailUser" name="email">
				</div>
				<div class="mb-3">
					<label class="form-label">Senha</label> <input id="passwordUser" class="form-control"
						type="text" name="senha">
				</div>

				<div class="col-md-2">
					<label class="form-label">Tipo</label> <select id="type0"
						name="tipo" class="form-select">
						<option selected>Celular</option>
						<option>Residencial</option>
					</select>
				</div>
				<div class="col-md-1">
					<label class="form-label">DDD</label><input id="ddd0" class="form-control"
						type="text" name="ddd">
				</div>
				<div id="telefoneDiv" class="col-md-2">
					<label class="form-label">Telefone</label><input
						class="form-control" type="text" id="number0" name="telefone">

				</div>
				<div class="col-md-2">
					<div style="padding-top: 36px;"></div>
					<input style="display: none" type="text" id="inputTel" value="0"
						name="countTel"> <span id="addTel"
						class="btn btn-secondary btn-sm">Mais</span>
				</div>
				<div></div>
				<div id="divAppend"></div>
			</form>
				<div id="buttonSubmit" class="mb-3">
					<button class="btn btn-primary" id="addUser" name="add">Cadastrar</button>
				</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$('#addTel')
								.click(
										function() {

											var countTel = $('select').length;
											$("input[name=countTel]").val(
													countTel);

											$("#divAppend")
													.before(
															'<div class="col-md-2"><label class="form-label">Tipo</label> <select id="type' + countTel + '" class="form-select"><option selected>Celular</option><option>Residencial</option></select></div><div class="col-md-1"><label class="form-label">DDD</label><input class="form-control" type="text" id="ddd' + countTel + '"></div><div class="col-md-2"><label class="form-label">Telefone</label><input class="form-control" type="text" id="number' + countTel
	+ '"></div><div></div>');

										});
					});
	$(document).ready(function() {
		$('#addUser').click(function(event) {
			var countTel = $('select').length;

			var type = "";
			var ddd = "";
			var number = "";

			for (var i = 0; i < countTel; i++) {

				type = type + $('#type' + i).val() + "//";
				ddd = ddd + $('#ddd' + i).val() + "//";
				number = number + $('#number' + i).val() + "//";
			}

			var name = $('#nameUser').val();
			var password = $('#passwordUser').val();
			var email = $('#emailUser').val();
			$.post('addUser', {
				nome : name,
				senha : password,
				email : email,
				tipo : type,
				ddd : ddd,
				telefone : number,
			}, function(responseText) {
				alert(responseText);

			});
		});
	});
</script>

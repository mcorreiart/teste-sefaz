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
<title>Alterar Usuário</title>
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
					<label class="form-label">Id</label> <input class="form-control"
						type="text" name="id" id="idUser">
				</div>
			</form>
			<div id="buttonSearch" class="col-md-2">
				<button class="btn btn-primary" id="getUserButton" name="get">Buscar</button>
			</div>
			<form style="padding-top:80px" id="formDataUser" class="row g-3" method="post">

				<div class="mb-3">
					<label class="form-label">Nome</label> <input disabled="true" id="nameUser"
						class="form-control" type="text" name="nome">
				</div>
				<div class="mb-3">
					<label class="form-label">E-mail</label> <input disabled="true" id="emailUser"
						class="form-control" type="text" name="email">
				</div>
				<div class="mb-3">
					<label class="form-label">Senha</label> <input disabled="true" id="passwordUser"
						class="form-control" type="text" name="senha">
				</div>


				<div></div>
				<div id="divAppend"></div>

			</form>
			<div id="buttonSubmit" class="mb-3">
				<button class="btn btn-primary" disabled="true" id="updateButton" name="update">Alterar</button>
			</div>
		</div>

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

											var idUser = $('#idUser').val();
											
											$
													.post(
															'updateUser',
															{
																id : idUser,
																action : 'search'
															},
															function(
																	responseText) {
																if (responseText.indexOf("--") != -1) {
																	$('#idUser').attr('disabled', true);
																	$('#getUserButton').attr('disabled', true);
																	$('#updateButton').attr('disabled', false);
																	$('#nameUser').attr('disabled', false);
																	$('#emailUser').attr('disabled', false);
																	$('#passwordUser').attr('disabled', false);
																	var tels;
																	var countTel;
																	var j = 0;
																	var isCel = "Residencial";
																	var dataUser = responseText
																			.split("--");
																	$('#idUser')
																			.val(
																					dataUser[0]);
																	$('#nameUser')
																			.val(
																					dataUser[1]);
																	$('#emailUser')
																			.val(
																					dataUser[2]);
																	$(
																			'#passwordUser')
																			.val(
																					dataUser[3]);
	
																	for (var i = 4; i < dataUser.length; i++) {
	
																		tels = dataUser[i];
	
																		tels = tels
																				.split("//");
																		
																		if (tels[0] == "Residencial") {
																			isCel = "Celular";
																		}
																		
																		if (tels.length < 3) {
																			break;
																		}
																		
																		
	
																		$(
																				"#divAppend")
																				.before(
																						'<div class="col-md-2"><label class="form-label">Tipo</label> <select id="type' + j + '" class="form-select"><option selected>'
																								+ tels[0]
																								+ '</option><option>' + isCel + '</option></select></div><div class="col-md-1"><label class="form-label">DDD</label><input value="'
																								+ tels[1]
																								+ '" class="form-control" type="text" id="ddd'
																								+ j
																								+ '"></div><div class="col-md-2"><label class="form-label">Telefone</label><input value="'
																								+ tels[2]
																								+ '" class="form-control" type="text" id="number'
																								+ j
																								+ '"></div><div></div>');
	
																		j++
																	}
															} else {
																alert (responseText);
															}

															});
										});
					});
	$(document).ready(function() {
		$('#updateButton').click(function(event) {
			var countTel = $('select').length;

			var type = "";
			var ddd = "";
			var number = "";

			for (var i = 0; i < countTel; i++) {

				type = type + $('#type' + i).val() + "//";
				ddd = ddd + $('#ddd' + i).val() + "//";
				number = number + $('#number' + i).val() + "//";
			}

			var id = $('#idUser').val();
			var name = $('#nameUser').val();
			var password = $('#passwordUser').val();
			var email = $('#emailUser').val();
			$.post('updateUser', {
				id : id,
				nome : name,
				senha : password,
				email : email,
				tipo : type,
				ddd : ddd,
				telefone : number,
				action : 'update'
			}, function(responseText) {
				alert(responseText);

			});
		});
	});
</script>
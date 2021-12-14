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
<title>Remover Usuário</title>
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
					<label class="form-label">Id</label> <input id="removeId"
						class="form-control" type="text" name="id">
				</div>


			</form>
			<div class="col-md-2">
				<button class="btn btn-primary" id="removeButton" name="remove">Remover</button>
			</div>
		</div>
	</div>
</body>

</html>
<script type="text/javascript">
	$(document).ready(function() {
		$('#removeButton').click(function(event) {
			$.post('removeUser', {
				id : $('#removeId').val()
			}, function(responseText) {

				alert(responseText);

			});
		});
	});
</script>
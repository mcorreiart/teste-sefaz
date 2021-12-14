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
<title>Insert title here</title>
</head>
<body>
	<div style="padding-top: 20px; padding-left: 20px" id="content">
		<div class="">
			<div class="page-content page-container" id="page-content">
				<div class="padding">
					<div class="row">
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<strong>Login</strong>
								</div>
								<div class="card-body">
									<form action="loginUser" method="post">
										<div class="form-group">
											<label class="text-muted" for="exampleInputEmail1">Email
											</label><input name="email" type="email" class="form-control"
												id="exampleInputEmail1" aria-describedby="emailHelp"
												placeholder="Informe o email"><a
												href="cadastrarUsuario.jsp" style="padding-top: 100px"
												class="forgot-link float-right text-primary">Cadastrar</a>
										</div>
										<div style="padding-top: 15px" class="form-group">
											<label class="text-muted" for="exampleInputPassword1">Senha</label><input
												type="password" name="senha" class="form-control"
												id="exampleInputPassword1" placeholder="Senha">
										</div>
										<div style="padding-top: 20px" class="col-md-2">
											<button type="submit" class="btn btn-primary">Entrar</button>

										</div>


									</form>
									<%
									String message = (String) request.getAttribute("message");
									if (message != null)
										out.print(message);
									%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
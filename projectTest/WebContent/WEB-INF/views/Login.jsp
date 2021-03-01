<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

<div>
	<h1>로그인</h1>
	<hr>
</div>


<div class="container">
	<div class="row">
		<div class="loginbox">
			<form role="form" method="post"  action="userlogin.action">
				<div class="form-group">
					 
					<label for="userId">
						아이디
					</label>
					<input type="text" class="form-control" id="userId" />
				</div>
				<div class="form-group">
					 
					<label for="userPw">
						Password
					</label>
					<input type="password" class="form-control" id="userPw" />
				</div>
				<div class="checkbox">
					 
					<label>
						<input type="checkbox" /> 아이디 저장
					</label>
				</div> 
				<button type="submit" class="btn btn-primary">
					로그인
				</button>
			</form>
		</div>
	</div>
</div>

</body>
</html>
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
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$().ready(function()
	{
		$(".btnDelete").click(function()
		{
			$(location).attr("href","memberdelete.action?mid=" + $(this).val());
		});
		
		$(".btnUpdate").click(function()
		{
			$(location).attr("href","memberupdate.action.action?mid=" + $(this).val());
		});

		$(".btnCancel").click(function()
		{	
			$("#name").val() = "";
		});
		
	});


</script>

</head>
<body>

<div>
	<h1>회원 정보</h1>
	<hr>
</div>

<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading" id="title">
				회원 정보 등록
			</div>
			
			<div class="panel-body">
				<form action="memberinsert.action" method="post" role="form" id="memberForm">
					<input type="hidden" id="mid" name="mid">
					<div class="form-group">
						<label for="name">
							NAME : 
						</label>
						<input type="text" id="name" name="name" class="form-control">
					</div>
					
					<div class="form-group">
						<label for="telephone">
							TELEPHONE : 
						</label>
						<input type="tel" id="telephone" name="telephone" class="form-control">
					</div>
					
					<button type="submit" class="btn btn-default btn-sm">SUBMIT</button>
					<button type="button" class="btn btn-default btn-sm btnCancel">CANCEL</button>
				</form>
			</div>
		</div><!-- end panel panel-default  -->
		
		<div class="panel panel-default">
			<div class="panel-heading">
				회원 정보 출력
			</div>
			
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<th>MID</th>
							<th>NAME</th>
							<th>TELEPHONE</th>
							<th>삭제 / 수정</th>
						</tr>
					</thead>
					<tbody>
						<!-- <tr>
							<td>1</td>
							<td>임효림</td>
							<td>010-1111-1111</td>
							<td>
								<button type="button" class="btn btn-default btn-xs btnDelete">삭제</button>
								<button type="button" class="btn btn-default btn-xs btnUpdate">수정</button>
							</td>
						</tr>
						<tr>
							<td>2</td>
							<td>오진녕</td>
							<td>010-2222-2222</td>
							<td>
								<button type="button" class="btn btn-default btn-xs btnDelete">삭제</button>
								<button type="button" class="btn btn-default btn-xs btnUpdate">수정</button>
							</td>
						</tr> -->
						
						<c:forEach var="list" items="${list }">
						<tr>
							<td>${list.mid }</td>
							<td>${list.name }</td>
							<td>${list.telephone }</td>
							<td>
								<button type="button" class="btn btn-default btn-xs btnDelete" value="${list.mid }">삭제</button>
								<button type="button" class="btn btn-default btn-xs btnUpdate" value="${list.mid }">수정</button>
							</td>
						</tr>
						</c:forEach>
						
					</tbody>
				</table>
				
				<button type="button" class="btn btn-default btn-sm" disabled="disabled">
					Count <span class="badge">${count }</span>
				</button>
				
			</div>
		</div>
	</div>
</div>

</body>
</html>
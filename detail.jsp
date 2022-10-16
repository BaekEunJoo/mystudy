<%@page import="test06.MemberVO"%>
<%@page import="test06.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터(idx) 사용 DB에서 데이터 조회 후 화면 출력 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세화면</title>
<link href="../css/member.css" rel="stylesheet" type="text/css">
<script>
	function update_go(frm) {
		frm.action = "update_ok.jsp";
		frm.submit();
	}
	function delete_go(frm) {
		let isDelete = confirm("삭제하시겠습니까?");
		if (!isDelete) return;
		frm.action = "";
		frm.submit();
	}
</script>
</head>
<body>

<div id="container">
	<h2>회원정보 : 상세보기</h2>
	<hr>
	<p><a href="logout.jsp">로그아웃</a></p>
	
	<form method="post">
	<table>
		<tbody>
			<tr>
				<th>아이디</th>
				<td>${memberVO.id}</td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" name="name" value="${memberVO.name }"></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="text" name="pwd" value="${memberVO.password }"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel" value="${memberVO.phone }"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" value="${memberVO.email }"></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수 정" onclick="update_go(this.form)">
					<input type="button" value="삭 제" onclick="delete_go(this.form)">
					<input type="hidden" name="id" value="${memberVO.id }">
				</td>
			</tr>
		</tfoot>
	</table>
	</form>
</div>	

</body>
</html>
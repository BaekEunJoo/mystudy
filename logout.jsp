<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    session.invalidate();
%>
<script>
    alert("로그아웃되었습니다. 로그인페이지로 이동합니다");
    location.href = "login.jsp";
</script>
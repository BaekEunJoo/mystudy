<%@page import="test06.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    try {
        int result = MemberDAO.delete(id);
        if (result > 0) {
        	session.setAttribute("memberVO", null);
        	session.setAttribute("loginUser", null);
        }
%>
        <script>
            alert("정상 삭제되었습니다\n로그인 페이지로 이동합니다");
            location.href = "login.jsp";
        </script>
<%
    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            alert("[예외발생] 삭제 작업 중 오류발생!!!\n"
                    + "담당자(8282)에게 연락하세요\n"
                    + "이전페이지로 이동합니다.");
            history.back();
        </script>
<%      
    } 
%>
<%@page import="test06.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
    <jsp:useBean id="memberVO" class="test06.MemberVO" scope="session"/>
    <jsp:setProperty property="*" name="memberVO"/>
<%
    
    try {
    	System.out.println("updata memberVO : " + memberVO);
        int result = MemberDAO.update(memberVO);
        if (result > 0) {
        	session.setAttribute("memberVO", MemberDAO.selectOne(memberVO.getId()));
        }
%>
        <script>
            alert("정상 수정되었습니다\n회원정보페이지로 이동합니다");
            location.href = "detail.jsp";
        </script>
<%
    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            alert("[예외발생] 수정 작업 중 오류발생!!!\n"
                    + "담당자(8282)에게 연락하세요\n"
                    + "이전페이지로 이동합니다.");
            history.back();
        </script>
<%      
    } 
%>
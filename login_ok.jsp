<%@page import="java.sql.SQLException"%>
<%@page import="test06.MemberVO"%>
<%@page import="test06.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");      
    try {
        MemberVO vo = MemberDAO.selectOne(id);
        System.out.println("> vo : " + vo);
        if (vo == null) {
%>
        <script>
            alert("로그인 실패!!!\n"
            		+ "아이디, 암호를 확인하세요\n"
            		+ "로그인페이지로 이동합니다");
            location.href = "login.jsp";
        </script>
<%        	
            return;
        }
        MemberVO loginUser = MemberDAO.selectOne(vo.getId());
        System.out.println("> loginUser : " + loginUser);
        session.setAttribute("memberVO", loginUser);
        session.setAttribute("loginUser", loginUser);
%>
        <script>
            alert("로그인 성공!!! 회원정보 페이지로 이동합니다");
            location.href = "detail.jsp";
        </script>
<%
    } catch (Exception e) {
%>
        <script>
            alert("[예외발생] 입력 작업 중 오류발생!!!\n"
                    + ":::오류메시지 : <%=e.getMessage()%>\n"
            		+ "담당자(8282)에게 연락하세요\n"
                    + "이전페이지로 이동합니다.");
            history.back();
        </script>
<%      
    } 
%>

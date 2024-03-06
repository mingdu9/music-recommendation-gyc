<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <%--<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">--%>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
        <meta name="Description" content="검색 엔진을 위해 웹 페이지에 대한 설명을 명시"/>
        <meta name="keywords" content="검색 엔진을 위해 웹 페이지와 관련된 키워드 목록을 콤마로 구분해서 명시"/>
        <meta name="Author" content="문서의 저자를 명시"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Insert title here</title>
    </head>
    <jsp:useBean id="BeanMottoUserDto" class="BeansHome.BeanMottoUserDTO" scope="request"/>
    <body>
        <%                
        	if (request.getParameter("updatePassword").matches("^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$%&]).{5,16}$")) {
                BeanMottoUserDto.updatePasswordId = (String) session.getAttribute("user-id");
                BeanMottoUserDto.updatePassword = request.getParameter("updatePassword");
                if (BeanMottoUserDto.updatePassword()) {
                    response.sendRedirect("mypage.jsp?updated-password=1");
                } else {
                    response.sendRedirect("modify_user.jsp?failed=update-password");
                }
            } else {
                response.sendRedirect("modify_user.jsp?failed=unavailable-password");
            }
        %>
    </body>
</html>
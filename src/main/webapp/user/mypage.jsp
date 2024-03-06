<%@ page import="BeansHome.BeanMottoUserDTO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <meta
                http-equiv="Cache-Control"
                content="no-cache, no-store, must-revalidate"
        />
        <meta http-equiv="pragma" content="no-cache"/>
        <meta
                name="Description"
                content="검색 엔진을 위해 웹 페이지에 대한 설명을 명시"
        />
        <meta
                name="keywords"
                content="검색 엔진을 위해 웹 페이지와 관련된 키워드 목록을 콤마로 구분해서 명시"
        />
        <meta name="Author" content="문서의 저자를 명시"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>おすすめ</title>
        <link rel="stylesheet" href="mypage.css" type="text/css"/>
    </head>
    <jsp:useBean id="BeanMottoUserDTO1" class="BeansHome.BeanMottoUserDTO" scope="request"/>
    <jsp:useBean id="BeanMottoUserDTO2" class="BeansHome.BeanMottoUserDTO" scope="request"/>
    <jsp:useBean id="utility" class="BeansHome.BeanUtilityDTO" scope="request"/>
    <%! String mainPath = "'../index.jsp'";
        String modifyUserPath = "'modify_user.jsp'";
    %>
    <%
        /*
    	BeanMottoUserDTO1.selectId = (String) session.getAttribute("user-id");
        BeanMottoUserDTO2.selectId = (String) session.getAttribute("user-id");
        if (!BeanMottoUserDTO1.selectInSent("1")) {
            out.println("<script>alert('보낸 추천 로딩 실패');</script>");
        }
        if (!BeanMottoUserDTO2.selectInSent("0")) {
            out.println("<script>alert('!!!!!!!!!!!!!!');</script>");
        }
        if (request.getParameter("updated-password") != null) {
            out.println("<script>alert('비밀번호 수정 성공');</script>");
        }
        */
    %>
    
    <%
	    out.println("<script type=\"text/javascript\">");
		out.println("function Init() {");
    
    	BeanMottoUserDTO1.selectId = (String) session.getAttribute("user-id");
        BeanMottoUserDTO2.selectId = (String) session.getAttribute("user-id");
        if (!BeanMottoUserDTO1.selectInSent("1")) {
        	out.println("	setTimeout(function()");
        	out.println("	{");
            out.println("alert('보낸 추천 로딩 실패');");
        	out.println("	}, 50);");
        }
        if (!BeanMottoUserDTO2.selectInSent("0")) {
        	out.println("	setTimeout(function()");
        	out.println("	{");
            out.println("alert('!!!!!!!!!!!!!!');");
        	out.println("	}, 50);");
        }
        if (request.getParameter("updated-password") != null) {
        	out.println("	setTimeout(function()");
        	out.println("	{");
            out.println("alert('비밀번호 수정 성공');");
        	out.println("	}, 50);");
        }
        
        out.println("} window.onload = Init;");
        out.println("</script>");
    %>
    <body>
        <header>
            <img
                    src="https://i.imgur.com/tN82Zm3.png"
                    id="list-title"
                    alt="signup"
            />
        </header>
        <button type="button" class="main-button image-button" onclick="location.href=<%=mainPath%>">
            <img src="https://i.imgur.com/VEmiWjH.png" alt="메인"/>
        </button>
        <button
                class="edit-button"
                type="button"
                onclick="location.href=<%=modifyUserPath%>"
        >
            ✦ 회원정보 수정
        </button>
        <div class="main-container">
            <div class="list-container" id="listContainer1">
                <h2>✦ 내가 추천한 노래</h2>
                <ol class="my-list">
                    <%
                        try {
                            while (BeanMottoUserDTO1.DBMgr.Rs.next()) {
                                out.println("<li> <div class=\"item\" onclick=\"location.href='../recommend/get/play_music.jsp?id=" + BeanMottoUserDTO1.DBMgr.Rs.getString("id") + "&history=0'\">" + BeanMottoUserDTO1.DBMgr.Rs.getString("title") + " - " + BeanMottoUserDTO1.DBMgr.Rs.getString("artist") + "<span class=\"tag\">" + utility.getNameByNum(BeanMottoUserDTO1.DBMgr.Rs.getString("nation"), "nations").get(0) + "</span>" + "</div> </li>");
                            }
                        } catch (SQLException sqlException) {
                            out.println("<script>alert(" + sqlException.getMessage() + ");</script>");
                        }
                    %>
                </ol>
            </div>
            <hr/>
            <div class="list-container" id="listContainer2">
                <h2>✦ 내가 추천 받은 노래</h2>
                <ol class="my-list">
                    <%
                        try {
                            while (BeanMottoUserDTO2.DBMgr.Rs.next()) {
                                out.println("<li> <div class=\"item\" onclick=\"location.href='../recommend/get/play_music.jsp?id=" + BeanMottoUserDTO2.DBMgr.Rs.getString("id") + "&history=0'\">" + BeanMottoUserDTO2.DBMgr.Rs.getString("title") + " - " + BeanMottoUserDTO2.DBMgr.Rs.getString("artist") + "<span class=\"tag\">" + utility.getNameByNum(BeanMottoUserDTO2.DBMgr.Rs.getString("nation"), "nations").get(0) + "</span>" + "</div> </li>");
                            }
                        } catch (SQLException sqlException) {
                            out.println("<script>alert(" + sqlException.getMessage() + ");</script>");
                        }
                    %>
                </ol>
            </div>
        </div>
    </body>
</html>

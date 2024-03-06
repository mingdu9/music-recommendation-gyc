<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <meta5
                name="keywords"
                content="검색 엔진을 위해 웹 페이지와 관련된 키워드 목록을 콤마로 구분해서 명시"
        />
        <meta name="Author" content="문서의 저자를 명시"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>おすすめ</title>
        <link rel="stylesheet" href="index.css"/>
    </head>
    <%! String getRecommendPath = "'recommend/get/get_recommend.jsp'";
        String sendRecommendPath = "'recommend/send/send_recommend.jsp'";
        String signInPath = "'user/auth/signin.jsp'";
        String signUpPath = "'user/auth/signup.jsp'";
        String signOutPath = "'user/auth/signOutAction.jsp'";
        String myPagePath = "'user/mypage.jsp'";
    %>
    <%
    	/*
        if (request.getParameter("withdraw") != null) {
            out.println("<script>alert('회원 탈퇴 성공');</script>");
        } else if (request.getParameter("send-recommend") != null) {
            out.println("<script>alert('추천 보내기 성공');</script>");
        }
    	*/
    %>

    <%
	    out.println("<script type=\"text/javascript\">");
		out.println("function Init() {");
		
    	if (request.getParameter("withdraw") != null) {
        	out.println("	setTimeout(function()");
        	out.println("	{");
            out.println("alert('회원 탈퇴 성공');");
        	out.println("	}, 50);");
        } else if (request.getParameter("send-recommend") != null) {
        	out.println("	setTimeout(function()");
        	out.println("	{");
            out.println("alert('추천 보내기 성공');");
        	out.println("	}, 50);");

        }
    	
    	out.println("} window.onload = Init;");
        out.println("</script>");
    %>
    
    <body>
        <img src="https://i.imgur.com/U9BiGvS.png" id="background-bear"/>
        <%
            if (session.getAttribute("user-id") == null) {
                out.println("<img src=\"https://i.imgur.com/OA6ttGy.png\" id=\"login-plz\"/>");
            }
        %>
        <nav>
            <%
                if (session.getAttribute("user-id") == null) {
            %>
            <button class="auth-button" onclick="location.href=<%=signInPath%>">
                로그인
            </button>
            <button class="auth-button" onclick="location.href=<%=signUpPath%>">
                회원가입
            </button>
            <% } else {
            %>
            <button class="auth-button" onclick="location.href=<%=signOutPath%>">
                로그아웃
            </button>
            <button class="auth-button my-page-button" onclick="location.href=<%=myPagePath%>">
                마이페이지
            </button>
            <%}%>
        </nav>
        <header>
            <img src="https://i.imgur.com/nDnNU4u.png" id="title"/>
        </header>
        <main>
            <button
                    class="recommend-button"
                    onclick="location.href=<%=sendRecommendPath%>"
                    <%
                        if (session.getAttribute("user-id") == null) {
                            out.println("disabled=\"disabled\"");
                        }
                    %>
            >
                ❥ <span> 추천하기</span>
            </button>
            <button
                    class="recommend-button"
                    onclick="location.href=<%=getRecommendPath%>"
                    <%
                        if (session.getAttribute("user-id") == null) {
                            out.println("disabled=\"disabled\"");
                        }
                    %>
            >
                ❥ <span> 추천받기</span>
            </button>
        </main>
    </body>
</html>

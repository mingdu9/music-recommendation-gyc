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
        <link rel="stylesheet" href="modify_user.css"/>
    </head>
    <jsp:useBean id="BeanMottoDTO" class="BeansHome.BeanMottoUserDTO" scope="request"/>
    <%
        /*
    	if (request.getParameter("failed") != null) {
            if (request.getParameter("failed").equals("withdraw")) {
                out.println("<script>alert('회원 탈퇴 실패');</script>");
            }
            if (request.getParameter("failed").equals("update-password")) {
                out.println("<script>alert('비밀 번호 수정 실패');</script>");
            } else if (request.getParameter("failed").equals("unavailable-password")) {
                out.println("<script>alert('유효한 비밀번호가 아닙니다.');</script>");
            }

        }
 		*/
    %>
    
     <%
     	if (request.getParameter("failed") != null) {
     		out.println("<script type=\"text/javascript\">");
     		out.println("function Init() {");
     		
            if (request.getParameter("failed").equals("withdraw")) {
                out.println("alert('회원 탈퇴 실패');");
            }
            if (request.getParameter("failed").equals("update-password")) {
                out.println("alert('비밀 번호 수정 실패');");
            } else if (request.getParameter("failed").equals("unavailable-password")) {
                out.println("alert('유효한 비밀번호가 아닙니다.');");
            }
            
            out.println("} window.onload = Init;");
            out.println("</script>");
        }
    %>
    <body>
        <header>
            <img
                    src="https://i.imgur.com/3Y5eutE.png"
                    id="list-title"
                    alt="signup"
            />
        </header>
        <main>
            <div>
                <form action="updatePasswordAction.jsp">
                    <label for="password" class="input-password label"
                    >✦ 비밀번호</label
                    >
                    <input
                            type="password"
                            name="updatePassword"
                            id="password"
                            class="input-password textbox"
                    />
                    <button type="submit" class="input-password submit-button">
                        확인
                    </button>
                </form>
            </div>
            <div class="divider"></div>
            <a id="withdraw" class="label" onclick="location.href='withdrawActions.jsp'">✦ <span>회원 탈퇴</span></a>
        </main>
        <footer>
            <button type="button" id="main-button" onclick="location.href='../index.jsp'">
                <img src="https://i.imgur.com/VEmiWjH.png" alt="main"/>
            </button>
        </footer>
    </body>
</html>

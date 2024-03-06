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
        <link rel="stylesheet" href="sign.css"/>
    </head>
    <jsp:useBean id="BeanMottoUserDTO" class="BeansHome.BeanMottoUserDTO" scope="request"/>
    <%! String mainPath = "'../../index.jsp'"; %>
    <%
        /*
    	if (request.getParameter("signed-up") != null) {
            out.println("<script>alert('회원가입 성공');</script>");
        }
        if (request.getParameter("failed") != null) {
            out.println("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.');</script>");
        }
        */
    %>
    <%
	    out.println("<script type=\"text/javascript\">");
		out.println("function Init() {");
		
    	if (request.getParameter("signed-up") != null) {
        	out.println("	setTimeout(function()");
        	out.println("	{");
            out.println("alert('회원가입 성공');");
        	out.println("	}, 50);");
        }
        if (request.getParameter("failed") != null) {
        	out.println("	setTimeout(function()");
        	out.println("	{");
            out.println("alert('아이디 또는 비밀번호가 일치하지 않습니다.');");
        	out.println("	}, 50);");
        }
        
        out.println("} window.onload = Init;");
        out.println("</script>");
    %>
    <body>
        <form action="signInAction.jsp" method="post">
            <header>
                <img
                        src="https://i.imgur.com/1qhBeLZ.png"
                        id="signin-title"
                        alt="login"
                />
            </header>
            <br/>
            <table>
                <tr>
                    <th class="label">
                        <label for="username">❥ 아이디</label>
                    </th>
                    <th>
                        <input
                                type="text"
                                name="signInId"
                                id="username"
                                class="textbox"
                        />
                    </th>
                </tr>
                <tr>
                    <th></th>
                    <th>
                        <div class="text-conditons none">
                            ※영 소문자, 숫자 포함 6~12자
                        </div>
                    </th>
                </tr>
                <tr class="tr-blank"></tr>

                <tr>
                    <th class="label">
                        <label for="password">❥ 비밀번호 </label>
                        <div></div>
                    </th>
                    <th>
                        <input
                                type="password"
                                name="signInPassword"
                                id="password"
                                class="textbox"
                        />
                    </th>
                </tr>
                <tr>
                    <th></th>
                    <th>
                        <div class="text-conditons none">
                            ※영 소문자, 특수문자(!@#$%&), 숫자 포함 5~16자
                        </div>
                    </th>
                </tr>
            </table>
            <br/>
            <button type="submit" class="login-button image-button">
                <img src="https://i.imgur.com/O5Fkv7z.png" alt="로그인"/>
            </button>
            <button
                    type="button"
                    class="main-button image-button"
                    onclick="location.href=<%=mainPath%>"
            >
                <img src="https://i.imgur.com/VEmiWjH.png" alt="메인"/>
            </button>
        </form>
    </body>
</html>

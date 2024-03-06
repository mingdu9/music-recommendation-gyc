<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>おすすめ</title>
        <link rel="stylesheet" href="sign.css"/>
    </head>
	<jsp:useBean id="BeanMottoUserDTO" class="BeansHome.BeanMottoUserDTO" scope="request"/>
    <%!
        String mainPath = "'../../index.jsp'";
        String loginPath = "signin.jsp";
    %>

    <%
        /*
    	String signUpId = request.getParameter("signUpId");
        String signUpPassword = request.getParameter("signUpPassword");
        
        if (signUpId != null && signUpPassword != null) 
        {
            if (signUpId.matches("^(?=.*[0-9])(?=.*[a-z]).{6,12}$") &&
                    signUpPassword.matches("^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$%&]).{5,16}$")) 
            {
                BeanMottoUserDTO.signUpId = signUpId;
                BeanMottoUserDTO.signUpPassword = signUpPassword;
                if (BeanMottoUserDTO.signUp()) 
                {
                    response.sendRedirect(loginPath + "?signed-up=1");
                } 
                else 
                {
                    out.println("<script>alert('존재하는 회원입니다.');</script>");
                }
            } 
            else 
            {
                out.println("<script>alert('아이디 혹은 비밀번호가 유효하지 않습니다.');</script>");
            }
        }
        */
    %>
    
        <%
        String signUpId = "";
        String signUpPassword = request.getParameter("signUpPassword");

        if (request.getParameter("signUpId") != null)
        	signUpId = request.getParameter("signUpId");
        
        if (signUpId != null && signUpPassword != null) 
        {
        	out.println("<script type=\"text/javascript\">");
        	out.println("function Init() {");
        	
        	if (signUpId.matches("^(?=.*[0-9])(?=.*[a-z]).{6,12}$") &&
                    signUpPassword.matches("^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$%&]).{5,16}$")) 
            {
                BeanMottoUserDTO.signUpId = signUpId;
                BeanMottoUserDTO.signUpPassword = signUpPassword;
                if (BeanMottoUserDTO.signUp()) 
                {
                    response.sendRedirect(loginPath + "?signed-up=1");
                } 
                else 
                {
                	out.println("	setTimeout(function()");
                	out.println("	{");
                    out.println("alert('존재하는 회원입니다.');");
                	out.println("	}, 50);");                
                }
            } 
            else 
            {
            	out.println("	setTimeout(function()");
            	out.println("	{");
                out.println("alert('아이디 혹은 비밀번호가 유효하지 않습니다.');");
            	out.println("	}, 50);");                
            }
        	
        	out.println("} window.onload = Init;");
            out.println("</script>");
        }
    %>


    <body>
        <form action="">
            <header>
                <img
                        src="https://i.imgur.com/oTmhOJU.png"
                        id="signup-title"
                        alt="signup"
                />
            </header>
            <table>
                <tr>
                    <th class="label">
                        <label for="username">❥ 아이디</label>
                    </th>
                    <th>
                        <input
                                type="text"
                                name="signUpId"
                                id="username"
                                class="textbox"
                                value="<%=signUpId %>"
                        />
                    </th>
                </tr>
                <tr>
                    <th></th>
                    <th>
                        <div class="text-conditons">
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
                                name="signUpPassword"
                                id="password"
                                class="textbox"
                        />
                    </th>
                </tr>
                <tr>
                    <th></th>
                    <th>
                        <div class="text-conditons">
                            ※영 소문자, 특수문자(!@#$%&), 숫자 포함 5~16자
                        </div>
                    </th>
                </tr>
            </table>
            <br/>
            <button type="submit" class="signup-button image-button">
                <img src="https://i.imgur.com/d1SNSvP.png" alt="회원가입"/>
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

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
        <link rel="stylesheet" href="play_music.css"/>
        <link rel="stylesheet" href="../../common.css"/>
    </head>
    <jsp:useBean id="BeanMottoRecommendDTO1" class="BeansHome.BeanMottoRecommendDTO" scope="request"/>
    <jsp:useBean id="BeanMottoRecommendDTO2" class="BeansHome.BeanMottoRecommendDTO" scope="request"/>

    <%
        String link = null;
        BeanMottoRecommendDTO1.inUserId = (String) session.getAttribute("user-id");
        BeanMottoRecommendDTO1.inRecommendId = Integer.parseInt(request.getParameter("id"));

        try {
            if (BeanMottoRecommendDTO1.selectRecommend()) {
                link = BeanMottoRecommendDTO1.DBMgr.Rs.getString("LINK");
                link = link.split("/")[3];
                BeanMottoRecommendDTO2.inUserId = BeanMottoRecommendDTO1.inUserId;
                BeanMottoRecommendDTO2.inRecommendId = BeanMottoRecommendDTO1.inRecommendId;
                if (request.getParameter("history").equals("1") && !BeanMottoRecommendDTO2.insertHistory()) {
                    BeanMottoRecommendDTO2.addFrequency();
                    out.println("<script>alert('히스토리 생성 실패');</script>");
                }
            } else {
                out.println("<script>alert('노래 로딩 실패ㅠㅠ');</script>");
            }
        } catch (SQLException sql) {
            out.println("<script>alert(" + sql.getMessage() + ");</script>");
        }
    %>


    <%! String mainPath = "'../../index.jsp'"; %>
    <body>
        <header>
            <img
                    src="https://i.imgur.com/eYKJNs8.png"
                    id="list-title"
                    alt="signup"
            />
        </header>
        <div class="main-container">
            <div class="play-container">
                <h1>☞ <%=BeanMottoRecommendDTO1.DBMgr.Rs.getString("title")%>
                    - <%=BeanMottoRecommendDTO1.DBMgr.Rs.getString("artist")%>
                </h1>
                <iframe
                        width="560"
                        height="315"
                        src="https://www.youtube.com/embed/<%=link %>"
                        title="YouTube video player"
                        frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                        allowfullscreen
                ></iframe>
                <button type="button" class="main-button image-button" onclick="location.href=<%=mainPath%>">
                    <img src="https://i.imgur.com/VEmiWjH.png" alt="메인"/>
                </button>
            </div>
        </div>
    </body>
</html>

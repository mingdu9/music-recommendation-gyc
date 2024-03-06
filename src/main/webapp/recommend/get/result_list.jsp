<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
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
        <link rel="stylesheet" href="result_list.css"/>
        <link rel="stylesheet" href="../../common.css"/>
    </head>
    <jsp:useBean id="recommendDto" class="BeansHome.BeanMottoRecommendDTO" scope="request"/>
    <jsp:useBean id="utilityDto" class="BeansHome.BeanUtilityDTO" scope="request"/>
    <%! String mainPath = "'../../index.jsp'"; %>
    <%
        recommendDto.inNation = request.getParameter("nations").isEmpty() ? null : request.getParameter("nations");
        recommendDto.inGenre = request.getParameter("genres").isEmpty() ? null : request.getParameter("genres");
        recommendDto.inSeason = request.getParameter("seasons");
        recommendDto.inTimezone = request.getParameter("timezones");
        recommendDto.inCircum = request.getParameter("circums");

        if (!recommendDto.getRecommend()) {
            out.println("<script>alert('겟 실패ㅠㅠ');</script>");
        }

    %>
    <body>
        <header>
            <img
                    src="https://i.imgur.com/mu1qBCw.png"
                    id="list-title"
                    alt="signup"
            />
        </header>
        <button type="button" class="main-button image-button" onclick="location.href=<%=mainPath%>">
            <img src="https://i.imgur.com/VEmiWjH.png" alt="메인"/>
        </button>
        <main>
            <ol>
                <%
                    try {
                        while (recommendDto.DBMgr.Rs.next()) {
                            String num = null;
                            num = recommendDto.DBMgr.Rs.getString("nation");
                            ArrayList<String> tagNames = new ArrayList<>(utilityDto.getNameByNum(num, "nations"));
                            num = recommendDto.DBMgr.Rs.getString("genre");
                            tagNames.addAll(utilityDto.getNameByNum(num, "genres"));
                            num = recommendDto.DBMgr.Rs.getString("season") == null ? null : recommendDto.DBMgr.Rs.getString("season");
                            tagNames.addAll(utilityDto.getNameByNum(num, "seasons"));
                            num = recommendDto.DBMgr.Rs.getString("timezone") == null ? null : recommendDto.DBMgr.Rs.getString("timezone");
                            ;
                            tagNames.addAll(utilityDto.getNameByNum(num, "timezones"));
                            num = recommendDto.DBMgr.Rs.getString("circum");
                            tagNames.addAll(utilityDto.getNameByNum(num, "circums"));

                            out.println("<li> <div onclick=\"location.href='play_music.jsp?id=" + recommendDto.DBMgr.Rs.getString("id") + "&history=1'\">" + recommendDto.DBMgr.Rs.getString("title") + " - " + recommendDto.DBMgr.Rs.getString("artist") + "<div class=\"tag-list\" >");
                            for (String name : tagNames) {
                                out.println("<span class=\"tag\">" + name + "</span>");
                            }
                            out.println("</div> </div> </li>");
                        }
                    } catch (Exception Exception) {
                        out.println("<script>alert(" + Exception.getMessage() + ");</script>");
                    }
                %>
            </ol>
        </main>
    </body>
</html>

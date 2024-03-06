<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <%----------------------------------------------------------------------
        [HTML Page - 헤드 영역]
        --------------------------------------------------------------------------%>
        <%--<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">--%>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
        <meta name="Description" content="검색 엔진을 위해 웹 페이지에 대한 설명을 명시"/>
        <meta name="keywords" content="검색 엔진을 위해 웹 페이지와 관련된 키워드 목록을 콤마로 구분해서 명시"/>
        <meta name="Author" content="문서의 저자를 명시"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Basic Page</title>
    </head>
    <jsp:useBean id="recommendDto" class="BeansHome.BeanMottoRecommendDTO" scope="request"/>
    <body>
        <%
            recommendDto.inTitle = request.getParameter("title").isEmpty() ? null : request.getParameter("title");
            recommendDto.inArtist = request.getParameter("artist").isEmpty() ? null : request.getParameter("artist");
            recommendDto.inUserId = (String) session.getAttribute("user-id");
            recommendDto.inLink = request.getParameter("youtube-link").isEmpty() ? null : request.getParameter("youtube-link");
            recommendDto.inGenre = request.getParameter("genres").isEmpty() ? null : request.getParameter("genres");
            recommendDto.inSeason = request.getParameter("seasons");
            recommendDto.inTimezone = request.getParameter("timezones");
            recommendDto.inCircum = request.getParameter("circums");
            recommendDto.inFrequency = 0;
            recommendDto.inNation = request.getParameter("nations").isEmpty() ? null : request.getParameter("nations");

            if (!recommendDto.inLink.startsWith("https://youtu.be/"))
            {
                //response.sendRedirect("send_recommend.jsp?failed=link-unavailable");
                
                String sUrl = "send_recommend.jsp?failed=link-unavailable";
                
                sUrl = String.format("%s&youtube-link=%s&title=%s&artist=%s", sUrl,
                															  request.getParameter("youtube-link"),
                															  request.getParameter("title"),
                															  request.getParameter("artist"));
                response.sendRedirect(sUrl);
           }
            else if (recommendDto.insertRecommend())
            {
                response.sendRedirect("../../index.jsp?send-recommend=1");
            }
            else
            {
                //response.sendRedirect("send_recommend.jsp?failed=1");
                
                String sUrl = "send_recommend.jsp?failed=1";
                
                sUrl = String.format("%s&youtube-link=%s&title=%s&artist=%s", sUrl,
						  request.getParameter("youtube-link"),
						  request.getParameter("title"),
						  request.getParameter("artist"));

                response.sendRedirect(sUrl);
           }
        %>
        <br/>
    </body>
</html>

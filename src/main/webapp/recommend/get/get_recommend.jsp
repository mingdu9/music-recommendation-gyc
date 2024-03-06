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
        <link rel="stylesheet" href="../recommend.css"/>
        <script src="../recommend.js"></script>
    </head>
    <%! String mainPath = "'../../index.jsp'";
        String recommendPath = "'../recent_recommend.jsp'";
    %>
    <jsp:useBean id="BeanMottoDTO" class="BeansHome.BeanMottoRecommendDTO" scope="request"></jsp:useBean>
    <body>
        <img src="https://i.imgur.com/U9BiGvS.png" id="background-bear"/>
        <header>
            <img
                    src="https://i.imgur.com/mu1qBCw.png"
                    alt="추천받기"
                    id="title"
            />
        </header>
        <button type="button" class="main-button image-button" onclick="location.href=<%=mainPath%>">
            <img src="https://i.imgur.com/VEmiWjH.png" alt="메인"/>
        </button>
        <button type="button" title="최근 추천 목록" class="recent-button image-button" onclick="location.href=<%=recommendPath%>">
            <img src="https://i.imgur.com/yE53XKU.png" alt="최근추천"/>
        </button>
        <main>
            <form name="form2" action="result_list.jsp" method="post">
                <table class="main_table">
                    <tr>
                        <td colspan="2" class="label">✦ 국가</td>
                        <td></td>
                        <td colspan="2" class="label">✦ 장르</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="text" name="nations" id="nations" class="hidden" required="required">
                            <div class="tag-container">
                                <input
                                        type="button"
                                        value="#한국"
                                        class="tag nations"
                                        onclick="ChangeColorOnly(this); SetNationsId(this, 1); IsCheckNationsAll();"
                                />
                                <input
                                        type="button"
                                        value="#미국"
                                        class="tag nations"
                                        onclick="ChangeColorOnly(this); SetNationsId(this, 2); IsCheckNationsAll();"
                                />
                                <input
                                        type="button"
                                        value="#일본"
                                        class="tag nations"
                                        onclick="ChangeColorOnly(this); SetNationsId(this, 3); IsCheckNationsAll();"
                                />
                                <input
                                        type="button"
                                        value="#중국"
                                        class="tag nations"
                                        onclick="ChangeColorOnly(this); SetNationsId(this, 4); IsCheckNationsAll();"
                                />
                                <input
                                        type="button"
                                        value="#영국"
                                        class="tag nations"
                                        onclick="ChangeColorOnly(this); SetNationsId(this, 5); IsCheckNationsAll();"
                                />
                                <input
                                        type="button"
                                        value="#프랑스"
                                        class="tag nations"
                                        onclick="ChangeColorOnly(this); SetNationsId(this, 6); IsCheckNationsAll();"
                                />
                                <input
                                        type="button"
                                        value="#대만"
                                        class="tag nations"
                                        onclick="ChangeColorOnly(this); SetNationsId(this, 7); IsCheckNationsAll();"
                                />
                                <input
                                        type="button"
                                        value="#남미"
                                        class="tag nations"
                                        onclick="ChangeColorOnly(this); SetNationsId(this, 8); IsCheckNationsAll();"
                                />
                            </div>
                        </td>
                        <td></td>
                        <td colspan="2">
                            <input type="text" name="genres" id="genres" class="hidden" required="required">
                            <div class="tag-container">
                                <input
                                        type="button"
                                        value="#락"
                                        class="tag genres"
                                        onclick="ChangeColor(this); SetGenresId(this, 5); IsCheckGenresAll();"
                                />
                                <input
                                        type="button"
                                        value="#힙합"
                                        class="tag genres"
                                        onclick="ChangeColor(this); SetGenresId(this, 1); IsCheckGenresAll();"
                                />
                                <input
                                        type="button"
                                        value="#밴드"
                                        class="tag genres"
                                        onclick="ChangeColor(this); SetGenresId(this, 8); IsCheckGenresAll();"
                                />
                                <input
                                        type="button"
                                        value="#댄스"
                                        class="tag genres"
                                        onclick="ChangeColor(this); SetGenresId(this, 4); IsCheckGenresAll();"
                                />
                                <input
                                        type="button"
                                        value="#메탈"
                                        class="tag genres"
                                        onclick="ChangeColor(this); SetGenresId(this, 6); IsCheckGenresAll();"
                                />
                                <input
                                        type="button"
                                        value="#재즈"
                                        class="tag genres"
                                        onclick="ChangeColor(this); SetGenresId(this, 12); IsCheckGenresAll();"
                                />
                                <input
                                        type="button"
                                        value="#발라드"
                                        class="tag genres"
                                        onclick="ChangeColor(this); SetGenresId(this, 2); IsCheckGenresAll();"
                                />
                                <input
                                        type="button"
                                        value="#클래식"
                                        class="tag genres"
                                        onclick="ChangeColor(this); SetGenresId(this, 3); IsCheckGenresAll();"
                                />
                                <input
                                        type="button"
                                        value="#하우스"
                                        class="tag genres"
                                        onclick="ChangeColor(this); SetGenresId(this, 7); IsCheckGenresAll();"
                                />
                                <input
                                        type="button"
                                        value="#뉴에이지"
                                        class="tag genres"
                                        onclick="ChangeColor(this); SetGenresId(this, 9); IsCheckGenresAll();"
                                />
                                <input
                                        type="button"
                                        value="#아이돌"
                                        class="tag genres"
                                        onclick="ChangeColor(this); SetGenresId(this, 10); IsCheckGenresAll();"
                                />
                                <input
                                        type="button"
                                        value="#OST"
                                        class="tag genres"
                                        onclick="ChangeColor(this); SetGenresId(this, 11); IsCheckGenresAll();"
                                />
                                <input
                                        type="button"
                                        value="#인디"
                                        class="tag genres"
                                        onclick="ChangeColor(this); SetGenresId(this, 21); IsCheckGenresAll();"
                                />
                                <input
                                        type="button"
                                        value="#시티팝"
                                        class="tag genres"
                                        onclick="ChangeColor(this); SetGenresId(this, 23); IsCheckGenresAll();"
                                />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">✦ 계절</td>
                        <td class="label">✦ 시간</td>
                        <td></td>
                        <td colspan="2" class="label">✦ 상황</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="seasons" id="seasons" class="hidden">
                            <div class="tag-container">
                                <input
                                        type="button"
                                        value="#봄"
                                        class="tag seasons"
                                        onclick="ChangeColor(this); SetSeasonsId(this, 1); IsCheckSeasonsAll();"
                                />
                                <input
                                        type="button"
                                        value="#여름"
                                        class="tag seasons"
                                        onclick="ChangeColor(this); SetSeasonsId(this, 2); IsCheckSeasonsAll();"
                                />
                                <input
                                        type="button"
                                        value="#가을"
                                        class="tag seasons"
                                        onclick="ChangeColor(this); SetSeasonsId(this, 3); IsCheckSeasonsAll();"
                                />
                                <input
                                        type="button"
                                        value="#겨울"
                                        class="tag seasons"
                                        onclick="ChangeColor(this); SetSeasonsId(this, 4); IsCheckSeasonsAll();"
                                />
                            </div>
                        </td>
                        <td>
                            <input type="text" name="timezones" id="timezones" class="hidden">
                            <div class="tag-container">
                                <input
                                        type="button"
                                        value="#새벽"
                                        class="tag timezones"
                                        onclick="ChangeColor(this); SetTimezonesId(this, 1); IsCheckTimezonesAll();"
                                />
                                <input
                                        type="button"
                                        value="#아침"
                                        class="tag timezones"
                                        onclick="ChangeColor(this); SetTimezonesId(this, 2); IsCheckTimezonesAll();"
                                />
                                <input
                                        type="button"
                                        value="#오후"
                                        class="tag timezones"
                                        onclick="ChangeColor(this); SetTimezonesId(this, 3); IsCheckTimezonesAll();"
                                />
                                <input
                                        type="button"
                                        value="#밤"
                                        class="tag timezones"
                                        onclick="ChangeColor(this); SetTimezonesId(this, 4); IsCheckTimezonesAll();"
                                />
                            </div>
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <input type="text" name="circums" id="circums" class="hidden" required="required">
                            <div class="tag-container">
                                <input
                                        type="button"
                                        value="#운동"
                                        class="tag circums"
                                        onclick="ChangeColor(this); SetCircumsId(this, 1); IsCheckCircumsAll();"
                                />
                                <input
                                        type="button"
                                        value="#공부"
                                        class="tag circums"
                                        onclick="ChangeColor(this); SetCircumsId(this, 2); IsCheckCircumsAll();"
                                />
                                <input
                                        type="button"
                                        value="#출근"
                                        class="tag circums"
                                        onclick="ChangeColor(this); SetCircumsId(this, 4); IsCheckCircumsAll();"
                                />
                                <input
                                        type="button"
                                        value="#퇴근"
                                        class="tag circums"
                                        onclick="ChangeColor(this); SetCircumsId(this, 3); IsCheckCircumsAll();"
                                />
                                <input
                                        type="button"
                                        value="#집중"
                                        class="tag circums"
                                        onclick="ChangeColor(this); SetCircumsId(this, 5); IsCheckCircumsAll();"
                                />
                                <input
                                        type="button"
                                        value="#휴가"
                                        class="tag circums"
                                        onclick="ChangeColor(this); SetCircumsId(this, 6); IsCheckCircumsAll();"
                                />
                                <input
                                        type="button"
                                        value="#여행"
                                        class="tag circums"
                                        onclick="ChangeColor(this); SetCircumsId(this, 7); IsCheckCircumsAll();"
                                />
                                <input
                                        type="button"
                                        value="#드라이브"
                                        class="tag circums"
                                        onclick="ChangeColor(this); SetCircumsId(this, 8); IsCheckCircumsAll();"
                                />
                                <input
                                        type="button"
                                        value="#산책"
                                        class="tag circums"
                                        onclick="ChangeColor(this); SetCircumsId(this, 9); IsCheckCircumsAll();"
                                />
                                <input
                                        type="button"
                                        value="#낚시"
                                        class="tag circums"
                                        onclick="ChangeColor(this); SetCircumsId(this, 10); IsCheckCircumsAll();"
                                />
                                <input
                                        type="button"
                                        value="#독서"
                                        class="tag circums"
                                        onclick="ChangeColor(this); SetCircumsId(this, 11); IsCheckCircumsAll();"
                                />
                                <input
                                        type="button"
                                        value="#카페"
                                        class="tag circums"
                                        onclick="ChangeColor(this); SetCircumsId(this, 12); IsCheckCircumsAll();"
                                />
                                <input
                                        type="button"
                                        value="#도서관"
                                        class="tag circums"
                                        onclick="ChangeColor(this); SetCircumsId(this, 13); IsCheckCircumsAll();"
                                />
                                <input
                                        type="button"
                                        value="#코딩"
                                        class="tag circums"
                                        onclick="ChangeColor(this); SetCircumsId(this, 14); IsCheckCircumsAll();"
                                />
                                <input
                                        type="button"
                                        value="#힐링"
                                        class="tag circums"
                                        onclick="ChangeColor(this); SetCircumsId(this, 15); IsCheckCircumsAll();"
                                />
                                <input
                                        type="button"
                                        value="#추억"
                                        class="tag circums"
                                        onclick="ChangeColor(this); SetCircumsId(this, 16); IsCheckCircumsAll();"
                                />
                            </div>
                        </td>
                    </tr>
                </table>
                <button
                        type="submit"
                        id="receive-button"
                        class="recommend-button"
                >
                    <img src="https://i.imgur.com/i0nM7Xq.png"/>
                </button>
            </form>
        </main>
    </body>
</html>

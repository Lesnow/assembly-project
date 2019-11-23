<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>użytkownicy</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/navigation/header.jsp"/>

<div class="container" style="margin-top:60px">
    <input type="button" class="btn btn-primary btn-block" onclick="location.href='/user/add';" value = "dodaj nowego użytkownika" />
    <h2>Lista użytkowników</h2>

    <table class="table table-hover table-condenced">
        <thead>
            <tr>
                <th>#</th>
                <th>Email</th>
                <th>blokada</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="user" varStatus="loop">
                <tr>
                <td>
                    ${loop.count}
                </td>
                <td>
                    ${user.email}
                </td>
                <td>
                    <a href="/user/toggleLock/${user.id}">
                        <c:choose>
                            <c:when test="${user.active == 1}">
                                <span class="glyphicon glyphicon glyphicon-lock"> blokuj</span>
                            </c:when>
                            <c:otherwise>
                                <span class="glyphicon glyphicon glyphicon-ok-sign"> odblokuj</span>
                            </c:otherwise>
                        </c:choose>
                    </a>
                </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>





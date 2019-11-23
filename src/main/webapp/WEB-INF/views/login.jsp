<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/navigation/header.jsp"/>


    <div class="container" style="margin-top:100px">
        <div class="form-group">
            <sec:authorize access="!isAuthenticated()">
            <form class="form-horizontal" method="post" action="/login">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="email">Email:</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" id="email" placeholder="Enter email" name="username">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Password:</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password">
                    </div>
                </div>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">zaloguj</button>
                    </div>
                </div>
            </form>
            </sec:authorize>

            <sec:authorize access="isAuthenticated()">
            <h1>Jesteś zalogowany jako: <sec:authentication property="name"/></h1>
            <div class="container">
                <sec:authentication property="authorities" var="roles" scope="page" />
                uprawnienia:
                <ul>
                    <c:forEach var="role" items="${roles}">
                        <li>${role}</li>
                        </c:forEach>
                </ul>
            </div>
                <form method="post" action="<c:url value="/logout" />">
                <sec:csrfInput/>
                <button type="submit" class="btn btn-primary btn-block">wyloguj</button>
                <input type="button" class="btn btn-primary btn-block" onclick="location.href='/'" value = "powrót" />
            </form>
            </sec:authorize>
        </div>
    </div>
</body>
</html>
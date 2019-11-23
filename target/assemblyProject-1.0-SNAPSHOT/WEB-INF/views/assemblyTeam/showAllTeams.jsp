<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>ekipy montażowe</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/navigation/header.jsp"/>

<div class="container" style="margin-top:40px">
    <div class="row">
        <div class="col-sm-8">
            <h2>Lista ekip montażowych</h2>
        </div>
        <div class="col-sm-4">
            <input type="button" class="btn navbar-btn btn-primary btn-block" onclick="location.href='/team/add';" value = "dodaj nowego podwykonawce" />
        </div>
    </div>



    <table class="table table-hover">
        <thead>
        <tr>
            <th>Nazwa firmy</th>
            <th>telefon kontaktowy</th>
            <th>informacje dodatkowe</th>
            <th>współpraca</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${teams}" var="team">
            <c:choose>
                <c:when test="${team.active == true}">
                    <tr class = "active">
                </c:when>
                <c:when test="${team.active == false}">
                    <tr class = "danger">
                </c:when>
                <c:otherwise>
                    <tr class = "info">
                </c:otherwise>
            </c:choose>
            <td>${team.teamName}</td>
            <td>${team.phoneNumber}</td>
            <td>${team.additionalInfo}</td>
            <td>
                <c:choose>
                    <c:when test="${team.active}">
                        <span class="glyphicon glyphicon-ok"></span>
                    </c:when>
                    <c:otherwise>
                        <span class="glyphicon glyphicon-remove"></span>
                    </c:otherwise>
                </c:choose>
            </td>
            <td><a href="/team/update/${team.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
            <td><a href="/team/delete/${team.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>





<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>dodaj użytkownika</title>
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
        <h2>Dane urzytkownika</h2>

            <form:form method="post" modelAttribute="user" class="form-horizontal">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="emailId">Email</label>
                    <div class="col-sm-10">
                        <form:input path="email" id="emailId" type="email" class="form-control" placeholder="wpisz swój adres email"/>
                        <form:errors path="email" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="passwordId">Password</label>
                    <div class="col-sm-10">

                        <form:input path="password" id="passwordId" type="password" class="form-control" placeholder="wpisz nowe hasło"/>
                        <form:errors path="password" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="nickId">Nick</label>
                    <div class="col-sm-10">
                        <form:input path="nick" id="nickId" type="text" class="form-control" placeholder="podaj skróconą nazwe, max 4 znaki" />
                        <form:errors path="nick" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">zapisz</button>
                    </div>
                </div>
            </form:form>
    </div>
</div>
</body>
</html>
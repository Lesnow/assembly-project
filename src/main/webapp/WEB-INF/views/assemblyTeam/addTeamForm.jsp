<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Dodaj ekipę monażową</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/navigation/header.jsp"/>

<div class="container top-margin">
    <div class="form-group">
        <h2>Dane urzytkownika</h2>

        <form:form method="post" modelAttribute="team" class="form-horizontal">
            <div class="form-group">
                <label class="control-label col-sm-2" for="assemblyTeamNameId">Nazwa firmy</label>
                <div class="col-sm-6">
                    <form:input path="teamName" id="assemblyTeamNameId" type="text" class="form-control" placeholder="wpisz nazwę nowego podwykonawcy"/>
                    <form:errors path="teamName" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="phoneNumberId">Telefon kontaktowy</label>
                <div class="col-sm-6">

                    <form:input path="phoneNumber" id="phoneNumberId" type="text" class="form-control" placeholder="wpisz numer telefonu do kontaktu z nowym podwykonawcą"/>
                    <form:errors path="phoneNumber" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="additionalInfoId">Informacje dodatkowe</label>
                <div class="col-sm-6">
                    <form:input path="additionalInfo" id="additionalInfoId" type="text" class="form-control" placeholder="wpisz dodatkowe informacje" />
                    <form:errors path="additionalInfo"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="activeId">Współpraca</label>
                <div class="col-sm-6">
                    <form:checkbox path="active" value="true" id="activeId"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">zapisz</button>
                    <button type="button" class="btn btn-default" onclick="location.href='/team/all';">powrót</button>
                </div>
            </div>
        </form:form>
    </div>
</div>






</body>
</html>

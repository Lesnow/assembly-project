<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Nowy status</title>
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
        <h2>Status</h2>

        <form:form method="post" modelAttribute="status" class="form-horizontal">
            <div class="form-group">
                <label class="control-label col-sm-2" for="assemblyTeamNameId">Nazwa firmy</label>
                <div class="col-sm-6">
                    <form:input path="statusName" id="statusNameId" type="text" class="form-control" placeholder="wpisz nazwę nowego statusu"/>
                    <form:errors path="statusName"/>
                </div>
            </div>
          
            <div class="form-group">
                <label class="control-label col-sm-2" for="additionalInfoId">Informacje dodatkowe</label>
                <div class="col-sm-6">
                    <form:input path="description" id="descriptionId" type="text" class="form-control" placeholder="wpisz dodatkowe informacje" />
                    <form:errors path="description"/>
                </div>
            </div>
         
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">zapisz</button>
                    <button type="button" class="btn btn-default" onclick="location.href='/projects/all';">powrót</button>
                </div>
            </div>
        </form:form>
    </div>
</div>

</body>
</html>

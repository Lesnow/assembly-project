<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>dodaj projekt</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<jsp:include page="/WEB-INF/views/navigation/header.jsp"/>

<body>
<div class="container top-margin">
    <div class="form-group">
        <h2>Dane dotyczące projektu</h2>
        <form:form method="post" modelAttribute="project" class="form-horizontal">

            <div class="form-group">
                <label class="control-label col-sm-2" for="projectNumberId">Numer projektu</label>
                <div class="col-sm-10">
                    <form:input path="projectNumber" id="projectNumberId" type="text" class="form-control" placeholder="wpisz numer projektu"/>
                    <form:errors path="projectNumber" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="adressId">Adres instalacji</label>
                <div class="col-sm-10">
                    <form:input path="adress" id="adressId" type="text" class="form-control" placeholder="wpisz adres pod którym będzie montowane urządzenie"/>
                    <form:errors path="adress" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="factoryNumberId">Numer fabryczny</label>
                <div class="col-sm-10">
                    <form:input path="factoryNumber" id="factoryNumberId" type="text" class="form-control" placeholder="wpisz numer fabryczny producenta"/>
                    <form:errors path="factoryNumber" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="descriptionId">Opis</label>
                <div class="col-sm-10">
                    <form:textarea path="description" id="descriptionId" rows="4" class="form-control" placeholder="wpisz dodatkowe informacje"/>
                    <form:errors path="description" />
                </div>
            </div>
   <%--         <div class="form-group">
                <label class="control-label col-sm-2" for="statusId">Status</label>
                <div class="col-sm-10">
                    <form:select path="status.id" id="statusId" items="${statusesList}" itemValue="id" itemLabel="statusName" class="form-control"/>
                    <form:errors path="status" />
                </div>
                --%> 
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="priorityId">Priorytet</label>
                <div class="col-sm-10">
                    <form:select path="priority" id="priorityId" items="${priorities}" itemValue="id" itemLabel="priority" class="form-control"/>
                    <form:errors path="priority" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="assemblyTeamId">Ekipa montażowa</label>
                <div class="col-sm-10">
                    <form:select path="assemblyTeam.id" id="assemblyTeamId" items="${assemblyTeamList}" itemValue="id" itemLabel="teamName" class="form-control"/>
                    <form:errors path="assemblyTeam.id" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="transportId">Data dostawy</label>
                <div class="col-sm-10">
                    <form:input type="date" path="transportDate" id="transportId"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="endId">data zakończenia projektu</label>
                <div class="col-sm-10">
                    <form:input type="date" path="endDate"  id="endId"/>
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
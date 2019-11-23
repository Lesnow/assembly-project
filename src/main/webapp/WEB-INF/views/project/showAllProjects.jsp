<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <title>Wszystkie projekty</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

<body>

<jsp:include page="/WEB-INF/views/navigation/header.jsp"/>

<div class="container top-margin" >

    <input type="button" class="btn btn-primary btn-block" onclick="location.href='/project/add';" value = "dodaj nowy projekt" />

    <h2>Lista projektów</h2>
    <table class="table table-hover table-condenced">
        <thead>
        <tr>
            <th>#</th>
            <th>Projekt</th>
            <th>Numer fabryczny</th>
            <th>Priorytet</th>
            <th>Status</th>
            <th>Adres projektu</th>
            <th>Prowadzący</th>
            <th>Montaż</th>
            <th>Dostawa</th>
            <th>Data zakończenia</th>
            <th>edycja</th>
            <th>usuń</th>
        </tr>
        </thead>
        <tbody>

            <c:forEach items="${projects}" var="project" varStatus="loop">
                <c:choose>
                    <c:when test="${fourWeeksFromNow > project.endDate}">
                        <tr class="danger">
                    </c:when>
                    <c:otherwise>
                        <tr>
                    </c:otherwise>
                </c:choose>

                            <td>
                                ${loop.count}
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty project.description}">
                                        <a href="#" title="Informacje dodatkowe" data-toggle="popover" data-trigger="focus" data-placement="down" data-content="${project.description}">${project.projectNumber}</a>
                                    </c:when>
                                    <c:otherwise>
                                        ${project.projectNumber}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                ${project.factoryNumber}
                            </td>
                            <td>
                                <a href="/project/togglePriority/${project.id}">
                                    <c:choose>
                                        <c:when test="${project.priority == 2}">
                                            <span class="glyphicon glyphicon-exclamation-sign"></span>
                                        </c:when>
                                        <c:when test="${project.priority == 3}">
                                            <span class="glyphicon glyphicon-fire"></span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="glyphicon glyphicon-sunglasses"></span>
                                        </c:otherwise>
                                    </c:choose>
                                </a>
                            </td>
                            <td>
                                ${project.status.statusName}
                            </td>
                            <td>
                                ${project.adress}
                            </td>

                <c:choose>
                    <c:when test="${not empty project.user}">
                        <c:choose>
                            <c:when test ="${project.user.id == curentUser.id}">
                                <td><a href="/project/detachCurrentUser/${project.id}"><span class="glyphicon glyphicon-remove"></span>  </a></td>
                            </c:when>
                            <c:otherwise>
                                <td>${project.user.nick}</td>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                        <c:otherwise>
                            <td><a href="/project/attachCurrentUser/${project.id}"><span class="glyphicon glyphicon-pushpin"></span>  </a></td>
                        </c:otherwise>
                </c:choose>

                            <td>
                                ${project.assemblyTeam.teamName}
                            </td>
                            <td>
                                ${project.transportDate}
                            </td>
                            <td>
                                ${project.endDate}
                            </td>
                            <td>
                                <a href="/project/update/${project.id}"><span class="glyphicon glyphicon-pencil"></span></a>
                            </td>
                            <td>
                                <a href="/project/delete/${project.id}"><span class="glyphicon glyphicon-trash"></span></a>
                            </td>
                        </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script>
    $(document).ready(function(){
        $('[data-toggle="popover"]').popover();
    });
</script>

<script> src="js/app.js" </script>

</body>
</body>
</html>


<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand">Projekty montażowe na bogato</a>
            </div>
             <ul class="nav navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href='<c:url value="/project/all"/>'>wszystkie projekty</a></li>
                <li class="nav-item">
                    <a class="nav-link" href='<c:url value="/project/user"/>'>moje projekty</a></li>
                <li class="nav-item">
                    <a class="nav-link" href='<c:url value="/team/all"/>'>ekipy montażowe</a></li>


            </ul>
            <ul class="nav navbar-nav navbar-right">
            <sec:authorize access="!isAuthenticated()">
                <li class="nav-item">
                    <a class="nav-link" href='<c:url value="/login"/>'><span class="glyphicon glyphicon-log-in"></span>  Zaloguj</a>
                </li>
            </sec:authorize>

            <sec:authorize access="isAuthenticated()">
                <sec:authentication property="authorities" var="roles" scope="page" />
                <c:forEach var="role" items="${roles}">
                    <c:if test ="${role == 'ADMIN'}">
                        <li class="nav-item">
                        <a class="nav-link" href='<c:url value="/user/all"/>'>użytkownicy</a></li>
                    </c:if>
                </c:forEach>
                <li class="nav-item dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="/project" aria-haspopup="true" aria-expanded="false">
                <span class="glyphicon glyphicon-user">  </span><sec:authentication property="name"/></a>
                        <ul class="dropdown-menu">
                            <li><input type="button" class="btn btn-outline btn-block" onclick="location.href='/login';" value = "Moje dane"/></li>

                            <form class="form-inline" method="post" action="<c:url value="/logout"/>">
                                <sec:csrfInput />
                                <li><input class="btn btn-outline btn-block"type="submit" value = "wyloguj" /></li>
                            </form>
                        </ul>
                </li>
            </sec:authorize>
            </ul>
        </div>
    </nav>
    <br><br>

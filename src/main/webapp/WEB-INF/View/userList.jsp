<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista Kursantów</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/kursanci.css" rel="stylesheet">

    <script>
        function confirmDelete(id, username) {
            if (confirm("Czy na pewno usunąć użytkownika \"" + username + "\"")) {
                window.location.href = "/user/delete/" + id;
            }
        }

    </script>
</head>

<%@ include file="parts/header.jsp" %>

<body id="body" class="light-mode">

<div class="content">
    <center>
<p class="header">Lista kursantów</p>
<table class="container">
    <thead>
    <tr>
        <th><h1>Login</h1></th>
        <th><h1>Imię</h1></th>
        <th><h1>Nazwisko</h1></th>
        <th><h1>E-Mail</h1></th>
        <th><h1>Płeć</h1></th>
        <th><h1>Data urodzenia</h1></th>
        <th><h1>Prawo jazdy</h1></th>
        <th><h1>Data utworzenia</h1></th>
        <%--<th>Kursy</th>--%>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <c:if test="${pageContext.request.isUserInRole('admin')}">
        <th><h1>Akcja</h1></th>
    </c:if>
</c:if>
    </tr>
    </thead>
    <tbody>
    <%--<tr class="row-content">--%>
<c:forEach var="users" items="${users}">
    <tr>
        <td>${users.username}</td>
    <td>${users.firstName}</td>
    <td>${users.lastName}</td>
    <td>${users.email}</td>
    <td>${users.gender}</td>
    <td>${users.birth}</td>
    <td>${users.licence}</td>
        <td>${users.created}</td>
    <%--<td>${users.activities}</td>--%>
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <c:if test="${pageContext.request.isUserInRole('admin')}">
        <td>
            <a class="btn btn-danger edit" href="#" onclick="confirmDelete(${users.id}, '${users.username}')">Usuń
                <i class="fa fa-trash" aria-hidden="true"></i> </a>
            &nbsp

            <a class="btn btn-info edit" href="/user/update/${users.id}">Edytuj
                <i class="fa fa-pencil-square-o" aria-hidden="true"></i> </a>

        </td>
            </c:if>
        </c:if>
    </tr>


    </c:forEach>
</table>
<br>
<br>
    </center>
</div>

<%@ include file="parts/footer.jsp" %>
</body>
</html>

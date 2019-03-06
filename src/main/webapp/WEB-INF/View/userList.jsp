<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista Kursantów</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/main.css" rel="stylesheet">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/main.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <%@ include file="parts/header.jsp" %>
    <script>
        function confirmDelete(id, fullName) {
            if (confirm("Czy na pewno usunac użytkownika \"" + fullName + "\"")) {
                window.location.href = "/user/delete/" + id;
            }
        }

    </script>
</head>
<body>


<h1 class="header">Lista kursantów</h1>
<table border="1px" style="position: center">
    <thead>
    <tr class="row-name">
        <th>Imię</th>
        <th>Nazwisko</th>
        <th>E-Mail</th>
        <th>Data dodania</th>
        <th>Kursy</th>
        <th>Akcja</th>
    </tr>
    </thead>
    <tbody>
    <tr class="row-content">
<c:forEach var="users" items="${users}">
    <tr>
    <td>${users.firstName}</td>
    <td>${users.lastName}</td>
    <td>${users.email}</td>
    <td>${users.created}</td>
    <td>${users.activities}</td>

        <td>
            <a class="btn btn-danger edit" href="#" onclick="confirmDelete(${users.id}, '${users.fullName}')">Delete
                <i class="fa fa-trash" aria-hidden="true"></i> </a>
            &nbsp


            <a class="btn btn-info edit" href="/user/update/${users.id}">Edytuj
                <i class="fa fa-pencil-square-o" aria-hidden="true"></i> </a>

        </td>
    </tr>

    </c:forEach>
</table>

<br>
<br>


<%@ include file="parts/footer.jsp" %>
</body>
</html>

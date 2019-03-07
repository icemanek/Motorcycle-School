<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 26.11.18
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista Instruktorów</title>

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/instructors.css" rel="stylesheet">

    <script>
        function confirmDelete(id, fullName) {
            if (confirm("Czy na pewno usunac instruktora \"" + fullName + "\"")) {
                window.location.href = "/instructor/delete/" + id;
            }
        }

    </script>
</head>
<%@ include file="parts/header.jsp" %>
<body id="body" class="light-mode">
<center>
<div class="content">
<h1 class="header">Lista instruktorów</h1>
<table border="1px">
<thead>
<tr class="row-name">
        <th>Imię</th>
        <th>Nazwisko</th>
        <th>E-Mail</th>
        <th>Akcja</th>
    </tr>
</thead>
    <tbody>
    <c:forEach var="instructor" items="${instructors}">
    <tr class="row-content">
            <td>${instructor.firstNameInstructor}</td>
            <td>${instructor.lastNameInstructor}</td>
            <td>${instructor.emailInstructor}</td>
            <td>
                <a class="btn btn-danger edit" href="#" onclick="confirmDelete(${instructor.id}, '${instructor.firstNameInstructor}')">Delete
                    <i class="fa fa-trash" aria-hidden="true"></i></a>
                &nbsp
                <a class="btn btn-info edit" href="/instructor/update/${instructor.id}">Edytuj
                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
    <button class="button" name="light-mode" onclick="window.location.href='/instructor/add'"><span>Dodaj instruktora </span></button>
    <button class="button" name="light-mode" onclick="window.location.href='/'"><span>Strona główna </span></button>
</div>
</center>
<%@ include file="parts/footer.jsp" %>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 28.11.18
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kontakt</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/main.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <%@ include file="parts/header.jsp" %>
</head>
<body>
<div class="content">
<div class="col-md-4">
    <h5>Informacje</h5>
    <dl class="contact-list">
        <dt>Adres:</dt>
        <dd>00-000 Domek ul. Szkolna 5</dd>
    </dl>
    <dl class="contact-list">
        <dt>email:</dt>
        <dd><a href="mailto:#">emil_sankowski@tlen.pl</a></dd>
    </dl>
    <dl class="contact-list">
        <dt>Telefon:</dt>
        <dd><a href="tel:#">678 564 737</a>
        </dd>
    </dl>
</div>
</div>


<%@ include file="parts/footer.jsp" %>
</body>
</html>

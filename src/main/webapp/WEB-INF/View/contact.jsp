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
    <link href="../css/kontakt.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

</head>
<body>
<%@ include file="parts/header.jsp" %>
<center>
<div class="content">
<div class="col-md-4">
    <h5>Informacje</h5>
    <dl class="contact-list">
        <dt>Adres:</dt>
        <dd> <i class="fas fa-map-marker-alt"></i> 00-000 Domek ul. Szkolna 5</dd>
    </dl>
    <dl class="contact-list">
        <dt>Email:</dt>
        <dd> <i class="fas fa-envelope"></i> emil_sankowski@tlen.pl</dd>
    </dl>
    <dl class="contact-list">
        <dt>Telefon:</dt>
        <dd> <i class="fas fa-phone-volume"></i> 678 564 737</dd>
    </dl>
</div>
</div>
</center>

<%@ include file="parts/footer.jsp" %>
</body>
</html>

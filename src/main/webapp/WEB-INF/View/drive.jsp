<%@ taglib prefix="th" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 28.11.18
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Jak dojechać</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/dojazd.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

</head>
<body>

<%@ include file="parts/header.jsp" %>


<div class="content">
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2559.711813104304!2d20.034972715959107!3d50.091682279427445!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47164542d58a4d03%3A0x2cbbd8ba02c4b6c!2sSzko%C5%82a+Motocyklowa+Dreamotor%2C+plac+manewrowy!5e0!3m2!1spl!2spl!4v1543413459373" width="600" height="450" frameborder="0" style="float: inherit" allowfullscreen></iframe>
<div class="col-md-4" style="float: right">
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
        <dd> <i class="fas fa-phone-volume"> </i> 678 564 737</dd>
    </dl>
</div>

</div>
<%@ include file="parts/footer.jsp" %>
</body>
</html>

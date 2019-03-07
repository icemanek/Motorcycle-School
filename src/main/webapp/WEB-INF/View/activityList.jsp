<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 26.11.18
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista kursów</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/oferta.css" rel="stylesheet">

</head>
<body id="body" class="light-mode">
<%@ include file="parts/header.jsp" %>
<div class="content">
<div class="demo2">
    <div class="container">
        <h4 style="padding-top:10px">Wybierz swój kurs!</h4>
        <div class="row">
            <div class="col-md-4 col-sm-6">
                <div class="pricingTable2">
                    <div class="pricingTable-header">
                        <h3 class="title">Podstawowy</h3>
                        <div class="price-value">120zł</div>
                    </div>  <ul class="pricing-content">
                    <li><i class="fa fa-check"></i> 20h teorii</li>
                    <li><i class="fa fa-check"></i> 20h jazdy z instruktorem</li>
                    <li><i class="fa fa-check"></i> Pomoc online </li>
                    <li><i class="fa fa-check"></i> Szkolenie na własnym motocyklu</li>
                    <li><i class="fa fa-check"></i>Kawa</li>
                </ul>
                    <a href="/user/add" class="pricingTable-signup">Zapisz się!</a>
                </div>
            </div>
            <div class="col-md-4 col-sm-6">
                <div class="pricingTable2 blue">
                    <div class="pricingTable-header">
                        <h3 class="title">Rozszerzony</h3>
                        <div class="price-value">150zł</div>
                    </div>
                    <ul class="pricing-content">
                        <li><i class="fa fa-check"></i> 40h teorii</li>
                        <li><i class="fa fa-check"></i> 40h jazdy z instruktorem</li>
                        <li><i class="fa fa-check"></i> Pomoc online i na żywo </li>
                        <li><i class="fa fa-check"></i> Szkolenie na naszym motocyklu</li>
                        <li><i class="fa fa-check"></i>Kawa i ciastka</li>
                    </ul>
                    <a href="/user/add" class="pricingTable-signup">Zapisz się!</a>
                </div>
            </div>

            <div class="col-md-4 col-sm-6">
                <div class="pricingTable2 pink">
                    <div class="pricingTable-header">
                        <h3 class="title">Premium</h3>
                        <div class="price-value">200zł</div>
                    </div>
                    <ul class="pricing-content">
                        <li><i class="fa fa-check"></i> 60h teorii</li>
                        <li><i class="fa fa-check"></i> 60h jazdy z instruktorem</li>
                        <li><i class="fa fa-check"></i> Opiekun podczas całego kursu </li>
                        <li><i class="fa fa-check"></i> Szkolenie na naszym motocyklu</li>
                        <li><i class="fa fa-check"></i>Kawa ,ciastka, impreza</li>
                    </ul>
                    <a href="/user/add" class="pricingTable-signup">Zapisz się!</a>
                </div>
            </div>

        </div>
    </div>
</div>
</div>
<footer><%@ include file="parts/footer.jsp" %></footer>
</body>
</html>

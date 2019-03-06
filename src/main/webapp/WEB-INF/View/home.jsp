<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 28.11.18
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Szkoła motocyklowa</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/main.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>





    <%@ include file="parts/header.jsp" %>
</head>
<body id="body" class="dark-mode">

<main>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col=12 mt-3">
                <div class="jumbotron ">
                    <h1 class="display-4">Witaj!</h1>
                    <p class="lead">Tutaj nauczysz się jak dobrze jeździć na motocyklu</p>
                    <hr class="my-4">
                    <p>Posiadamy instruktorów z super wiedzą. Sprawdź!</p>
                    <p class="lead">
                        <a class="btn btn-primary btn-lg" href="/instructor/all" role="button">Zobacz więcej</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Posiadamy bogaty wybór kursów</h5>
                        <p class="card-text">Posiadamy kursy dla kazdego!</p>
                        <a href="/kursy/all" class="btn btn-primary">Sprawdź</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Trenowaliśmy najlepszych motocyklistów w tym kraju</h5>
                        <p class="card-text">Zobacz jak do nas dojechać!</p>
                        <a href="/drive" class="btn btn-primary">Sprawdź!</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>



<%@ include file="parts/footer.jsp" %>
</body>
</html>

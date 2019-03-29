<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 19.03.19
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

   <form:form  method="post" modelAttribute="user">



           <%--<input type="email" id="email" placeholder="Email" required >--%>
           <%----%>

           <form:input path="email" type="email" placeholder="Email" required="true" />




       <button type="submit">Wyślij</button>

   </form:form>

   <%--<form action="/user/forgot" method="post">--%>

<%--<input type="email"  placeholder="Email" required />--%>
       <%----%>
       <%--<button type="submit" value="Wyslij" > Wyślij</button>--%>


   <%--</form>--%>

   <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>

</body>
</html>

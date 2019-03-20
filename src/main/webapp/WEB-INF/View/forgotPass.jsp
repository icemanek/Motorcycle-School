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

   <form:form modelAttribute="forgot" method="post">

       <label id="emailId">

           <form:input path="email" class="form-control" id="emailId" type="email" required="true" />

       </label>



       <button type="submit">Wyślij</button>

   </form:form>




</body>
</html>

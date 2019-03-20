<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 19.03.19
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>

<div id="errormsg" style="display:none"></div>
<div>

    <input id="pass" name="password" type="password" placeholder="Hasło" required/>
    <input id="passConfirm" type="password"  placeholder="Powtórz hasło" required />
    <span id="error" style="display:none">Password mismatch</span>

    <button type="submit" onclick="savePass()">Change Password</button>
</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="request" />
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Index page</title>
    <script type="text/javascript" src="${contextPath}/frontend-resources/js/jquery/jquery-1.11.2.min.js"></script>
</head>
<body>
    <div>
        <a href="${contextPath}?mylocale=en">English </a> | <a href="${contextPath}?mylocale=ru"> Russian </a>
    </div>
    <div>
        Greeting : <spring:message code="greeting.message"/>
    </div>
</body>
<script>
$(document).ready(function() {
    console.log("ready!");
});
</script>
</html>
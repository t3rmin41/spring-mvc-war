<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<base:common-header pageTitle="Index page" />
<body>
    <div>
        <a href="${contextPath}?mylocale=en">English </a> | <a href="${contextPath}?mylocale=ru"> Russian </a>
    </div>
    <div>
        Greeting : <spring:message code="greeting.message"/>
    </div>
    <div>
        Context path is "${contextPath}"
    </div>
    <div>
        <c:out><a href="${contextPath}/users/view">User view</a></c:out>
    </div>
<script type="text/javascript">
    $(document).ready(function() {
        console.log("index page is ready! Context path is \"${contextPath}\"");
    });
</script>
</body>
</html>
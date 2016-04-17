<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="request" />
<%@ attribute name="pageTitle" type="java.lang.String" required="false" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <c:if test="${not empty pageTitle}">
        <title>${pageTitle}</title>
    </c:if>
    <script type="text/javascript" src="${contextPath}/frontend-resources/js/jquery/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="${contextPath}/frontend-resources/js/jquery-ui-1.11.2/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${contextPath}/frontend-resources/js/jquery/jquery-1.11.2.min.js"></script>
    <link href="${contextPath}/frontend-resources/css/jquery-ui-1.11.2/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath}/frontend-resources/css/jquery-ui-1.11.2/jquery-ui.structure.min.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath}/frontend-resources/css/jquery-ui-1.11.2/jquery-ui.theme.min.css" rel="stylesheet" type="text/css" />
</head>
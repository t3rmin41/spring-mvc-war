<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="base" tagdir="/WEB-INF/tags" %>
<html>
<base:common-header pageTitle="User list" />
<body>
    <div id="userListDiv">
        <table id="userTable" border="1">
        <thead>
            <tr>
                <td>List ID</td><td>Database ID</td><td>Username</td><td>Email</td>
            </tr>
        </thead>
        <tbody>
        </tbody>
        </table>
    </div>
<script type="text/javascript">
$(document).ready(function() {
    $.ajax({
        method: "GET",
        url: "${contextPath}/users",
        success: function(resultData){
        	var tableBody = $("#userTable > tbody");
            $.each(resultData, function(index, userObject) {
                tableBody.append("<tr>" +
                                 "<td>" + index + "</td>" +
                                 "<td>" + userObject.id + "</td>" +
                                 "<td><a href=\"${contextPath}/users/view/" + userObject.id + "\">" +  userObject.username + "</a></td>" +
                                 "<td>" + userObject.email + "</td>" +
                                 "</tr>"
                                );
            });
        }
    });
});
</script>
</body>
</html>
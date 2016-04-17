<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="base" tagdir="/WEB-INF/tags" %>
<html>
<base:common-header pageTitle="Edit user" />
<body>
    <div id="userEditDiv">
        <div>
             <input id="loadUserButton" type="button" value="Load user data" /> 
        </div>
        <table id="userInfoTable" border="1">
        <thead>
            <tr>
                <th colspan=2>Database ID = ${userId}</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Username</td><td>Email</td>
            </tr>
        </tbody>
        <tfoot>
        </tfoot>
        </table>
    </div>
<script type="text/javascript">
$(document).ready(function() {
    console.log("user edit page ready");

    $("#loadUserButton").click(function() {
        $.ajax({
            method: "GET",
            url: "${contextPath}/users/${userId}",
            success: function(resultData){
                var tableBody = $("#userInfoTable > tbody");
                tableBody.append("<tr>" +
                        "<td>" + resultData.username + "</a></td>" +
                        "<td>" + resultData.email + "</td>" +
                        "</tr>"
                       );
            },
            error: function(xhr, textStatus, errorThrown){
                console.log(xhr);
             }
        });
    });
});
</script>
</body>
</html>
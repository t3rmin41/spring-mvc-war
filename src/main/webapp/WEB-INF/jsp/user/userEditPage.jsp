<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="base" tagdir="/WEB-INF/tags" %>
<html>
<base:common-header pageTitle="Edit user" />
<body>
    <div id="userEditDiv">
        <div>
             <input id="loadUserButton" type="button" value="Load user data" /> 
        </div>
        <form id="editUserForm" action="javascript:void(0);">
            <table id="userInfoTable" border="1">
            <thead>
                <tr>
                    <th colspan=2>Database ID = ${userId}</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
            <tfoot>
                <tr id="updatedUserResult">
                </tr>
            </tfoot>
            </table>
            <input type="submit" value="Edit user" />
        </form>
    </div>
    <div>
        <a href="${contextPath}/users/view">Go back to users view</a>
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
                tableBody.html("");
                tableBody.append("<tr>" +
                        "<td><input type=\"text\" name=\"username\" value=\"" + resultData.username + "\"/></td>" +
                        "<td><input type=\"text\" name=\"email\" value=\"" + resultData.email + "\"/></td>" +
                        "</tr>"
                       );
            },
            error: function(xhr, textStatus, errorThrown){
                console.log(xhr);
             }
        });
    });
    
    $("#editUserForm").submit(function(event) {
        //var editUserMap = {"edituser": {}};
        var editUserMap = { "id": ${userId} };
        $("#editUserForm > table > tbody > tr > td > input").each(function(index, userDataItem) {
            //editUserMap.edituser[userDataItem.name] = userDataItem.value
        	editUserMap[userDataItem.name] = userDataItem.value;
        });
        console.log(editUserMap);
        $.ajax({
            method: "PUT",
            url: "${contextPath}/users/edit/${userId}",
            contentType: "application/json; charset=utf-8",
            data : JSON.stringify(editUserMap),
            success: function(resultData){
                /*
                var tableBody = $("#userInfoTable > tbody");
                tableBody.append("<tr>" +
                        "<td><input type=\"text\" name=\"username\" value=\"" + resultData.username + "\"/></td>" +
                        "<td><input type=\"text\" name=\"email\" value=\"" + resultData.email + "\"/></td>" +
                        "</tr>"
                       );
                /**/
                var updatedUserResultRow = $("#userInfoTable > tfoot > tr#updatedUserResult");
                updatedUserResultRow.html("");
                if (resultData.updated) {
                    updatedUserResultRow.append("<td colspan=2>User updated successfully</td>");
                } else {
                    updatedUserResultRow.append("<td colspan=2>User not updated</td>");
                }
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
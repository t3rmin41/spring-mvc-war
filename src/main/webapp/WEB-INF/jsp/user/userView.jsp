<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="base" tagdir="/WEB-INF/tags" %>
<html>
<base:common-header pageTitle="User list" />
<body>
<div id="page">
    <div id="userListDiv">
        <table id="userTable" border="1">
        <thead>
            <tr>
                <td>List ID</td><td>Database ID</td><td>Username</td><td>Email</td><td>Delete?</td>
            </tr>
        </thead>
        <tbody>
        </tbody>
        </table>
    </div>
    <div>
        <form id="createUserForm" action="javascript:void(0);">
            <table id="userInfoTable" border="1">
            <thead>
                <tr>
                    <th colspan=2>Create new user</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Username</td>
                    <td><input name="username" type="text" value="" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input name="password" type="text" value="" /></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input name="email" type="text" value="" /></td>
                </tr>
                <tr>
                    <td>Admin?</td>
                    <td><select name="isAdmin">
                            <option selected value="false">No</option>
                            <option value="true">Yes</option>
                        </select>
                    </td>
                </tr>
                <tr id="createUserResult">
                </tr>
            </tbody>
            <tfoot>
            </tfoot>
            </table>
            <input type="submit" value="Create user" />
        </form>
    </div>
</div>
<script type="text/javascript">
function loadUsers() {
    $.ajax({
        method: "GET",
        headers: {
            "Content-Type": "application/json; charset=utf-8",
            "transactionId": "12345678"
        },
        url: "${contextPath}/users",
        beforeSend: function() {
            $("#page").css({
                "background-color": "#ffffff",
                "opacity": "0.5"
            });
        },
        complete: function(){
            $("#page").css({
                "background-color": "",
                "opacity": ""
            });
        },
        success: function(resultData){
            var tableBody = $("#userTable > tbody");
            tableBody.html("");
            $.each(resultData, function(index, userObject) {
                tableBody.append("<tr>" +
                                 "<td>" + index + "</td>" +
                                 "<td>" + userObject.id + "</td>" +
                                 "<td><a href=\"${contextPath}/users/view/" + userObject.id + "\">" +  userObject.username + "</a></td>" +
                                 "<td>" + userObject.email + "</td>" +
                                 "<td class=\"delete\"><input type=\"button\" value=\"Delete\" onclick=\"deleteUser(" + userObject.id + ")\" /></td>" +
                                 "</tr>"
                                );
            });
        },
        error: function(xhr, textStatus, errorThrown) {
        	console.log(xhr);
        }
    });
}

function deleteUser(id) {
    console.log(id);
    $.ajax({
        method: "DELETE",
        url: "${contextPath}/users/delete/"+id,
        success: function(resultData) {
            console.log("Result : " + resultData);
            loadUsers();
        },
        error: function(xhr, textStatus, errorThrown){
            console.log(xhr);
         }
    });
}
$(document).ready(function() {
    loadUsers();

    $("#createUserForm").submit(function(event) {
        //var editUserMap = {"edituser": {}};
        var createUserMap = {};
        $("#createUserForm > table > tbody > tr > td:nth-child(n+2) > input").each(function(index, userDataItem) {
            //editUserMap.edituser[userDataItem.name] = userDataItem.value
            createUserMap[userDataItem.name] = userDataItem.value;
        });
        $("#createUserForm > table > tbody > tr > td:nth-child(n+2) > select").each(function(index, userDataItem) {
            //editUserMap.edituser[userDataItem.name] = userDataItem.value
            createUserMap[userDataItem.name] = userDataItem.value;
        });
        //console.log(createUserMap);
        $.ajax({
            method: "POST",
            url: "${contextPath}/users/create",
            contentType: "application/json; charset=utf-8",
            data : JSON.stringify(createUserMap),
            success: function(resultData){
                loadUsers();
                var createUserResultRow = $("#userInfoTable > tbody > tr#createUserResult");
                createUserResultRow.html("");
                if (resultData.created) {
                	createUserResultRow.append("<td colspan=2>User created successfully</td>");
                } else {
                	createUserResultRow.append("<td colspan=2>User not created</td>");
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
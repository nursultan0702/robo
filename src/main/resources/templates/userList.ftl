<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>

<@c.page>
<@b.banner "Список пользователей"/>
List of Users

<table class="table">
    <thead class="thead-light">
    <tr>
        <th scope="col">#</th>
        <th scope="col">Name</th>
        <th scope="col">Role</th>
        <th scope="col">Role</th>
    </tr>
    </thead>
    <tbody>
    <#list users as user>
    <tr>
        <th scope="row">${user.id}</th>
        <td>${user.username}</td>
        <td><#list user.roles as role>${role}<#sep>, </#list></td>
        <td><a href="/user/${user.id}">Edit</a></td>
    </tr>
    </#list>
    </tbody>
</table>
</@c.page>
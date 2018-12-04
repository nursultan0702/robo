<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>

<@c.page>
<@b.banner "Список пользователей"/>
<section class="sample-text-area">
    <div class="container">
<table class="table table-light">
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
        <td>
            <a href="/user/${user.id}">Edit</a><span> </span>
            <a href="/user/delete/${user.id}">Delete</a>
        </td>
    </tr>
    </#list>
    </tbody>
</table>
    </div>
</section>
</@c.page>
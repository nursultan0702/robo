<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>

<@c.page>
<@b.banner "Задачи"/>
<h1>${course.name}</h1>
<#list tasks as task>
<form action="/task" method="post" enctype="multipart/form-data">
    <div class="mt-10">
        <input type="text" name="hometaskName" value="${task.taskName}" placeholder="hometask name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'hometask name'" required class="single-input">
        <input type="hidden" name="taskid" value="${task.id}">
        <input type="hidden" name="course" value="${course.id}">
    </div>
    <#if task.filename??>
    <div class="mt-10">
        <a href="/#">${task.fileName}</a>
    </div>
    </#if>
    <div class="mt-10">
        <input type="file" name="file ">
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <div><input class="genric-btn primary" type="submit" value="Send"/></div>

</form>
</#list>
</@c.page>

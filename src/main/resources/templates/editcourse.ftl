<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>

<@c.page>
<@b.banner "Edit courses"/>
<#if course??>
<form action="/save-course" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="hidden" name="id" value="${course.id}">
    <input type="text" value="${course.name}">
    <textarea name="about">${course.about}</textarea>
    <input type="text" name="price" value="${course.price}">
    <input type="text" name="hours" value="${course.hours}">
    <input type="file" name="img ">
    <button type="submit">Save</button>
</form>
<#else>
<form action="/course/save-course" method="post" enctype="multipart/form-data">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="text" name="name">
    <textarea name="about"></textarea>
    <input type="text" name="price">
    <input type="text" name="hours">
    <input type="file" name="img ">
    <button type="submit">Save</button>
</form>
</#if>
</@c.page>
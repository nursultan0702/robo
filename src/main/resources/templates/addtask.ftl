<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>
<#include "parts/security.ftl">

<@c.page>
<@b.banner "Уроки"/>
<div class="whole-wrap">
    <div class="container">
        <div class="section-top-border">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h3 class="mb-30">${course.name}</h3>
                    <#if isTeacher || isAdmin>
                    <form action="/task/add-task" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="hidden" name="id" value="${course.id}">

                        <div class="mt-10">
                            <label>Название:</label>
                            <input type="text" name="name" class="single-input">
                        </div>

                        <div class="mt-10">
                            <label>Ссылка на видео:</label>
                            <input type="text" name="video" class="single-input">
                        </div>

                        <div class="mt-10">
                            <label>Описание урока:</label>
                            <textarea class="single-textarea" name="about"></textarea>
                        </div>
                        <div class="mt-10">
                            <label>Максимальный размер файла 2Мб</label>
                            <input class="mt-3" type="file" name="file " multiple length="2024">
                        </div>
                        <button class="mt-3 btn btn-success" type="submit">Save</button>
                    </form>
                <#else>
                <h3>У вас нет прав</h3>
            </#if>
        </div>
    </div>
</div>
</div>
</@c.page>

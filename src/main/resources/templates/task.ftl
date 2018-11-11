<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>
<#include "parts/security.ftl">

<@c.page>
<@b.banner "Уроки"/>
<div class="whole-wrap">
    <div class="container">
        <div class="section-top-border">
            <div class="row">
                <div class="col-lg-8 col-md-8">
                    <#if course??>
                    <h3 class="mb-30">Курс: ${course.name}</h3>
                    <#else>
                    <h3 class="mb-30">Результаты: </h3>
                    </#if>
                <#if isTeacher || isAdmin && tasks??>
                <#list tasks as task>
                <h4>Называние урока: ${task.taskName}</h4>
                <form action="/task/update-task" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="hidden" name="id" value="${task.course.getId()}">
                    <input type="hidden" name="taskid" value="${task.id}">

                    <div class="mt-10">
                        <label>Название:</label>
                        <input type="text" name="name" value="${task.taskName}" class="single-input">
                    </div>

                    <div class="mt-10">
                        <label>Ссылка на видео:</label>
                        <input type="text" name="video" value="${task.video}" class="single-input">
                    </div>

                    <div class="mt-10">
                        <label>Описание урока:</label>
                        <textarea class="single-textarea" name="about">${task.about}</textarea>
                    </div>
                    <div class="mt-10">
                        <#if task.lectureFileName??>
                        <label>${task.lectureFileName}</label>
                        </#if>
                    <label>Максимальный размер файла 2Мб</label>
                    <input class="mt-3" type="file" name="file " multiple length="2024">
            </div>
            <button class="mt-3 btn btn-success" type="submit">Save</button>
            <a href="/hometask/hometask-check/${task.id}">Проверить Домашние задание</a>
            </form>
            <form class="mt-3" action="/task/delete" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="hidden" name="taskId" value="${task.id}">
                <button type="submit" class="btn btn-danger">Delete task</button>
            </form>
            <hr>
        </#list>

        <#elseif isStudent>
        <#list tasks as task>
            <h4>Называние урока: ${task.taskName}</h4>
                <div class="mt-10">
                    <label>Название:</label>
                    <input disabled type="text" name="name" value="${task.taskName}" class="single-input">
                </div>

                <div class="mt-10">
                    <label>Ссылка на видео:</label>
                    <input disabled type="text" name="video" value="${task.video}" class="single-input">
                </div>

                <div class="mt-10">
                    <label>Описание урока:</label>
                    <textarea disabled class="single-textarea" name="about">${task.about}</textarea>
                </div>
                <div class="mt-10">
                    <#if task.lectureFileName??>
                    <label>${task.lectureFileName}</label>
                    </#if>
        </div>
        <a href="/hometask/add-hometask/${task.id}"><button class="mt-3 btn btn-success">Добавить ответ</button></a>
        <#list hometasks as hometask>
        <#if task == hometask.task>
        <p>Оценка за урок:</p>  <label>${hometask.mark}</label>
        </#if>
        </#list>
        <hr>
    </#list>
    <#else>
    <h3>You don't have access to this page, ask your Administrator</h3>
    </#if>
</div>
<div class="col-lg-4 sidebar">
    <div class="single-widget search-widget">
        <form class="example" action="/task/search-task" method="post" style="margin:auto;max-width:300px; background: #eee;">
            <input type="text" placeholder="Search Posts" name="taskName">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit"><i class="fa fa-search"></i></button>
        </form>
    </div>

    <div class="single-widget category-widget">
        <h4 class="title">Post Categories</h4>
        <ul>
            <#if isTeacher || isAdmin && course??>
            <li><a href="/task/add-task/${course.id}" class="justify-content-between align-items-center d-flex"><h6>Добавить новый урок</h6></a></li>
            <#else>
            <li><a href="/course/my" class="justify-content-between align-items-center d-flex"><h6>Выбрать курс</h6></a></li>
        </#if>
        </ul>
    </div>
</div>
</div>
</div>
</div>
</@c.page>

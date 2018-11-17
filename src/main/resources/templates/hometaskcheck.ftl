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
                    <h3>Называние урока: ${task.taskName}</h3>
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
                            <label>Файл урока:</label>
                            <a href="/download/file/${task.lectureFileName}">${task.lectureFileName}</a>
                        </#if>
                </div>
                <hr>
                <#if hometasks??>
                <#list hometasks as hometask>
                <form action="/hometask/save-hometask-mark" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="hidden" name="id" value="${hometask.id}">
                    <h4>Ответ от: ${hometask.student.getFirstname()} ${hometask.student.getSecondname()}</h4>
                <div class="mt-3">
                    <label>Ответ: </label>
                    <div class="mt-10">
                        <label>Комментарии:</label>
                        <textarea  class="single-textarea" name="comment">${hometask.comments}</textarea>
                    </div>
                    <a href="/download/file/${hometask.file}">${hometask.file}</a>
                    <h3>ОЦЕНКА:</h3>
                    <div class="mt-10">
                        <input type="text" name="mark" value="${hometask.mark}" class="single-input">
                    </div>
                    <button class="mt-3 btn btn-success" type="submit">Сохранить</button>
                </div>
                </form>
                </#list>
            <#else>
            <h3>Ответов пока нет</h3>
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
                        <#if course??>
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

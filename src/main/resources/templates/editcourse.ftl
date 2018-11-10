<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>

<@c.page>
<@b.banner "Edit courses"/>
<div class="whole-wrap">
    <div class="container">
        <div class="section-top-border">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h3 class="mb-30">Form Element</h3>
                    <#if course??>
                    <form action="/course/update-course" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="hidden" name="id" value="${course.id}">

                        <div class="mt-10">
                            <label>Название:</label>
                            <input type="text" name="name" value="${course.name}" class="single-input">
                        </div>

                        <div class="mt-10">
                            <label>Цена:</label>
                            <input type="text" name="price" value="${course.price}" class="single-input">
                        </div>
                        <div class="mt-10">
                            <label>Длительность курса:</label>
                            <input type="text" name="hours" value="${course.hours}" class="single-input">
                        </div>

                        <div class="mt-10">
                            <label>Описание курса:</label>
                            <textarea class="single-textarea" name="about">${course.about}</textarea>
                        </div>
                        <div class="mt-10">
                            <img height="330px" width="570px" src="${course.img}"></br>
                            <label>Максимальный размер картинки 2Мб</label>
                            <input class="mt-3" type="file" name="img " multiple length="2024">
                        </div>
                        <button class="mt-3 btn btn-success" type="submit">Save</button>
                    </form>
                    <form class="mt-3" action="/course/delete/${course.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button type="submit" class="btn btn-danger">Delete course</button>
                    </form>

                    <#else>
                    <form action="/course/save-course" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">

                        <div class="mt-10">
                            <label>Название:</label>
                            <input type="text" name="name"  class="single-input">
                        </div>

                        <div class="mt-10">
                            <label>Цена:</label>
                            <input type="text" name="price"  class="single-input">
                        </div>
                        <div class="mt-10">
                            <label>Длительность курса:</label>
                            <input type="text" name="hours" class="single-input">
                        </div>

                        <div class="mt-10">
                            <label>Описание курса:</label>
                            <textarea class="single-textarea" name="about"></textarea>
                        </div>
                        <div class="mt-10">
                            <label>Максимальный размер картинки 2Мб</label>
                            <input class="mt-3" type="file" name="img " multiple length="2024">
                        </div>
                        <button class="mt-3 btn btn-success" type="submit">Save</button>
                    </form>
                </#if>
            </div>
        </div>
    </div>
</div>
</@c.page>
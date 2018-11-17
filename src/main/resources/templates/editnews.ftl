<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>
<#include "parts/security.ftl">

<@c.page>
<@b.banner "Новости"/>
<div class="whole-wrap">
    <div class="container">
        <div class="section-top-border">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h3 class="mb-30">Form Element</h3>
                    <#if news??>
                    <form action="/news/update" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="hidden" name="id" value="${news.id}">

                        <div class="mt-10">
                            <label>Название:</label>
                            <input type="text" name="title" value="${news.title}" class="single-input">
                        </div>

                        <div class="mt-10">
                            <label>Short Текст</label>
                            <textarea class="single-textarea" name="short">${news.shortText}</textarea>
                        </div>

                        <div class="mt-10">
                            <label>Текст</label>
                            <textarea class="single-textarea" name="text">${news.text}</textarea>
                        </div>
                        <div class="mt-10">
                            <img height="330px" width="570px" src="${news.imgName}"> </br>
                            <label>Максимальный размер картинки 2Мб</label>
                            <input class="mt-3" type="file" name="image " multiple length="2024">
                        </div>
                        <button class="mt-3 btn btn-success" type="submit">Save</button>
                    </form>
                    <form class="mt-3" action="/news/delete/${news.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button type="submit" class="btn btn-danger">Delete course</button>
                    </form>
                    <#else>
                    <form action="/news/save" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="hidden" name="id" value="">

                        <div class="mt-10">
                            <label>Название:</label>
                            <input type="text" name="title" value="" class="single-input">
                        </div>

                        <div class="mt-10">
                            <label>Short Текст</label>
                            <textarea class="single-textarea" name="short"></textarea>
                        </div>

                        <div class="mt-10">
                            <label>Текст</label>
                            <textarea class="single-textarea" name="text"></textarea>
                        </div>
                        <div class="mt-10">
                            <label>Максимальный размер картинки 2Мб</label>
                            <input class="mt-3" type="file" name="image " multiple length="2024">
                        </div>
                        <button class="mt-3 btn btn-success" type="submit">Save</button>
                    </form>
                </#if>
            </div>
        </div>
    </div>
</div>
</@c.page>

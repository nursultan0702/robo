<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>
<#include "parts/security.ftl">

<@c.page>
<@b.banner "Новости"/>
<div class="whole-wrap">
    <div class="container">
        <#if isAdmin>
        <h4>Add new:</h4>
        <form action="/news/save" method="post" enctype="multipart/form-data">
        <div class="section-top-border">
            <h3 class="mb-30"><lable>Title</lable><input type="text" name="title" value="title"></h3>
            <div class="row">
                <div class="col-md-3">
                   <label>Image source:</label> <input type="file" name="image">
                </div>
                <div class="col-md-9 mt-sm-20">
                    <textarea style="width 100px; height:100px" name="text"></textarea>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                </div>
                <button type="submit" class="btn btn-success">Add new</button>
        </div>
    </div>
        </form>
    </#if>

    <#if newsList??>
        <#list newsList as news>
<form action="/news/update/${news.id}">
        <div class="section-top-border">
            <h3 class="mb-30">${news.title}</h3>
            <div class="row">
                <div class="col-md-3">
                    <img src="/img/${news.imgName}" alt="" class="img-fluid">
                    <#if isAdmin>
                    <input type="file" name="image">
                    </#if>
                </div>
                <div class="col-md-9 mt-sm-20">
                    <textarea name="text">${news.text}</textarea>
                </div>
                <#if isAdmin>
                <button type="submit" class="btn btn-success">Save</button>
                </#if>
            </div>
        </div>
</form>
        </#list>
</#if>
    </div>
</div>
</@c.page>

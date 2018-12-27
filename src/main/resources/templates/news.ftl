<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>
<#include "parts/security.ftl">

<@c.page>
<@b.banner "Новости"/>
<div class="whole-wrap">
    <div class="container  mt-5 ">
        <div class="col-lg-8 post-list blog-post-list">
            <#if newsList??>
            <#list newsList as news>
            <div class="single-post">
                <img class="" height="320px" width="555px" src="${news.imgName}" alt="">
                <ul class="tags">
                    <li><a href="#"><span class="lnr lnr-clock"></span> ${news.date}</a></li>
                </ul>
                <a href="/news/single-news/${news.id}">
                    <h1>
                        ${news.title}
                    </h1>
                </a>
                <p>
                    ${news.shortText}
                </p>
                <div class="bottom-meta">
                    <div class="user-details row align-items-center">
                        <div class="comment-wrap col-lg-6">
                            <ul>
                                <li><button id="${news.id}" class="genric-btn primary small" onclick="like(${news.id})" href=""><span class="lnr lnr-heart"></span>	${news.likes} likes</button></li>
                                <li><a href="#"><span class="lnr lnr-user"></span> ${news.author.getUsername()}</a></li>
                                <#if isAdmin>
                                <li><a href="/news/edit-news/${news.id}"><span class="lnr lnr-pencil"></span> Изменить</a></li>
                                </#if>
                            </ul>
                        </div>
                        <div class="social-wrap col-lg-6">
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </#list>
    </#if>
</div>
<div class="col-lg-4 sidebar">
    <#if isTeacher || isAdmin>
    <div class="single-widget category-widget">
        <h4 class="title">Post Categories</h4>
        <ul>
            <li><a href="/news/add-news" class="justify-content-between align-items-center d-flex"><h6>Добавить новости</h6></a></li>
        </ul>
    </div>
</#if>

<div class="single-widget recent-posts-widget">
    <h4 class="title">Последние новости</h4>
    <#if lNewsList??>
    <#list lNewsList as news>
    <div class="blog-list ">
        <div class="single-recent-post d-flex flex-row">
            <div class="recent-thumb" style="height:75.5px; width:75.5px">
                <img class="img-fluid" src="${news.imgName}" alt="">
            </div>
            <div class="recent-details">
                <a href="/news/single-news/${news.id}">
                    <h4>
                        ${news.title}
                    </h4>
                </a>
                <p>
                    ${news.date}
                </p>
            </div>
        </div>
    </div>
    </#list>
</#if>
</div>
</div>
</div>
</@c.page>

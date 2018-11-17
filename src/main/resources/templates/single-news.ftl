<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>
<#include "parts/security.ftl">

<@c.page>
<@b.banner "Новости"/>
<!-- Start blog-posts Area -->
<section class="blog-posts-area section-gap">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 post-list blog-post-list">
                <div class="single-post">
                    <img class="img-fluid" src="${news.imgName}" alt="">
                    <ul class="tags">
                        <li><span class="lnr lnr-clock"></span> ${news.date}</li>
                    </ul>
                        <h1>
                            ${news.title}
                        </h1>
                    <div class="content-wrap">
                        ${news.text}
                    </div>
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
            </div>
            <div class="col-lg-4 sidebar">
                <div class="single-widget recent-posts-widget">
                    <h4 class="title">Последние новости</h4>
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
            </div>

            </div>
        </div>
    </div>
</section>
<!-- End blog-posts Area -->
</@c.page>
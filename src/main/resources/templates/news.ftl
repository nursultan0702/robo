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
                <img class="img-fluid" src="${news.imgName}" alt="">
                <ul class="tags">
                    <li><a href="#">Art, </a></li>
                    <li><a href="#">Technology, </a></li>
                    <li><a href="#">Fashion</a></li>
                </ul>
                <a href="blog-single.html">
                    <h1>
                        ${news.title}
                    </h1>
                </a>
                <p>
                    ${news.text}
                </p>
                <div class="bottom-meta">
                    <div class="user-details row align-items-center">
                        <div class="comment-wrap col-lg-6">
                            <ul>
                                <li><a href="#"><span class="lnr lnr-heart"></span>	4 likes</a></li>
                                <li><a href="#"><span class="lnr lnr-bubble"></span> 06 Comments</a></li>
                                <#if isAdmin>
                                <li><a href="/news/edit-news/${news.id}"><span class="glyphicon glyphicon-pencil"></span> Изменить</a></li>
                                </#if>
                            </ul>
                        </div>
                        <div class="social-wrap col-lg-6">
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                <li><a href="#"><i class="fa fa-behance"></i></a></li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </#list>
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
    <#if isTeacher || isAdmin>
    <div class="single-widget category-widget">
        <h4 class="title">Post Categories</h4>
        <ul>
            <li><a href="/news/add-news" class="justify-content-between align-items-center d-flex"><h6>Добавить новости</h6></a></li>
        </ul>
    </div>
</#if>

<div class="single-widget category-widget">
    <h4 class="title">Post Categories</h4>
    <ul>
        <li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Techlology</h6> <span>37</span></a></li>
        <li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Lifestyle</h6> <span>24</span></a></li>
        <li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Fashion</h6> <span>59</span></a></li>
        <li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Art</h6> <span>29</span></a></li>
        <li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Food</h6> <span>15</span></a></li>
        <li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Architecture</h6> <span>09</span></a></li>
        <li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Adventure</h6> <span>44</span></a></li>
    </ul>
</div>

<div class="single-widget recent-posts-widget">
    <h4 class="title">Recent Posts</h4>
    <div class="blog-list ">
        <div class="single-recent-post d-flex flex-row">
            <div class="recent-thumb">
                <img class="img-fluid" src="img/blog/r1.jpg" alt="">
            </div>
            <div class="recent-details">
                <a href="blog-single.html">
                    <h4>
                        Home Audio Recording
                        For Everyone
                    </h4>
                </a>
                <p>
                    02 hours ago
                </p>
            </div>
        </div>
        <div class="single-recent-post d-flex flex-row">
            <div class="recent-thumb">
                <img class="img-fluid" src="img/blog/r2.jpg" alt="">
            </div>
            <div class="recent-details">
                <a href="blog-single.html">
                    <h4>
                        Home Audio Recording
                        For Everyone
                    </h4>
                </a>
                <p>
                    02 hours ago
                </p>
            </div>
        </div>
        <div class="single-recent-post d-flex flex-row">
            <div class="recent-thumb">
                <img class="img-fluid" src="img/blog/r3.jpg" alt="">
            </div>
            <div class="recent-details">
                <a href="blog-single.html">
                    <h4>
                        Home Audio Recording
                        For Everyone
                    </h4>
                </a>
                <p>
                    02 hours ago
                </p>
            </div>
        </div>
        <div class="single-recent-post d-flex flex-row">
            <div class="recent-thumb">
                <img class="img-fluid" src="img/blog/r4.jpg" alt="">
            </div>
            <div class="recent-details">
                <a href="blog-single.html">
                    <h4>
                        Home Audio Recording
                        For Everyone
                    </h4>
                </a>
                <p>
                    02 hours ago
                </p>
            </div>
        </div>
    </div>
</div>

<div class="single-widget category-widget">
    <h4 class="title">Post Archive</h4>
    <ul>
        <li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Dec '17</h6> <span>37</span></a></li>
        <li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Nov '17</h6> <span>24</span></a></li>
        <li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Oct '17</h6> <span>59</span></a></li>
        <li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Sep '17</h6> <span>29</span></a></li>
        <li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Aug '17</h6> <span>15</span></a></li>
        <li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Jul '17</h6> <span>09</span></a></li>
        <li><a href="#" class="justify-content-between align-items-center d-flex"><h6>Jun '17</h6> <span>44</span></a></li>
    </ul>
</div>

<div class="single-widget tags-widget">
    <h4 class="title">Tag Clouds</h4>
    <ul>
        <li><a href="#">Lifestyle</a></li>
        <li><a href="#">Art</a></li>
        <li><a href="#">Adventure</a></li>
        <li><a href="#">Food</a></li>
        <li><a href="#">Techlology</a></li>
        <li><a href="#">Fashion</a></li>
        <li><a href="#">Architecture</a></li>
        <li><a href="#">Food</a></li>
        <li><a href="#">Technology</a></li>
    </ul>
</div>

</div>
</div>
</div>
</@c.page>

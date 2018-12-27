<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>
<#include "parts/security.ftl">

<@c.page>
<@b.banner "Курсы"/>
<#list courses as course>
<!-- Start about-video Area -->
<section class="about-video-area section-gap">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 about-video-left">
                <h6 class="text-uppercase">Автор курса ${course.teacher.getUsername()}</h6>
                <a href="/task/open/${course.id}">
                <h1>
                    ${course.name}
                </h1>
                </a>
                <p>
                    <span>Цена: ${course.price}, Часы: ${course.hours}</span>
                </p>
                <p>
                    ${course.about}
                </p>
                <#if isStudent>
                <a class="primary-btn" href="/course/begin-course/${course.id}">Начать обучение</a>
                <#elseif isTeacher || isAdmin >
                <a class="primary-btn" href="/course/edit-course/${course.id}">Редактировать курс</a>
                <#else>
                <a class="primary-btn" href="/course/login">Начать курс</a>
                 </#if>

    </div>
    <div  style="background-image: url('${course.img}') no-repeat center; background-size: cover; height: 330px;" class="col-lg-6 justify-content-center align-items-center d-flex relative">
        <div class="overlay overlay-bg"></div>
        <img class="img-fluid mx-auto" src="${course.img}" alt="">
    </div>
    </div>
    </div>
</section>
<!-- End about-video Area -->
</#list>
</@c.page>
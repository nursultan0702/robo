<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>

<@c.page>
<@b.banner "My courses"/>
<#list courses as course>
<!-- Start about-video Area -->
<section class="about-video-area section-gap">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 about-video-left">
                <h6 class="text-uppercase">Brand new app to blow your mind</h6>
                <h1>
                    ${course.name}
                </h1>
                <p>
                    <span>Цена: ${course.price}, Часы: ${course.hours}</span>
                </p>
                <p>
                    ${course.about}
                </p>
                <#if isStudent>
                <a class="primary-btn" href="/begin-course/${course.id}">Начать обучение</a>
                <#elseif isTeacher || isAdmin >
                <a class="primary-btn" href="/edit-course/${course.id}">Редактировать курс</a>
                <#else>
                <a class="primary-btn" href="/login">Начать курс</a>
                 </#if>

    </div>
    <div class="col-lg-6 about-video-right justify-content-center align-items-center d-flex relative">
        <div class="overlay overlay-bg"></div>
        <img class="img-fluid mx-auto" src="${course.img}" alt="">
    </div>
    </div>
    </div>
</section>
<!-- End about-video Area -->
</#list>
</@c.page>
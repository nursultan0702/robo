<#import "parts/common.ftl" as c>

<@c.page>
<#include "parts/mainbanner.ftl">
<!-- Start products Area -->
<section class="products-area section-gap">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-md-12 pb-40 header-text text-center">
                <h1 class="pb-10">Доступные курсы</h1>
                <p>
                    Выберите ваш путь.
                </p>
            </div>
        </div>
        <div class="row">
            <#if courses??>
            <#list courses as course>
            <div class="col-lg-3 col-md-6">
                <div class="single-product">
                    <div>
                        <img height="255px" width="175px" src="${course.img}" alt="">
                    </div>
                    <div class="details">
                        <h4>${course.name}</h4>
                        <p>
                           ${course.teacher.getFullName()}
                        </p>
                        <a href="/course" class="primary-btn text-uppercase">Посмотреть</a>
                    </div>
                </div>
            </div>
            </#list>
        </#if>
        </div>
    </div>
</section>
<!-- End products Area -->

<!-- Start home-about Area -->
<section class="about-video-area section-gap">
    <div class="container">
        <div class="row align-items-center">
            <#if news??>
            <div class="col-lg-6 about-video-left">
                <img class="mx-auto d-block img-fluid" src="${news.imgName}" alt="">
            </div>
            <div class="col-lg-6 home-about-right no-padding">
                <h1>${news.title} </h1>
                <p>
                ${news.text}
                </p>
                <a class="primary-btn text-uppercase" href="/news">Посмотреть Новости</a>
            </div>
        </div>
    </#if>
    </div>
</section>
<!-- End home-about Area -->


<!-- Start about-video Area -->
<section class="about-video-area section-gap">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 about-video-left">
                <h6 class="text-uppercase">Мы обучим вас так, чтобы вы могли применять свои знания на практике!</h6>
                <h1>
                    Зачем изучать программирование?
                </h1>
                <p>
                    Каждый человек на планете должен учиться программированию на компьютере, потому что оно учит вас думать. - Стив Джобс.
                </p>
                <a class="primary-btn" href="#">Get Started Now</a>
            </div>
            <div class="col-lg-6 about-video-right justify-content-center align-items-center d-flex relative">
                <div class="overlay overlay-bg"></div>
                <a class="play-btn" href="https://www.youtube.com/watch?v=ml1jT5QomKY"><img class="img-fluid mx-auto" src="/static/img/play-btn.png" alt=""></a>
            </div>
        </div>
    </div>
</section>
<!-- End about-video Area -->


<!-- Start feature Area -->
<section class="feature-area section-gap">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-md-12 pb-40 header-text text-center">
                <h1 class="pb-10 text-white">Вещи которые нас делают уникальными</h1>
                <p class="text-white">
                    Что - то надо придумать и сюда.
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="single-feature">
                    <a href="#" class="title d-flex flex-row">
                        <span class="lnr lnr-user"></span>
                        <h4>Мы эксперты</h4>
                    </a>
                    <p>
                        Мы эксперты своего дело.
                    </p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single-feature">
                    <a href="#" class="title d-flex flex-row">
                        <span class="lnr lnr-license"></span>
                        <h4>Профессионалы</h4>
                    </a>
                    <p>
                        У нас работают лучшие учители города.
                    </p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single-feature">
                    <a href="#" class="title d-flex flex-row">
                        <span class="lnr lnr-phone"></span>
                        <h4>Поддержка</h4>
                    </a>
                    <p>
                        Круглосуточная поддержка.
                    </p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single-feature">
                    <a href="#" class="title d-flex flex-row">
                        <span class="lnr lnr-rocket"></span>
                        <h4>Передовые технологии</h4>
                    </a>
                    <p>
                        Мы активно следим прогрессом в мире IT.
                    </p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single-feature">
                    <a href="#" class="title d-flex flex-row">
                        <span class="lnr lnr-diamond"></span>
                        <h4>Современные знание</h4>
                    </a>
                    <p>
                        У нас только востребованные технологии.
                    </p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="single-feature">
                    <a href="#" class="title d-flex flex-row">
                        <span class="lnr lnr-bubble"></span>
                        <h4>Позитивные отзывы</h4>
                    </a>
                    <p>
                        О нас пишут только позитивные отзывы.
                    </p>
                </div>
            </div>

        </div>
    </div>
</section>
<!-- End feature Area -->


<!-- Start brand Area -->
<section class="brand-area pt-120">
    <div class="container">
        <div class="row align-items-center">
            <div class="col single-brand">
                <img class="img-fluid" src="/static/img/l1.png" alt="">
            </div>
            <div class="col single-brand">
                <img class="img-fluid" src="/static/img/l2.png" alt="">
            </div>
            <div class="col single-brand">
                <img class="img-fluid" src="/static/img/l3.png" alt="">
            </div>
            <div class="col single-brand">
                <img class="img-fluid" src="/static/img/l4.png" alt="">
            </div>
            <div class="col single-brand">
                <img class="img-fluid" src="/static/img/l5.png" alt="">
            </div>
        </div>
    </div>
</section>
<!-- End brand Area -->


<!-- Start blog Area -->
<section class="blog-area section-gap">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-md-12 pb-40 header-text text-center">
                <h1 class="pb-10">Последние новости</h1>
                <p>
                    Последние новости
                </p>
            </div>
        </div>
        <div class="row">
            <#if lastNews??>
            <#list lastNews as news>
            <div class="col-lg-6 col-md-6 blog-left">
                <div class="thumb">
                    <img class="" height="252" width="540" src="${news.imgName}" alt="">
                </div>
                <div class="detais">
                    <ul class="tags">
                        <li><a href="/news">Новости</a></li>
                    </ul>
                    <a href="/news/single-news/${news.id}"><h4>${news.title}</h4></a>
                    <p>
                        ${news.text}
                    </p>
                    <p class="date">${news.date}</p>
                </div>
            </div>
            </#list>
        </#if>
        </div>
    </div>
</section>
<!-- End blog Area -->
</@c.page>

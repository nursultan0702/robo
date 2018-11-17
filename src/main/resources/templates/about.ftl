<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>
<#include "parts/security.ftl">

<@c.page>
<@b.banner "Our Teachers"/>
<!-- Start products Area -->
<section class="products-area section-gap">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-md-12 pb-40 header-text text-center">
                <h1 class="pb-10">Our Teachers</h1>
            </div>
        </div>
        <div class="row">
            <#list teachers as teacher>
            <div class="col-lg-3 col-md-6">
                <div class="single-product">
                    <div class="thumb">
                        <img src="${teacher.image}" alt="">
                    </div>
                    <div class="details">
                        <h4>${teacher.getFullName()}</h4>
                        <p>
                            ${teacher.profession}
                        </p>
                        <a href="/course/teachers/${teacher.id}" class="primary-btn text-uppercase">View Courses</a>
                    </div>
                </div>
            </div>
            </#list>
        </div>
    </div>
</section>
<!-- End products Area -->
</@c.page>
<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>

<@c.page>
<@b.banner "My courses"/>
<#assign count = 0>
<div class="whole-wrap">
    <div class="container">
        <div class="section-top-border">
            <h3 class="mb-30">Table</h3>
            <div class="progress-table-wrap">
                <div class="progress-table">
                    <div class="table-head">
                        <div class="serial">#</div>
                        <div class="country">Course name</div>
                        <div class="visit">Author</div>
                        <div class="percentage">Percentages</div>
                    </div>
                    <#list courses as course>
                    <#assign count = count + 1>
                    <div class="table-row">
                        <div class="serial">${count}</div>
                        <div class="country"> <img height="30px" width="50" src="${course.img}" alt="flag"><a href="/task/${course.id}">${course.name}</a></div>
                        <div class="visit"><p>author:${course.teacher.username}</div>
                        <div class="percentage">
                            <div class="progress">
                                <div class="progress-bar color-1" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                </#list>
                </div>
            </div>
        </div>
    </div>
</div>

</@c.page>
<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>
<#include "parts/security.ftl">

<@c.page>
<@b.banner "Игра"/>
<section class="products-area section-gap">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-md-12 pb-40 header-text text-center">
                <div>
                <h5>Нажмите на любую кнопку чтобы играть</h5> <br/>
                <button class="genric-btn info-border radius" onclick="start()">Начать игру</button>
                </div>
<canvas class="mt-3" id="canvas" width="288" height="512"></canvas>
            </div>
        </div>
    </div>
</section>
<script src="/js/game.js"></script>
</@c.page>
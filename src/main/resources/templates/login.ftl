<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>

<@c.page>
<@b.banner "Войти"/>
<!-- Start Sample Area -->
<section class="sample-text-area">
    <div class="container">
        <h3 class="text-heading">Text Sample</h3>
        <form action="/login" method="post">
            <div class="mt-10">
                <input type="email" name="username" placeholder="Email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email address'" required class="single-input">
            </div>
            <div class="mt-10">
                <input type="password" name="password" placeholder="Email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" required class="single-input">
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div><input class="genric-btn primary" type="submit" value="Sign In"/></div>

        </form>
        <a class="genric-btn primary-border small" href="/registration">Registration</a>
    </div>
</section>
</@c.page>

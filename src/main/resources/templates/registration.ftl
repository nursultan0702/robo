<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>

<@c.page>
<@b.banner "Добавить нового пользователя"/>
<!-- Start Sample Area -->
<section class="sample-text-area">
    <div class="container">
        <h3 class="text-heading">Добавить нового пользователя</h3>
        <form action="/registration" method="post" enctype="multipart/form-data">
            <div class="mt-10">
                <input type="email" autocomplete="off" name="username" placeholder="Email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email address'" required class="single-input">
            </div>
            <div class="mt-10">
                <input type="firstname" autocomplete="off" name="firstname" placeholder="Имя" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Имя'" required class="single-input">
            </div>
            <div class="mt-10">
                <input type="secondname" autocomplete="off" name="secondname" placeholder="Фамилия" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Фамилия'" required class="single-input">
            </div>
            <div class="mt-10">
                <input type="middlename" autocomplete="off" name="middlename" placeholder="Отчество" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Отчество'" required class="single-input">
            </div>
            <div class="mt-10">
                <label>Специальность(Только для учителей)</label>
                <input type="text" autocomplete="off" name="profession" value=""  required class="single-input">
            </div>
            <div class="mt-10">
                <input type="password" autocomplete="off" name="password" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" required class="single-input">
            </div>
            <#list roles as role>
            <div class="mt-10 switch-wrap d-flex justify-content-between">
                <p>${role}</p>
                <div class="${role}">
                    <input type="checkbox"  name="${role}" id="confirm-checkbox" >
                    <label for="${role}"></label>
                </div>
            </div>
        </#list>
            <div class="mt-10">
                <label>Выберите фото(максимальный размер картинки 2Мб)</label>
                <input class="mt-3" type="file" name="image" multiple length="2024">
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div class="mt-3"><input class="genric-btn primary" type="submit" value="Зарегистрировать"/></div>

        </form>
    </div>
</section>
</@c.page>
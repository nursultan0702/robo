<#import "parts/common.ftl" as c>
<#import "parts/banner.ftl" as b>
<#include "parts/security.ftl">

<@c.page>
<@b.banner "Редактирование пользователей"/>

<section class="sample-text-area">
    <div class="container">
        <div class="row">
            <div style="width:180px; height:170px;">
            <img src="${edituser.image}"  class="img-thumbnail" alt="Cinque Terre">
            </div>
            <h3 class="pl-3 text-heading">${edituser.username}</h3>
        </div>
        <form class="mt-5" action="/user" method="post" enctype="multipart/form-data">
            <div class="mt-10">
                <label>E-mail</label>
                <input type="text" autocomplete="off" name="username" value="${edituser.username}"  required class="single-input">
            </div>
            <div class="mt-10">
                <label>Имя</label>
                <input type="text" autocomplete="off" name="firstname" value="${edituser.firstname}"  required class="single-input">
            </div>
            <div class="mt-10">
                <label>Фамилия</label>
                <input type="text" autocomplete="off" name="secondname" value="${edituser.secondname}"  required class="single-input">
            </div>
            <div class="mt-10">
                <label>Отчество</label>
                <input type="text" autocomplete="off" name="middlename" value="${edituser.middlename}"  required class="single-input">
            </div>
            <#if isTeacher || isAdmin>
            <div class="mt-10">
                <label>Специальность</label>
                <input type="text" autocomplete="off" name="profession" value="${edituser.profession}"  required class="single-input">
            </div>
            </#if>
            <div class="mt-10">
                <label>Пароль</label>
                <input type="password" autocomplete="off" name="password" value="${edituser.password}}"  required class="single-input">
            </div>
            <div class="mt-3 switch-wrap d-flex justify-content-between">
                <p>Изменить пароль</p>
                <div class="confirm-checkbox">
                    <input type="checkbox" name="changePassword" id="confirm-checkbox">
                    <label for="confirm-checkbox"></label>
                </div>
            </div>
            <#list roles as role>
            <div class="mt-10 switch-wrap d-flex justify-content-between">
                <p>${role}</p>
                <div class="${role}">
                    <input type="checkbox"  name="${role}" id="confirm-checkbox" ${edituser.roles?seq_contains(role)?string("checked", "")} >
                    <label for="${role}"></label>
                </div>
            </div>
        </#list>
        <div class="mt-10">
            <label>Выберите фото(максимальный размер картинки 2Мб)</label>
            <input class="mt-3" type="file" name="image" multiple length="2024">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="hidden" value="${edituser.id}" name="userId">
        <input type="hidden" value="isEdit" name="isEdit">

        <div class="mt-3"><input class="genric-btn primary" type="submit" value="Сохранить"/></div>

        </form>
    </div>
</section>
</@c.page>
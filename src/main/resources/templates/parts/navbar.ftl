<#include "security.ftl">
<nav id="nav-menu-container">
    <ul class="nav-menu">
        <li class="menu-active"><a href="/">Главная</a></li>
        <li class="menu-has-children"><a href="/course">Курсы</a>
            <ul>
                <li><a href="/course/my">Мои Курсы</a></li>
                <#if isTeacher || isAdmin>
                <li><a href="/course/add-course">Добавить новый курс</a></li>
                </#if>
            </ul>
        </li>
        <#if isAdmin>
        <li><a class="menu-has-children" href="/user">Пользователи </a>
        <ul>
            <li><a href="/registration">Добавить нового пользователя</a></li>
        </ul>
        </li>
    </#if>
    <li><a href="/news">Новости</a></li>
    <li><a href="/about">О нас</a></li>
    <#if known>
    <li>
        <div class="dropdown">
            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">${name}</button>
            <ul class="dropdown-menu">
                <li>
                    <form action="/logout" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button class="btn btn-danger" type="submit" style="width:100%">Logout</button>
                    </form>
                </li>
                <li>
                    <a href="/user/profile">Профиль</a>
                </li>
            </ul>
        </div>
    </li>

    <#else>
        <li><a href="/login">Войти</a></li>
    </#if>

</ul>

</nav><!-- #nav-menu-container -->

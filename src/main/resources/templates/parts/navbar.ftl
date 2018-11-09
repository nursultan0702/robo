<#include "security.ftl">
<nav id="nav-menu-container">
    <ul class="nav-menu">
        <li class="menu-active"><a href="/">Домой</a></li>
        <li class="menu-active"><a href="/course">Курсы</a></li>
        <li><a href="/course/my">Мои Курсы</a></li>
        <#if isAdmin>
        <li><a href="/user">Users</a></li>
    </#if>
    <li><a href="/news">News</a></li>
    <li class="menu-has-children"><a href="">Blog</a>
        <ul>
            <li><a href="blog-home.html">Blog Home</a></li>
            <li><a href="blog-single.html">Blog Single</a></li>
        </ul>
    </li>
    <li><a href="contact.html">Contact</a></li>
    <li class="menu-has-children"><a href="">Dropdown</a>
        <ul>
            <li><a href="elements.html">Elements</a></li>
            <li><a href="product-details.html">Product Details</a></li>
            <li class="menu-has-children"><a href="">Level 2</a>
                <ul>
                    <li><a href="#">Item 1</a></li>
                    <li><a href="#">Item 2</a></li>
                </ul>
            </li>
        </ul>
    </li>
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
            </ul>
        </div>
    </li>

    <#else>
        <li><a href="/login">Login</a></li>
    </#if>

</ul>

</nav><!-- #nav-menu-container -->

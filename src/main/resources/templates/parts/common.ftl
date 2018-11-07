<#macro page>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/fav.png">
    <!-- Author Meta -->
    <meta name="author" content="codepixer">
    <!-- Meta Description -->
    <meta name="description" content="">
    <!-- Meta Keyword -->
    <meta name="keywords" content="">
    <!-- meta character set -->
    <meta charset="UTF-8">
    <!-- Site Title -->
    <title>Eduonline</title>

    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet">
    <!--
    CSS
    ============================================= -->
    <link rel="stylesheet" href="static/css/linearicons.css">
    <link rel="stylesheet" href="static/css/font-awesome.min.css">
    <link rel="stylesheet" href="static/css/bootstrap.css">
    <link rel="stylesheet" href="static/css/magnific-popup.css">
    <link rel="stylesheet" href="static/css/nice-select.css">
    <link rel="stylesheet" href="static/css/hexagons.min.css">
    <link rel="stylesheet" href="static/css/animate.min.css">
    <link rel="stylesheet" href="static/css/owl.carousel.css">
    <link rel="stylesheet" href="static/css/main.css">
</head>
<body>
<header id="header" id="home">
    <div class="container main-menu">
        <div class="row align-items-center justify-content-between d-flex">
            <div id="logo">
                <a href="index.html"><img src="img/logo.png" alt="" title=""/></a>
            </div>
            <nav id="nav-menu-container">
                <ul class="nav-menu">
                    <li class="menu-active"><a href="index.html">Home</a></li>
                    <li><a href="about.html">About Us</a></li>
                    <li><a href="services.html">Services</a></li>
                    <li><a href="products.html">Products</a></li>
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
                </ul>
                <form action="/logout" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <div><input class="genric-btn primary" type="submit" value="Logout"/></div>

                </form>
            </nav><!-- #nav-menu-container -->
        </div>
    </div>
</header><!-- #header -->

<!-- start banner Area -->
<section class="banner-area" id="home">
    <div class="container">
        <div class="row fullscreen d-flex align-items-center justify-content-center">
            <div class="banner-content col-lg-6 col-md-6">
                <h1>
                    Improved <br>
                    Production level <br>
                    with Robotics
                </h1>
                <p class="text-white text-uppercase">
                    Everyone wants the innovation through robotics
                </p>
                <a href="#" class="primary-btn header-btn text-uppercase">View Details</a>
            </div>
            <div class="banner-img col-lg-6 col-md-6">
                <img class="img-fluid" src="img/banner-img.png" alt="">
            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->
<#nested>
</body>
</html>
</#macro>
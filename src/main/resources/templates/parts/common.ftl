<#macro page>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="/static/img/fav.png">
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
    <link rel="stylesheet" href="/static/css/linearicons.css">
    <link rel="stylesheet" href="/static/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <link rel="stylesheet" href="/static/css/magnific-popup.css">
    <link rel="stylesheet" href="/static/css/nice-select.css">
    <link rel="stylesheet" href="/static/css/hexagons.min.css">
    <link rel="stylesheet" href="/static/css/animate.min.css">
    <link rel="stylesheet" href="/static/css/owl.carousel.css">
    <link rel="stylesheet" href="/static/css/main.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<header id="header" id="home">
    <div class="container main-menu">
        <div class="row align-items-center justify-content-between d-flex">
            <div id="logo">
                <a href="/"><img src="/static/img/logo.png" alt="" title=""/></a>
            </div>
            <#include "navbar.ftl">
        </div>
    </div>
</header><!-- #header -->
<#nested>

<#include "footer.ftl">
<script src="/static/js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="/static/js/vendor/bootstrap.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
<script src="/static/js/easing.min.js"></script>
<script src="/static/js/hoverIntent.js"></script>
<script src="/static/js/superfish.min.js"></script>
<script src="/static/js/jquery.ajaxchimp.min.js"></script>
<script src="/static/js/jquery.magnific-popup.min.js"></script>
<script src="/static/js/owl.carousel.min.js"></script>
<script src="/static/js/hexagons.min.js"></script>
<script src="/static/js/jquery.nice-select.min.js"></script>
<script src="/static/js/jquery.counterup.min.js"></script>
<script src="/static/js/waypoints.min.js"></script>
<script src="/static/js/mail-script.js"></script>
<script src="/static/js/main.js"></script>
<script src="/static/js/custom.js"></script>
</body>
</html>
</#macro>
<!DOCTYPE html>
<!--[if lt IE 8 ]><html class="no-js ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="no-js ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="no-js ie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 8)|!(IE)]><!--><html class="no-js" lang="en"><!--<![endif]-->
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--- Basic Page Needs
   ================================================== -->
    <meta charset="utf-8">
    <title>Vishesh Singhal's blog</title>
    <meta name="author" content="vishesh">

    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="/css/default.css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/media-queries.css">

    <!-- Script
   ================================================== -->
    <script src="/js/jquery-1.10.2.min.js"></script>
    <script src="/js/modernizr.js"></script>

    <!-- Favicons
    ================================================== -->
    <link rel="shortcut icon" href="/favicon.ico">

    <script type="text/javascript" src="/js/sh/shCore.js"></script>
    <script type="text/javascript" src="/js/sh/shBrushGroovy.js"></script>
    <script type="text/javascript" src="/js/sh/shBrushJava.js"></script>
    <script type="text/javascript" src="/js/sh/shBrushXml.js"></script>
    <script type="text/javascript" src="/js/sh/shBrushJScript.js"></script>
    <script type="text/javascript" src="/js/sh/shBrushPython.js"></script>
    <script type="text/javascript" src="/js/sh/shBrushPlain.js"></script>
    <script type="text/javascript" src="/js/sh/shBrushVb.js"></script>
    <script type="text/javascript" src="/js/sh/shBrushRuby.js"></script>
    <link type="text/css" rel="stylesheet" href="/css/sh/shCore.css"/>
    <link type="text/css" rel="stylesheet" href="/css/sh/shThemeDefault.css"/>
    <script type="text/javascript">
        SyntaxHighlighter.config.clipboardSwf = '/js/sh/clipboard.swf';
        SyntaxHighlighter.all();
    </script>

  <style>
    .syntaxhighlighter table {
      table-layout: fixed;
      width: 100% !important;
    }

  </style>
</head>

<body>

<!-- Header
   ================================================== -->
<header id="top">

    <div class="row">

        <div class="header-content twelve columns">

            <h1 id="logo-text"><a href="/" title="">It's full of code</a></h1>

        </div>

    </div>

    <nav id="nav-wrap">

        <a class="mobile-btn" href="#nav-wrap" title="Show navigation">Show Menu</a>
        <a class="mobile-btn" href="#" title="Hide navigation">Hide Menu</a>

        <div class="row">

            <ul id="nav" class="nav">
                <li id="home" class="current"><a href="/">Home</a></li>
                <li id="projects"><a href="/projects">Projects</a></li>
                <li id="about"><a href="/Blog/about">About</a></li>
            </ul> <!-- end #nav -->

        </div>

    </nav> <!-- end #nav-wrap -->

</header> <!-- Header End -->
<g:layoutBody/>
<!-- Java Script
   ================================================== -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="/js/jquery-1.10.2.min.js"><\/script>')</script>
<script type="text/javascript" src="/js/jquery-migrate-1.2.1.min.js"></script>
<script src="/js/main.js"></script>

<g:set var="gaId" value="${grails.util.Holders.config.googleAnalyticsId}" />
<g:if test="${gaId}">
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', '${gaId}', 'auto');
        ga('send', 'pageview');

    </script>
</g:if>

</body>

</html>
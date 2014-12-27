<%--
  Created by IntelliJ IDEA.
  User: vishesh
  Date: 28-Sep-14
  Time: 12:54 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="common"/>
</head>

<body>
<div id="content-wrap">
    <div class="row">
        <div id="main" class="nine columns">
            <section class="page">
                <h2>
                    About me
                </h2>
                <p>
                    I am Vishesh from India. I love coding and learning new technologies.I have been building softwares for more than 5 years now and I have 2 years of professional experience in making web-apps. I have experience in web development, building on cloud platforms like salesforce,google app engine. I love to make mashup applications by leveraging different apis. I am an active blogger and I blog about my projects and my learnings on this site.<br>
                    <strong>Email:</strong>&nbsp;<a href="mailTo:v@visheshsinghal.com">v@visheshsinghal.com</a><br>
                    <strong>Github:</strong>&nbsp;<a href="https://github.com/vishesh04?tab=repositories">vishesh04</a>
                </p>
            </section>
        </div>
        <div id="sidebar" class="three columns">
            <img src="/images/vishesh.jpg" />
        </div>
     </div>
</div>
<footer>

    <div class="row">
        <p class="copyright">Template by <a title="Styleshout" href="http://www.styleshout.com/">Styleshout</a>.</p>

    </div> <!-- End row -->

    <div id="go-top"><a class="smoothscroll" title="Back to Top" href="#top"><i class="fa fa-chevron-up"></i></a></div>

</footer> <!-- End Footer-->
<script>
    $("#home").removeClass('current')
    $("#projects").removeClass('current')
    $("#about").addClass('current')
</script>
</body>
</html>
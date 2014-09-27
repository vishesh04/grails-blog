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
                    I am a recent graduate from Bits-Pilani,India.I love coding and learning new technologies.I use Java as primary development language.I have experience in web development,building on cloud platforms like salesforce,google app engine.I am also interested in android development.I love to make mashup applications by leveraging different apis.I am an active blogger and I blog about the things I learn
                </p>
            </section>
        </div>
        <div id="sidebar" class="three columns">
            <img src="/images/vishesh.jpg" />
        </div>
     </div>
</div>
<script>
    $("#home").removeClass('current')
    $("#about").addClass('current')
</script>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: vishesh
  Date: 27-Sep-14
  Time: 9:00 PM
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
            <g:each var="project" in="${projects}">
                <div class="post-snippet">
                    <h2>
                        ${raw(project.title)}
                    </h2>
                    <p>
                    <strong>Platform:</strong>&nbsp;&nbsp;&nbsp;${raw(project.platforms.join(", "))}<br>
                    <strong>Technologies:</strong>&nbsp;&nbsp;&nbsp;${raw(project.technologies.join(", "))}<br>
                    <strong>Description:</strong>&nbsp;&nbsp;&nbsp;${raw(project.description)}
                    </p>
                </div>
            </g:each>
        </div>
        <!--
        <div id="sidebar" class="three columns">
            <div class="widget widget_categories">
                <h3>Categories</h3>
                <ul>
                    <li><a href="#" title="">Google</a> (1)</li>
                    <li><a href="#" title="">Salesforce</a> (0)</li>
                </ul>
            </div>
        </div>
        -->
    </div>
</div>
<script>
    $("#home").removeClass('current')
    $("#about").removeClass('current')
    $("#projects").addClass('current')
</script>
</body>
</html>
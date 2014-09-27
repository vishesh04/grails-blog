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
            <g:each var="post" in="${posts}">
                <div class="post-snippet">
                    <h2>
                        ${raw(post.title)}
                    </h2>
                    <p>
                        ${raw(post.htmlContent)}
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
</body>
</html>
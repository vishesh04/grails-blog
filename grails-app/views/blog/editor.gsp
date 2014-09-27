<%--
  Created by IntelliJ IDEA.
  User: vishesh
  Date: 25-Sep-14
  Time: 7:15 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <script type="text/javascript" src="/js/tinymce/tinymce.min.js"></script>
    <script type="text/javascript">
        tinymce.init({
            plugins:["insertdatetime media table contextmenu paste code link image"],
            selector: "textarea"
        });
    </script>
    <style>
        textarea {
            height: 400px;
        }
        #title {
            width: 100%;
        }
    </style>
</head>

<body>
    <form action="/Blog/save" method="post">
        <input type="text" name="title" placeholder="Title" id="title" value="${blogPost?.title}"/>
        <textarea name="htmlContent">${blogPost?.htmlContent}</textarea>
        <input type="submit" value="Submit">
    </form>

</body>
</html>
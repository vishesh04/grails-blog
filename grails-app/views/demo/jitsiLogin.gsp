<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Login</title>
  <meta name="layout" content="common"/>
</head>

<body>
  <div id="content-wrap">
    <div class="row">
      <div id="main" class="tweleve columns">
        ${flash.message}
        <form role="form" method="post" action="/jitsi/login">
          <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" name="password">
          </div>
          <div class="form-group">
            <label for="refreshInterval">Refresh Interval:</label>
            <input type="number" class="form-control" id="refreshInterval" name="refreshInterval" value="5">
          </div>
          <button type="submit" class="btn btn-default">Submit</button>
        </form>
      </div>
    </div>
  </div>

  <script>
    $("#logo-text").html("Jellrtc Login");
    $("#nav-wrap").hide();
  </script>
</body>
</html>
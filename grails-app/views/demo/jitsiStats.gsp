<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="common"/>
</head>

<body>
  <title>Jellrtc Stats</title>
  <link rel="stylesheet" href="/css/bootstrap3-twbs.min.css">
  <script src="/js/moment.js"></script>
  <style>
    .row {
      max-width: none;
    }
    .table {
      table-layout:fixed;
      width:100%;
    }
    .logout{
      float: right;
      position: absolute;
      top:108px;
      margin-left: 1140px;
      margin-top: 15px;
    }
  </style>

  <div id="content-wrap">
    <div class="row">
      <div id="main" class="tweleve columns">
          <div class="twbs ">
            <table class="table table-striped table-bordered table-condensed table-responsive">
              <thead>
              <th>Date</th>
              <th>Time</th>
              <th>Participants</th>
              <th>Audio Channels</th>
              <th>Bit Rate Download</th>
              <th>Bit Rate Upload</th>
              <th>Conferences</th>
              <th>CPU Usage</th>
              <th>Graceful Shutdown</th>
              <th>Rtp Loss</th>
              <th>Threads</th>
              <th>Total Memory</th>
              <th>Used Memory</th>
              <th>Video Channels</th>
              <th>Video Streams</th>
              </thead>
              <tbody id="statsTab">
              </tbody>
            </table>
          </div>
      </div>
    </div>
  </div>

  <script>
    var refreshIterval = ${refreshInterval};

    function getStats() {
      $.get('/api/jitsi/stats', function(data) {
        $('#statsTab').append('<tr>' +
        '<td>' + moment(data.current_timestamp).format('MMMM Do YYYY') +'</td>' +
        '<td>' + moment(data.current_timestamp).format('h:mm:ss a') +'</td>' +
        '<td>' + data.participants +'</td>' +
        '<td>' + data.audiochannels +'</td>' +
        '<td>' + data.bit_rate_download +'</td>' +
        '<td>' + data.bit_rate_upload +'</td>' +
        '<td>' + data.conferences +'</td>' +
        '<td>' + data.cpu_usage +'</td>' +
        '<td>' + data.graceful_shutdown +'</td>' +
        '<td>' + data.rtp_loss +'</td>' +
        '<td>' + data.threads +'</td>' +
        '<td>' + data.total_memory +'</td>' +
        '<td>' + data.used_memory +'</td>' +
        '<td>' + data.videochannels +'</td>' +
        '<td>' + data.videostreams +'</td>' +
        '</tr>');
      })
    }

    $('document').ready(function () {
      $("#logo-text").html("Jellrtc Stats");
      $("<a class='logout' href='/jitsi/logout'>Logout</a>").insertAfter("#logo-text");
      $("#nav-wrap").hide();
      getStats();
      setInterval(function() {
        getStats();
      }, refreshIterval*1000);
    })
  </script>
</body>
</html>
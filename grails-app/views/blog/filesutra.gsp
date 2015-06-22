<head>
  <meta name="layout" content="common"/>
</head>

<body>
<link rel="stylesheet" href="/css/bootstrap3-twbs.min.css">
<script src="http://filesutra.com/js/filesutra.js"></script>
<div id="content-wrap">
  <div class="row">
    <div id="main" class="seven columns">
      <section class="page">
        <h2>
          Filesutra
        </h2>

        <p>
          Filesutra is a tool to quickly implement the file import from popular cloud storage providers. Filesutra  currently supports Google Drive, Microsoft OneDrive, Box and Dropbox. <br/><br/>
          To use filesutra, add following script to your html page -
        <pre class="brush: javascript;">&lt;script src="http://filesutra.com/js/filesutra.js"&gt;&lt;/script&gt;</pre>
        Then add following code to click handler of import button -
        <pre class="brush: javascript;">
          $("#importBtn").click(function() {
            filesutra.importFiles(function(data) {
            // File import response is available in 'data' variable
            /** sample response
            {
              "fileName": "sample.pdf",
              "downloadUrl": "",
              "size": 12345
            }
            **/
            console.log(data);
            });
          });
        </pre>
        Above example assumes that jquery is already inclued in the page. Please checkout the demo by clicking the 'Import File from Cloud' button in the right.
      </p>
      </section>
    </div>
    <div id="sidebar" class="five columns">
      <div class="row">
          <h3 style="margin-top: 55px; margin-bottom: 20px">Demo</h3>
          <div style="text-align: center">
            <button id="importBtn">Import File from Cloud</button>
          </div>
          <div class="twbs ">
            <table class="table table-striped table-bordered
            table-condensed table-responsive hide" id="fileTable" style="margin-top: 20px;">
              <thead>
                <th>File Name</th>
                <th>Download Url</th>
                <th>Size</th>
              </thead>
              <tbody id="fileTableBody">
              </tbody>
            </table>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>
<script>
  $("#home").removeClass('current');

  $("#importBtn").click(function() {
    filesutra.importFiles(function(data) {
      if (data) {
        var size = data.size ? data.size : "-";
        $("#fileTable").removeClass('hide');
        $("#fileTableBody").append(
          "<tr style='text-align: center'>" +
            "<td>" + data.fileName + "</td>" +
            "<td><a href='" + data.downloadUrl + "'>" + data.downloadUrl +"</td>" +
            "<td>" + size  + "</td>" +
          "</tr>"
        );
      }
    });
  });
</script>
</body>

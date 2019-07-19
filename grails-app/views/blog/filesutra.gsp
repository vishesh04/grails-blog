<head>
  <meta name="layout" content="common"/>
</head>

<body>
<link rel="stylesheet" href="/css/bootstrap3-twbs.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://app.filesutra.com/dist/filesutra.js"></script>
<div id="content-wrap">
  <div class="row">
    <div id="main" class="seven columns">
      <section class="page">
        <h2>
          Filesutra
        </h2>

        <p>
          Filesutra is an opensource tool to quickly implement the file imports and uploads to popular cloud storage providers. Filesutra currently supports Google Drive, Microsoft OneDrive, Box and Dropbox. <br/><br/>
          To use filesutra, add following script to your html page -
        <pre class="brush: javascript;">&lt;script src="https://app.filesutra.com/dist/filesutra.js"&gt;&lt;/script&gt;</pre>
        
        Then add following code to click handler of import button -
        <pre class="brush: javascript;">
          $("#importBtn").click(function() {
            filesutra.importFiles(function(files) {
              // File import response is available in 'files' variable
              /** sample response
              [{
                "fileName": "sample.pdf",
                "downloadUrl": "http://filesutra.com/download/teGhzSfIp4zJLW9",
                "size": 12345
              }]
              **/
            });
          });
        </pre>

        To request files from people and have them automatically upload to your preconfigured folder in cloud storage, please add following code to click handler of file request button -
        <pre class="brush: javascript;">
          $("#requestFilesBtn").click(function() {
            filesutra.createFileRequest(function(fileRequest) {
              /** sample response
              {
                "name": "sample", // Name of the folder
                "url": "http://filesutra.com/upload/teGhzSfIp4zJLW9",
              }
              **/
            });
          });
        </pre>

        Above example assumes that jquery is already inclued in the page. Please checkout the demo by clicking the 'Import Files' button in the right.<br />

        Filesutra is an opensource project. Code is available on <a href="https://github.com/vishesh04/Filesutra">Github</a>
      </p>
      </section>
    </div>
    <div id="sidebar" class="five columns">
      <div class="row">
          <h3 style="margin-top: 55px; margin-bottom: 20px">Demo</h3>
          <div style="text-align: center">
            <button id="importBtn">Import Files</button>
          </div>
          <div class="twbs ">
            <table class="table table-striped table-bordered
            table-condensed table-responsive hide" id="fileTable" style="margin-top: 20px; table-layout:fixed; width: 100%">
              <thead>
                <th style="width: 30%; text-align: center">File Name</th>
                <th style="width: 55%; text-align: center">Download Url</th>
                <th style="width: 15%; text-align: center">Size</th>
              </thead>
              <tbody id="fileTableBody">
              </tbody>
            </table>
          </div>

          <div style="text-align: center">
            <button id="requestFilesBtn" style="margin-top: 20px;">Request Files</button>
          </div>
          <div class="twbs ">
            <table class="table table-striped table-bordered
            table-condensed table-responsive hide" id="folderTable" style="margin-top: 20px; table-layout:fixed; width: 100%">
              <thead>
                <th style="width: 30%; text-align: center">Folder Name</th>
                <th style="width: 55%; text-align: center">Upload Url</th>
              </thead>
              <tbody id="folderTableBody">
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
  var apps = ["google", "box", "dropbox", "ofb"]

  var init = function(mode) {
    filesutra.init({
      server: "https://app.filesutra.com",
      apps: apps,
      defaultApp: apps[0],
      type: "popup",
      accountId: "mq2CECYaWRrcgiuiWARdFHAe",
      mode: mode
    })
  }

  $("#importBtn").click(function() {
    init();
    filesutra.importFiles(function(data) {
      if (data) {
        if (data.length) {
          $("#fileTable").removeClass('hide');
          $.each(data, function(index, file) {
            console.log(file)
            var size = file.size ? file.size : "-";
            $("#fileTableBody").append(
              "<tr style='text-align: center'>" +
                "<td>" + file.fileName + "</td>" +
                "<td><a href='" + file.downloadUrl + "'>" + file.downloadUrl +"</td>" +
                "<td>" + file.size  + "</td>" +
              "</tr>"
            );
          });
        }
      }
    });
  });

  $("#requestFilesBtn").click(function() {
    init("requestFiles");

    filesutra.createFileRequest(function(fileRequest) {
      $("#folderTable").removeClass('hide');
      $("#folderTableBody").append(
              "<tr style='text-align: center'>" +
                "<td>" + fileRequest.name + "</td>" +
                "<td><a href='" + fileRequest.url + "'>" + fileRequest.url +"</td>" +
              "</tr>"
            );
      
    });
  });
</script>
</body>

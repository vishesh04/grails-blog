<body>
<div id="content-wrap">
    <div class="row">
        <div id="main" class="nine columns">
            <section class="page">
                <h2 class="entry-title">
                    Show private documents to your users from google drive without sharing them
                </h2>
                <p>
                    In this post I will write how we can use google api to show content on our page from google drive, without actually changing the sharing settings for the document. We will use owner's oAuth access to proxy the content through our server.<br><br>

                    <b>Implementation:</b>
                    I am using google drive sdk for java in this code snippet: <a href="https://developers.google.com/drive/v2/reference/">https://developers.google.com/drive/v2/reference/</a>
                    Given the fileId of a file uploaded on google drive we can query google to get the following info about file:<br><br>

                    <b>Alternate link:</b>This is the link to file where the document can be accessed on google drive itself.<br>
                    <b>Download url:</b> Link to download the original file. This is available only for the contetn uploaded on google drive. It is not available for the content created on google drive like google doc, google spreadsheet, google drive etc.<br>
                    <b>Export Links:</b> links to export the documents in different formats. These links are only available for the content created on google drive like google doc, google spreadsheet, google drive etc. and are not available for content uploaded on google drive.<br><br>

                    All of these links require google authentication and our end user doesn't have access to these documents. We are considering that our web application has been authorized(using oAuth) to access these documents by the document owner. Given these links we can make authenticated get request to these links on owner's behalf(by using access token) and serve this content to our end user by writing it to output stream. To make the authenticated get call we will use following code: Note that we are not reading all content in controller method in one go and then serving it, but we are actually buffering it in 8k chunks.<br><br>

                    <pre class="brush: java;">
                        URL url = new URL(contentUrl)
                        URLConnection connection = url.openConnection();
                        connection.setRequestProperty("Authorization", 'Bearer ' + accessToken);

                        // this will actually buffer/stream the file in 8k chunks instead of reading the entire file into memory.
                        org.apache.commons.io.IOUtils.copy(connection.getInputStream(), response.outputStream)
                    </pre><br>
                    Controller method to proxy the data and serve it on our page:<br>
                    <pre class="brush: java;">
                        private static HttpTransport httpTransport = new NetHttpTransport()
                        private static JacksonFactory jsonFactory = new JacksonFactory();

                        //This is a controller method in our web-app
                        def viewGDOC(){
                        String fileId = params.fileId
                        String accessToken // read this from database using session
                        String refreshToken // read this from database using session

                        GoogleCredential gCredentials = new GoogleCredential.Builder()
                        .setClientSecrets(CLIENT_ID, CLIENT_SECRET)
                        .setJsonFactory(jsonFactory).setTransport(httpTransport).build()
                        .setRefreshToken(refreshToken).setAccessToken(accessToken);

                        Drive driveService = new Drive.Builder(httpTransport, jsonFactory, credentials).build();
                        com.google.api.services.drive.model.File file = driveService.files().get(chapter.gDriveFileId).execute()

                        String contentUrl
                        def downloadUrl = file.getDownloadUrl()
                        def pdfUrl = file.getExportLinks()?.get("application/pdf")
                        if (downloadUrl) {
                        contentUrl = downloadUrl
                        } else {
                        contentUrl = pdfUrl
                        }

                        URL url = new URL(contentUrl)
                        URLConnection connection = url.openConnection();
                        connection.setRequestProperty("Authorization", 'Bearer ' + googleCredential.accessToken);

                        // this will actually buffer/stream the file in 8k chunks instead of reading the entire file into memory.
                        org.apache.commons.io.IOUtils.copy(connection.getInputStream(), response.outputStream)
                        }
                    </pre><br><br>
                    Once we get the content stream the next task is to show it to user. Since browsers can display only some mime types like image, video, pdf, we can't directly show many file other types like MS word documents. To better understand this upload a office format file like ppt to google drive and use the above code to proxy the content. You will see that the browser will not render proxied content  properly but instead download a zip which contains raw structure of file.<br>
                    The solution is to use some kind of viewer that takes this type of content and converts it to html so that browser can display it. Think how google shows word file when you view it in google drive ? There are many web apps which take the url of file and gives back the html. e.g. : <i>viewer.js, crocodoc, google viewer</i>. We will use the google viewer here: <a href="https://developers.google.com/drive/v2/reference/">https://developers.google.com/drive/v2/reference/</a>https://docs.google.com/viewer<br>
                    So if you are using iframe on your page to show the file content instead of pointing iframs's src to /viewGDoc , point it to <a href="https://docs.google.com/viewer?url='serverName/viewGDoc'&embedded=true">https://docs.google.com/viewer?url='serverName/viewGDoc'&embedded=true</a> . Please note that if you are using iframe the 'embedded=true' option is necessary in the url as without this the content that google viewer returns is non iframable(X Frame Options is sameorigin in that case).
                </p>
            </section>
        </div>
        <div id="sidebar" class="three columns">
            <div class="widget widget_categories">
                <h3>Categories.</h3>
                <ul>
                    <li><a href="#" title="">Google</a> (1)</li>
                    <li><a href="#" title="">Salesforce</a> (0)</li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>

<%--
  Created by IntelliJ IDEA.
  User: vishesh
  Date: 21-May-14
  Time: 12:18 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <script src="js/jquery-1.10.2.min.js"></script>
    <script src="js/jquery-dateFormat.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
    <title>topcoder</title>

    <style>
        #loader {
            margin: 100px;
        }
    </style>
</head>

<body>
<center><img id="loader" src="images/loader.gif" /></center>
<table class="table table-striped table-bordered table-condensed table-responsive"></table>

<script>
    $.get('/Tc/explore?password=${params.password}', function(data){
        $("#loader").hide()
        var lastSeen = $.cookie('TcExplorer')
        var tHead = "<tr>"+
                "<th>Type</th>"+
                "<th>Name</th>"+
                "<th>Timeline</th>"+
                "<th>Prizes</th>"+
                "<th>Submissions</th>"+
                "<th>Registrants</th>"+
                "<th>Current Phase</th>"+
                "</tr>"
        $("table").append(tHead);

        $.each(data, function(ix,val){
            var row = "<tr"
            var tech = ''
            //var registrationStartDate = new Date(val.registrationStartDate);
            var startTime = (new Date(val.registrationStartDate)).getTime()
            if (startTime > lastSeen) {
                row+=" Style='background-color:#99FF33'"
            }
            row+=">"
            var registrationStartDate = $.format.toBrowserTimeZone(val.registrationStartDate, "ddd dd MMM hh:mm a")
            var registrationEndDate = $.format.toBrowserTimeZone(val.registrationEndDate, "dd MMM hh:mm a")
            var submissionEndDate = $.format.toBrowserTimeZone(val.submissionEndDate, "dd MMM hh:mm a")
            $.each(val.technologies, function (mIx, mVal) {
                if(tech != '')
                    tech+=", ";
                tech+=mVal;
            });
            row+="<td>"+val.challengeType+"</td>"
            row+="<td><a target='_blank' href='http://www.topcoder.com/challenge-details/"+val.challengeId+"'>"+val.challengeName+"</a><br><br>"+tech+"</td>"
            row+="<td> Started: "+registrationStartDate+"<br> Register: "+registrationEndDate+"<br> Submit: "+submissionEndDate+"</td>"
            row+="<td> Total: "+val.totalPrize+"<br> 1st: "+val.firstPlacePrize/**+"<br>Dr pts. "+val.digitalRunPoints**/+"</td>"
            row+="<td>"+val.numSubmissions+"</td>"
            row+="<td>"+val.numRegistrants+"</td>"
            row+="<td>"+val.currentPhaseName+"</td>"
            row+="</tr>"
            $("table").append(row);
        });
        $.cookie('TcExplorer', (new Date()).getTime(), { expires: 365 });
    });

</script>
</body>
</html>
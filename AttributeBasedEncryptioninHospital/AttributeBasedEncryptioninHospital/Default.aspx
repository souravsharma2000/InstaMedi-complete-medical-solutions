<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Google Maps Api Get Current Location Latitude and Longitude</title>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=places"></script>
    <script type="text/javascript">
        function geolocate() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    var geolocation = new google.maps.LatLng(
                        position.coords.latitude, position.coords.longitude);
                    var location = "<b>Latitude</b>: " + geolocation.A + "<br/>";
                    location += "<b>Longitude</b>: " + geolocation.F;
                    document.getElementById('lblResult').innerHTML = location
                });
            }
        }
    </script>
</head>
<body>
    <div style="margin-top: 200px; margin-left: 200px">
        <span>Location:</span>
        <input type="button" id="btnGet" value="Get Latitude & Longitude" onclick="geolocate()" /><br />
        <br />
        Current Location Latitude & Longitude:<br />
        <br />
        <label id="lblResult" />
    </div>
</body>
</html>

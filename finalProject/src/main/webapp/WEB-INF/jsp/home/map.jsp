<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/Navbar.jsp" %>
<%@ include file="../admin/subnav_admin.jsp" %>

<script src="http://maps.googleapis.com/maps/api/js?v=3.2&libraries=geometry&sensor=false"
        type="text/javascript"></script>

<div id="map" style="width: 500px; height: 400px; max-width: 100%"></div>


<script type="text/javascript">
var locations = [];
    $.ajax({
//            headers: {
//                'Accept': 'application/json',
//                'Content-Type': 'application/json'
//            },
        type: "get",
        url: "/rest/maplist/",
        dataType: "json",
        success: function (data) {
            console.log("success");
            console.log(data);
            for(var i = 0; i < data.length; i++){
                if(data[i].isRunning == "true") {
                    console.log(data[i].truckName + data[i].truckLocation.coordinates + i);

                    var s =  data[i].truckLocation.coordinates;
                    var res = s.split(",");
                    var lat = +res[0];
                    var long = +res[1];
//                    s.index

                    console.log("Lat" + lat);
                    console.log(data[i]);
                    console.log("Long" + long);

                    console.log("truckName: " + data[i].truckName);

                     locations.push(
                             [ data[i].truckName, lat, long, i ]);
                }
            }
            locations.push(['Ryans Taco Truck', 44.977230, -93.000, 4]);

        },
        error: function (data) {
            var a = 2;
        }

    });

    function makeNewLocation(truckName, lat, long, i) {
        return { tName: truckName, latitude: lat, longitude: long, idx:i };
    }

    var pos;
    navigator.geolocation.getCurrentPosition(function(position) {

        pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude

        };
        console.log(pos);

        console.log("outside" + pos);
        var map = new google.maps.Map(document.getElementById('map'), {

            zoom: 10,
            center: new google.maps.LatLng(pos.lat, pos.lng),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        });

        var infowindow = new google.maps.InfoWindow();

        var marker, i;

        console.log("test");

//        var goldStar = {
//            path: 'M 125,5 155,90 245,90 175,145 200,230 125,180 50,230 75,145 5,90 95,90 z',
//            fillColor: 'yellow',
//            fillOpacity: 0.5,
//            scale:.15,
//            strokeColor: 'gold',
//            strokeWeight: 1
//        };

        for (i = 0; i < locations.length; i++) {
            console.log(locations[i]);
            marker = new google.maps.Marker({
                position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                icon: "/static/images/van.png",
                map: map
            });

            google.maps.event.addListener(marker, 'click', (function(marker, i) {
                return function() {
                    infowindow.setContent(locations[i][0]);
                    infowindow.open(map, marker);
                }
            })(marker, i));
        }
    });
</script>



<%@ include file="../includes/footer.jsp" %>
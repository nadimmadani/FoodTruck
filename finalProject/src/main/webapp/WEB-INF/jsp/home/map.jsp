<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/Navbar.jsp" %>
<%@ include file="../admin/subnav_admin.jsp" %>

<script src="http://maps.google.com/maps/api/js?sensor=false"
        type="text/javascript"></script>

<div id="map" style="width: 500px; height: 400px; max-width: 95%"></div>


<script type="text/javascript">


        var locations = [
            ['Ryans Taco Truck', 44.977230, -93.269491, 4],
               <c:forEach var="truck" items="${newVehicleList}">
                    [${truck.name}, ${truck.truckLocation.coordinates}, ${truck.id}]
               </c:forEach>
        ];


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

        for (i = 0; i < locations.length; i++) {
            marker = new google.maps.Marker({
                position: new google.maps.LatLng(locations[i][1], locations[i][2]),
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
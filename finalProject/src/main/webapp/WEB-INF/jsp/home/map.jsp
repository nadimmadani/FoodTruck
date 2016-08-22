<%@ include file="../includes/header.jsp" %>

<script src="http://maps.googleapis.com/maps/api/js?v=3.2&libraries=geometry&sensor=false"
        type="text/javascript"></script>

<%--<div id="map" style="width: 50%; height: 50%; max-width: 100%"></div>--%>
<script>
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
[ data[i].truckName, lat, long, i, data[i].id ]);
}
}
locations.push(['Ryans Taco Truck', 44.977230, -93.000, 4]);

},
error: function (data) {
var a = 2;
}

});

function makeNewLocation(truckName, lat, long, i, id) {
    return { tName: truckName, latitude: lat, longitude: long, idx:i, truckId:id };
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

google.maps.event.addListener(marker, 'mouseover', (function(marker, i) {
    return function() {
        infowindow.setContent(locations[i][0]);
        infowindow.open(map, marker);
        console.log("This is the truck id: " + locations[i][4]);
//        $('.listAllVehicles').hide();
    }

    })(marker, i));


    google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
            console.log("This is the truck id: " + locations[i][4]);
            $('#myModal').modal('show');
        }

    })(marker, i));

    }
});
</script>


<c:choose>
<c:when test="${loggedInUser != 'anonymousUser'}">


    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6" style="padding: 0px; margin: 0px">
                <div id="map"  class="sizeContent" class="col-md-6"></div>
            </div>
            <div class="col-lg-6 hidden-md-down" id="contentLoggedIn">

                    <%--begin thumbnail--%>
                        <a href="#myModal"><div class="row listAllVehicles">
                            <div class="col-sm-4 col-md-4">
                                <div class="thumbnail">
                                    <img class="img-responsive" src="/static/images/food-truck.jpg" alt="...">
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8">
                                <div class="caption">
                                    <h3 class="text-center">Thumbnail label</h3>
                                    <p>This is a truck descriptions</p>
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                                </div>
                            </div></a>
                        </div>

                <%--end thumbnail--%>

                        <div class="row listAllVehicles">
                            <div class="col-sm-4 col-md-4">
                                <div class="thumbnail">
                                    <img class="img-responsive" src="/static/images/food-truck.jpg" alt="...">
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8">
                                <div class="caption">
                                    <h3 class="text-center">Thumbnail label</h3>
                                    <p>This is a truck descriptions</p>
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="row listAllVehicles">
                            <div class="col-sm-4 col-md-4">
                                <div class="thumbnail">
                                    <img class="img-responsive" src="/static/images/food-truck.jpg" alt="...">
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8">
                                <div class="caption">
                                    <h3 class="text-center">Thumbnail label</h3>
                                    <p>This is a truck descriptions</p>
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="row listAllVehicles">
                            <div class="col-sm-4 col-md-4">
                                <div class="thumbnail">
                                    <img class="img-responsive" src="/static/images/food-truck.jpg" alt="...">
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8">
                                <div class="caption">
                                    <h3 class="text-center">Thumbnail label</h3>
                                    <p>This is a truck descriptions</p>
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="row listAllVehicles">
                            <div class="col-sm-4 col-md-4">
                                <div class="thumbnail">
                                    <img class="img-responsive" src="/static/images/food-truck.jpg" alt="...">
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8">
                                <div class="caption">
                                    <h3 class="text-center">Thumbnail label</h3>
                                    <p>This is a truck descriptions</p>
                                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                                </div>
                            </div>
                        </div>



            </div>
        </div>
    </div>

</c:when>
<c:otherwise>

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6" style="padding: 0px; margin: 0px">
                <div id="map"  class="sizeContent2" class="col-md-6"></div>
            </div>

            <div class="col-lg-6 hidden-md-down" style="box-shadow: -5px 4px 10px #888888; margin-left: 0px; height: calc(100% - 65px )">
                Logged Out Text
            </div>
        </div>
    </div>

    </c:otherwise>
</c:choose>




<!-- Button trigger modal -->
<%--<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">--%>
    <%--Launch demo modal--%>
<%--</button>--%>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<%--old way of doing things--%>

<%--<c:choose>--%>
    <%--<c:when test="${loggedInUser != 'anonymousUser'}">--%>


            <%--<div id="map" style="width: 50%; margin-top: 130px; position:absolute; height: calc(100% - 130px ); left:0px; top:0px; bottom:0px; "></div>--%>

            <%--<div style="width: 50%; margin-top: 130px; position:absolute;margin-bottom: -300; height: calc(100% - 130px ); right:0px; top:0px; bottom:-500px; box-shadow: -5px 0px 10px #888888;">text</div>--%>

    <%--</c:when>--%>
    <%--<c:otherwise>--%>

        <%--<div id="map" style="width: 50%; margin-top: 65px;  position:absolute; height: 100%; left:0px; top:0px; bottom:0px; "></div>--%>

        <%--<div style="width: 50%; margin-top: 65px; margin-bottom: -400; position:absolute; height: 100%; right:0px; top:0px; bottom:0px; box-shadow: -5px 0px 10px #888888;">text</div>--%>
    <%--</c:otherwise>--%>
<%--</c:choose>--%>


<%@ include file="../includes/footer.jsp" %>
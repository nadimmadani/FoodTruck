<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/Navbar.jsp" %>
<%@ include file="subnav_admin.jsp" %>

<script>
    $(document).ready(function () {

        $('.txtbox').on("change", function () {
            var values = this.id.split("z");
            var truckId = values[1];
            console.log("Text box change");
//            console.log(truckId);
//            var ver = $('#ver' + truckId).attr("value");
//            console.log(ver);
//            console.log($('#ver' + truckId));
//            console.log($('#namez' + truckId).val());
            updateTruck(truckId);

        })

    });
    //    function getCords() {

    var cords;
    navigator.geolocation.getCurrentPosition(function (position) {

        cordsLat = (position.coords.latitude);
        cordsLong = (position.coords.longitude);

    })

    function deleteTruck(id) {
        console.log("deleteTruck called with id: " + id)

        $.ajax({
            type: "DELETE",
            url: "/rest/deleteTruck/" + id,
            timeout: 5000,
            success: function () {
                console.log("success");
                console.log(id);
                $("#rowId" + id).remove();
            }
        });

    }

    function updateTruck(id){

        console.log("updateTruck called, with id: " + id);

        var ver = $('#ver' + id).attr("value");
        var name = $('#namez' + id).val();
//        console.log("name: " + name);

        var desc = $('#descz' + id).val();
        var isRunning = $('#isRunning'+ id + ' input:checked');
        var isRunningValue;

        if(typeof isRunning[0] != 'undefined') {
            isRunningValue = 'true';
        }else {
            isRunningValue = 'false';
        }
//        console.log(cords);

        var truckLocation = {

            coordinates: cords
        };
        var truckToUpdate = {
            "id": id,
            "version": ver,
            "truckMenu": null,
            "truckLocation":truckLocation,
            "truckName": name,
            "truckDescription": desc,
            "isRunning": isRunningValue
        };
//        console.log("=============")
//        console.log(truckToUpdate);

//        console.log(cordsLat);
//        console.log(cordsLong);
        $.ajax({
//            headers: {
//                'Accept': 'application/json',
//                'Content-Type': 'application/json'
//            },
            type: "post",
            data: truckToUpdate,
            url: "/rest/update/" + cordsLat + "/" + cordsLong + ".",
            async: true,
            dataType: "json",
            success: function (data) {
                $('#ver' + id).val(ver++);
                console.log("success");
//                console.log(data);
            },
            error: function (data) {
                var a = 2;
            }
        });
    }

</script>

<div class="col-sm-12">
    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>Truck Name</th>
            <th>Description</th>
            <th>Active</th>
        </tr>
        </thead>
        <form:form cssClass="form-horizontal" modelAttribute="adminVo" action="/admin/editist/${truck.id}" method="post">

        <tr>
            <td>
                    ${truck.id}
            </td>
            <td>
                    <%--<input type="text" class="form-control txtbox" id="namez${truck.id}" value="${truck.truckName}"/>--%>
                <input type="text" class="form-control txtbox" id="namez${truck.id}" value="${truck.truckName}"/>
            </td>
                <td>
            <input type="text" class="form-control txtbox" id="descz${truck.id}" value="${truck.truckDescription}"/>
        </td>

        </form:form>

<%@ include file="../includes/footer.jsp" %>
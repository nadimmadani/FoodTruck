<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/Navbar.jsp" %>
<%@ include file="subnav_admin.jsp" %>

<script>

    var pos;
    navigator.geolocation.getCurrentPosition(function(position) {
        pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude

        };
        console.log(pos);
    })

    function updateTruck(id, ver){
        var name = $('#name' + id).val();
        var desc = $('#desc' + id).val();
        var isRunning = $('#isRunning'+ id + ' input:checked');
        var isRunningValue;
        if(typeof isRunning[0] != 'undefined') {
            isRunningValue = 'true';
        }else {
            isRunningValue = 'false';
        }
//        isRunning.val(isRunning[0].checked ? "true" : "false");
//        var isRunning = $('#isRunning' + id).val()
//

        var truckToUpdate = {
            "id": id,
            "version": ver,
            "truckMenu": null,
            "truckLocation": null,
            "truckName": name,
            "truckDescription": desc,
            "isRunning": isRunningValue
        }

        $.ajax({
//            headers: {
//                'Accept': 'application/json',
//                'Content-Type': 'application/json'
//            },
            type: "post",
            data: truckToUpdate,
            url: "/rest/update",
            async: true,
            dataType: "json",
            success: function (data) {
                console.log("success");
                console.log(data);
            }
        });

        console.log(truckToUpdate);
    }

//delete truck

    function deleteTruck(id, ver) {
        var id = $('#id' + id).val();
        var id = $('#ver' + id).val();


        var truckToDelete = {
            "id": id,
            "version": ver
        }

        $.ajax({
            //            headers: {
            //                'Accept': 'application/json',
            //                'Content-Type': 'application/json'
            //            },
            type: "get",
            data: truckToUpdate,
            url: "/rest/delete",
            async: true,
            dataType: "json",
            success: function (data) {
                console.log("success");
                console.log(data);
            }
        });

        console.log(truckToUpdate);
    }




</script>

<link rel="stylesheet" href="/static/css/switch.css">

<div class="wrapper">

    <%@ include file="trucks_sidebar.jsp"%>
    <div id="main-wrapper" class="col-sm-10">

        <h4>When active is checked the app will update the map with your current location.</h4>

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
                <form:form cssClass="form-horizontal" modelAttribute="adminVO" action="/admin/trucklist" method="post">
                    <c:forEach var="truck" items="${newTruckList}">
                        <hidden id="id${truck.id}" value="${truck.id}"/>
                        <hidden id="ver${truck.id}" value="${truck.version}"/>
                        <hidden id="loc${truck.id}" value="${truck.truckLocation}"
                        <tr>
                            <td>
                                ${truck.id}
                            </td>
                            <td>
                                <form:input path="newTruckName" type="text" class="form-control" id="name${truck.id}" value="${truck.truckName}"></form:input>
                            </td>
                            <td>
                                <form:input path="newTruckDescription" type="text" class="form-control" id="desc${truck.id}" value="${truck.truckDescription}"></form:input>
                            </td>
                            <td>
                                <label id="isRunning${truck.id}" class="switch">
                                    <input type="checkbox" ${truck.isRunning == 'true' ? 'checked' : ''}/>
                                    <div class="slider round"></div>
                                </label>
                            </td>
                            <td><button class="btn btn-default" type="button" onclick="updateTruck(${truck.id}, ${truck.version})" >Update</button></td>
                            <td><button class="btn btn-default" type="button" onclick="deleteTruck(${truck.id}, ${truck.version})" >Delete</button></td>
                        </tr>
                    </c:forEach>
                </form:form>
            </table>
        </div>
    </div>
</div>

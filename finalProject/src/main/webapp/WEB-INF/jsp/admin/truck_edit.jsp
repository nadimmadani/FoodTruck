<%@ include file="../includes/header.jsp" %>
<script>
//    $(document).ready(function () {
//
//        $('.txtbox').on("change", function () {
//            var values = this.id.split("z");
//            var truckId = values[1];
//            console.log("Text box change");
////            console.log(truckId);
////            var ver = $('#ver' + truckId).attr("value");
////            console.log(ver);
////            console.log($('#ver' + truckId));
////            console.log($('#namez' + truckId).val());
//            updateTruck(truckId);
//
//        })
//
//    });
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

        var imagePath = $('#file.rel').val();

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
            "isRunning": isRunningValue,
            "imagePath": imagePath
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
                console.log(imagePath);
            },
            error: function (data) {
                var a = 2;
               console.log(imagePath);
            }
        });
    }

</script>

<div class="container">
    <div class="row">
        <h4 class="text-center">Edit Truck</h4>
    </div>
    <hr/>
    <div class="row">
        <div class="col-lg-9 col-md-9 col-sm-9 col-lg-offset-1 col-md-offset-1 col-sm-offset-1">
            <form:form cssClass="form-horizontal" modelAttribute="truck" enctype="multipart/form-data" action="/upload" method="post">
            <hidden
            <hidden id="imagepathz${truck.imagePath}" value="${newTruck.imagePath}"></hidden>

            <fieldset>

                <div class="row">
                    <div class="form-group">

                        <div class="col-sm-2">
                            <label for="namez${truck.id}" class="control-label">Truck Name</label>
                        </div>
                        <div class="col-sm-10">

                            <form:input path="truckName" type="text" class="form-control txtbox" id="namez${truck.id}" value="${newTruck.truckName}"></form:input>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-2">
                            <label for="descz${truck.id}" class="control-label">Truck Description</label>
                        </div>
                        <div class="col-sm-10">

                            <form:input type="text" path="truckDescription" class="form-control txtbox" id="descz${truck.id}" value="${truck.truckDescription}"></form:input>

                                <%--upload--%>


                            <div th:if="${message}">
                                <h2 th:text="${message}"/>
                            </div>

                            <div>
                                <%--<form method="POST" enctype="multipart/form-data" action="/upload">--%>
                                    <table>
                                        <tr><td>File to upload:</td><td><input type="file" name="file" /></td></tr>
                                        <tr><td></td><td><input type="submit" value="Upload" /></td></tr>
                                    </table>
                                <%--</form>--%>
                            </div>

                            <div>
                                <ul style="list-style: none;">
                                    <li th:each="file : ${files}">
                                        <a th:href="${file.href}" th:text="${file.rel}" />
                                    </li>
                                </ul>
                            </div>

                                <%--//end of upload--%>

                        </div>
                    </div>
                </div>
            </fieldset>
            </form:form>

                <div class="form-group">
                    <%--<div class="col-lg-10 col-lg-offset-2">--%>
                        <%--<div class="btn-group" role="group">--%>
                            <a href="../trucklist"><button onclick="updateTruck(${truck.id})" class="btn btn-primary">Save</button></a>
                        <%--</div>--%>
                        <%--<div class="btn-group" role="group">--%>
                            <button type="reset" value="cancel" class="btn btn-default">Cancel</button>
                        <%--</div>--%>
                    <%--</div>--%>
                </div>

<%@ include file="../includes/footer.jsp" %>
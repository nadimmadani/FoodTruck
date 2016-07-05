<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/Navbar.jsp" %>
<%@ include file="subnav_admin.jsp" %>

<link rel="stylesheet" href="/static/css/switch.css">

<div class="wrapper">

    <%@ include file="trucks_sidebar.jsp"%>
    <div id="main-wrapper" class="col-sm-10">

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
                        <tr>
                            <td>
                                ${truck.id}
                            </td>
                            <td>
                                <form:input path="newTruckName" type="text" class="form-control" id="inputNewTruckName" placeholder="${truck.truckName}"></form:input>
                            </td>
                            <td>
                                <form:input path="newTruckDescription" type="text" class="form-control" id="inputNewTruckDescription" placeholder="${truck.truckDescription}"></form:input>
                            </td>
                            <td>
                                <label class="switch">
                                    <form:input path="isTruckRunning" type="checkbox"></form:input>
                                    <div class="slider round"></div>
                                </label>
                            </td>
                        </tr>
                    </c:forEach>
                </form:form>
            </table>
        </div>
    </div>
</div>

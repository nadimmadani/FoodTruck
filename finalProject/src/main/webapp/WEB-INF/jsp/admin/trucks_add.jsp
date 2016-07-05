<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/Navbar.jsp" %>
<%@ include file="subnav_admin.jsp" %>

<div class="Wrapper">
    <%@ include file="trucks_sidebar.jsp"%>
    <div class="col-lg-8">
        <form:form cssClass="form-horizontal" modelAttribute="AdminVO" action="/admin/addtruck" method="post">
            <fieldset>
                <legend>Add New Truck</legend>

                <div class="form-group">
                    <label for="inputNewTruck" class="col-lg-2 control-label">Truck Name</label>
                    <div class="col-sm-10">
                        <form:input path="newTruckName" type="text" class="form-control" id="inputNewTruck" placeholder="Insert truck name"></form:input>
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputNewTruck" class="col-lg-2 control-label">Truck Description</label>
                    <div class="col-sm-10">
                        <form:input path="newTruckDescription" type="text" class="form-control" id="inputNewTruck" placeholder="Insert truck description"></form:input>
                    </div>
                </div>

                <br/>

                    <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                        <form:button type="submit" value="save" class="btn btn-primary">Save</form:button>
                        <form:button type="reset" value="cancel" class="btn btn-default">Cancel</form:button>
                    </div>
                </div>

            </fieldset>
        </form:form>
    </div>
</div>
<%@ include file="../includes/footer.jsp" %>
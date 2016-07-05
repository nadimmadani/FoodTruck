<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/Navbar.jsp" %>
<%@ include file="../admin/subnav_admin.jsp" %>


<div class="Wrapper">
    <div class="col-lg-8">
        <form:form cssClass="form-horizontal" modelAttribute="AdminVO" action="/home/signup" method="post">
            <fieldset>
                <legend>Truck Owner Sign Up</legend>

                <div class="form-group">
                    <label for="inputNewUserName" class="col-lg-2 control-label">Username:</label>
                    <div class="col-sm-10">
                        <form:input path="newUserName" type="text" class="form-control" id="inputNewUserName" placeholder="Insert new username"></form:input>
                    </div>
                </div>

                <div class="form-group">
                    <label for="inputNewPassword" class="col-lg-2 control-label">Password:</label>
                    <div class="col-sm-10">
                        <form:input path="newPassword" type="text" class="form-control" id="inputNewPassword" placeholder="Create a password"></form:input>
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
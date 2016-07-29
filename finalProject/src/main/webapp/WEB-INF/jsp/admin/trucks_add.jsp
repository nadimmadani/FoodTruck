<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/Navbar.jsp" %>
<%@ include file="subnav_admin.jsp" %>

<html xmlns:th="http://www.thymeleaf.org">


<div class="container">
    <div class="row">
        <h4 class="text-center">Add New Truck</h4>
    </div>
    <hr/>
    <div class="row">
        <div class="col-lg-9 col-md-9 col-sm-9 col-lg-offset-1 col-md-offset-1 col-sm-offset-1">
            <form:form cssClass="form-horizontal" modelAttribute="AdminVO" action="/admin/addtruck" method="post">
                <fieldset>

                    <div class="row">
                        <div class="form-group">

                            <div class="col-sm-2">
                                <label for="inputNewTruck" class="control-label">Truck Name</label>
                            </div>
                            <div class="col-sm-10">
                                <form:input path="newTruckName" type="text" class="form-control" id="inputNewTruck"
                                            placeholder="Insert truck name"></form:input>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-2">
                                <label for="inputNewTruck" class="control-label">Truck Description</label>
                            </div>
                            <div class="col-sm-10">
                                <form:input path="newTruckDescription" type="text" class="form-control"
                                            id="inputNewTruck"
                                            placeholder="Insert truck description"></form:input>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="btn-group btn-group-justified" role="group" aria-label="...">
                            <div class="btn-group" role="group">
                                <form:button type="submit" value="save"
                                             class="btn btn-primary">Save</form:button>
                            </div>
                            <div class="btn-group" role="group">
                                <form:button type="reset" value="cancel"
                                             class="btn btn-default">Cancel</form:button>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </form:form>

            <%--upload--%>


            <div th:if="${message}">
                <h2 th:text="${message}"/>
            </div>

            <div>
                <form method="POST" enctype="multipart/form-data" action="/upload">
                    <table>
                        <tr><td>File to upload:</td><td><input type="file" name="file" /></td></tr>
                        <tr><td></td><td><input type="submit" value="Upload" /></td></tr>
                    </table>
                </form>
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
<%@ include file="../includes/footer.jsp" %>
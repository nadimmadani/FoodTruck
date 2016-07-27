<c:choose>
    <c:when test="${loggedInUser != 'anonymousUser'}">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                        <%--ADMIN HOME--%>

                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="#">Your Truck(s)</a>
                </div>
                <div class="collapse navbar-collapse" id="navbar-collapse-2">
                    <ul class="nav navbar-nav">
                            <%--PAGE LINKS--%>
                        <li><a href="/admin/trucklist">Edit</a></li>
                        <li><a href="/admin/addtruck/">Add</a></li>
                        <li><a href="#">Profile</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </c:when>
    <c:otherwise>

    </c:otherwise>
</c:choose>

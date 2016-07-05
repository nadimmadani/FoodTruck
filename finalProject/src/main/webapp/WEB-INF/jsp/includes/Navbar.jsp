<nav class="navbar navbar-static-top navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <%--HOME--%>

            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a  class="navbar-brand" href="/home/">Home</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse-1">
            <ul class="nav navbar-nav">
                <%--PAGE LINKS--%>
                <li><a href="/home/map">Map</a></li>
                <li><a href="#">Active Trucks</a></li>
                <li><a href="#">Events</a></li>
                <li><a href="#">About</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <%--LOGIN LINK--%>
                <c:choose>
                    <c:when test="${loggedInUser != 'anonymousUser'}">
                        <li><a href="/logout">logout</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="/home/login">Login</a> </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>
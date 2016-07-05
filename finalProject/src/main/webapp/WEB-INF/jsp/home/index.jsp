<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/Navbar.jsp" %>
<%@ include file="../admin/subnav_admin.jsp" %>


<div class="container">
    <div class="jumbotron">
        <h2>Welcome To The Best Food Truck locator in the Twin Cities Area!</h2>
        <p>Users can locate food trucks that are currently active in the area.</p>
    </div>

    <c:choose>
        <c:when test="${loggedInUser != 'anonymousUser'}">

        </c:when>
        <c:otherwise>
            <div style="display: inline-block; width: 100px; float:left"><a href="/home/login" class="btn btn-primary btn-lg">Login</a></div>
            <div style="display: inline-block; width: 100px; float:left"><a href="/home/signup" class="btn btn-primary btn-lg">Sign Up</a></div>
        </c:otherwise>
    </c:choose>

</div>

<%@ include file="../includes/footer.jsp" %>
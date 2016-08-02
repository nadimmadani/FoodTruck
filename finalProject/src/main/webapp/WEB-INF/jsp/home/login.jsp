<%@include file="../includes/header.jsp"%>


<div class="container blueBackground">
    <br/>
    <br/>

    <div class="col-sm-4" style="float: none; margin-left: auto; margin-right: auto; text-align: center" >
        <h3>Food Truck Login</h3>
        <br/>
        <br/>
        <form id="form" action="<c:url value='/login.do'/>" method="post">

            <c:if test="${not empty param.err}">
                <div class="msg-container error text-white">
                    <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
                </div>
            </c:if>
            <c:if test="${not empty param.out}">
                <div class="msg-container logout">
                    You've logged out successfully.
                </div>
            </c:if>
            <c:if test="${not empty param.time}">
                <div class="msg-container time text-white">
                    You've been logged out due to inactivity.
                </div>
            </c:if>

            <span class="text-white">Username:</span>
            <input type="text" name="username" value=""/>
            <br><br>
            <span class="text-white">Password:</span>
            <input type="text" name="password" value=""/>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <br/>
            <br/>

            <input value="Login" name="submit" type="submit" class="btn btn-default"/>

        </form>
        <br/>
        <p style="text-align: center"><strong>Not a user?</strong></p>
        <p style="text-align: center"><a href="/home/signup">Sign Up!</a></p>

    </div>
</div>
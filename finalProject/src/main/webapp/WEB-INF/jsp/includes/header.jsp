<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--FAVICON--%>

    <link rel="icon" href="/static/images/truck-152-237857.png" type="image/x-icon"/>
    <%--JQUERY--%>
    <c:url value="/webjars/jquery/2.1.4/jquery.min.js" var="jquery" />
    <script type="application/javascript" src="${jquery}"></script>

    <%--BOOTSTRAP--%>
    <c:url value="/webjars/bootstrap/3.3.4/js/bootstrap.min.js" var="bootstrapJS" />
    <script type="application/javascript" src="${bootstrapJS}"></script>

    <c:url value="../../../static/css/bootswatch_paper.css" var="bootstrapCSS" />
    <link href="${bootstrapCSS}" rel="stylesheet" media="screen">

    <%--<c:url value="/webjars/bootstrap/3.3.4/css/bootstrap.min.css" var="bootstrapCSS" />--%>
    <%--<link href="${bootstrapCSS}" rel="stylesheet" media="screen">--%>

    <c:url value="../../../static/css/map.css" var="mapCSS" />
    <link href="${mapCSS}" rel="stylesheet" media="screen">

    <title> Food Truck Locator</title>

    <%@ include file="../includes/Navbar.jsp" %>

    <%@ include file="../admin/subnav_admin.jsp" %>

</head>
<body>
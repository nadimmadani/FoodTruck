<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--FAVICON--%>


    <%--JQUERY--%>
    <c:url value="/webjars/jquery/2.1.4/jquery.min.js" var="jquery" />
    <script src="${jquery}"></script>

    <%--BOOTSTRAP--%>
    <c:url value="/webjars/bootstrap/3.3.4/js/bootstrap.min.js" var="bootstrapJS" />
    <script src="${bootstrapJS}"></script>

    <c:url value="/static/css/bootswatch_paper.css" var="bootstrapCSS" />
    <link href="${bootstrapCSS}" rel="stylesheet" media="screen">

    <%--<c:url value="/webjars/bootstrap/3.3.4/css/bootstrap.min.css" var="bootstrapCSS" />--%>
    <%--<link href="${bootstrapCSS}" rel="stylesheet" media="screen">--%>

    <title>Food Truck Locator</title>

</head>
<body>
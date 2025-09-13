<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Respuesta del Estudiante</title>
</head>
<body>
    <!-- Instanciar el JavaBean StudentHandler -->
    <jsp:useBean id="studentBean" class="com.mycompany.studentapp.StudentHandler" scope="request" />
    <!-- Establecer las propiedades del JavaBean desde los parámetros de la solicitud -->
    <jsp:setProperty name="studentBean" property="name" />
    <jsp:setProperty name="studentBean" property="dobString" param="dob" />

    <!-- Instanciar el JavaBean java.util.Date para obtener la hora actual -->
    <jsp:useBean id="now" class="java.util.Date" />
    <!-- Formatear la hora para extraer la hora del día -->
    <fmt:formatDate value="${now}" pattern="H" var="hourOfDay" />

    <div class="container">
        <h1>
            <c:choose>
                <c:when test="${hourOfDay >= 6 and hourOfDay < 12}">
                    Buenos días,
                </c:when>
                <c:when test="${hourOfDay >= 12 and hourOfDay < 19}">
                    Buenas tardes,
                </c:when>
                <c:otherwise>
                    Buenas noches,
                </c:otherwise>
            </c:choose>
            <jsp:getProperty name="studentBean" property="name" />!
        </h1>

        <p>
            Hemos recibido tus datos.
        </p>
        <p>
            Tu nombre es: <strong><jsp:getProperty name="studentBean" property="name" /></strong>
        </p>
        <p>
            Tu fecha de nacimiento es: <strong><jsp:getProperty name="studentBean" property="dobString" /></strong>
        </p>

        <c:if test="${studentBean.age != -1}">
            <p>
                Tu edad es: <strong><jsp:getProperty name="studentBean" property="age" /> años</strong>
            </p>
        </c:if>
        <c:if test="${studentBean.age == -1}">
            <p>
                No pudimos calcular tu edad. Asegúrate de que la fecha de nacimiento sea válida (YYYY-MM-DD).
            </p>
        </c:if>
    </div>
</body>
</html>


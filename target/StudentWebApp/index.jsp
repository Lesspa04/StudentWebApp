<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Formulario de Estudiante</title>  
</head>
<body>
    <h1>Registro de Estudiante</h1>
    <form name="Student Input Form" action="response.jsp" method="GET">
        <label for="name">Nombre:</label>
        <input type="text" id="name" name="name" required />

        <label for="dob">Fecha de Nacimiento:</label>
        <input type="date" id="dob" name="dob" required />

        <input type="submit" value="Enviar" />
    </form>
</body>
</html>
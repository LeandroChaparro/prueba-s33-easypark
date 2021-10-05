<%-- 
    Document   : Peticiones
    Created on : 2/10/2021, 2:08:26 p. m.
    Author     : Leandro
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.Usuario"%>
<%@page import="com.google.gson.Gson"%>

<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"  %>

<%

    String respuesta = "{";

    List<String> tareas = Arrays.asList(new String[]{
        "listarusuario",
        "eliminarusuario",
        "guardarUsuario",
        "actualizarusuario"
    });

   
%>


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

       String proceso = request.getParameter("proceso");

    if (tareas.contains(proceso)) {
        respuesta += "\"ok\":true, ";
        if (proceso.equals("guardarUsuario")) {

            String tdoc = request.getParameter("tipo_documento");
 
            String num_documento = request.getParameter("num_documento");
                       System.out.println(num_documento);
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String telefono = request.getParameter("telefono");
            String correo = request.getParameter("correo");
            String tvehi = request.getParameter("tipo_vehiculo");
            String placa = request.getParameter("placa");

            Usuario c = new Usuario();
            c.setTipo_documento(tdoc);
            c.setNum_documento(num_documento);
            c.setNombre(nombre);
            c.setApellido(apellido);
            c.setTelefono(telefono);
            c.setCorreo(correo);
            c.setTipo_vehiculo(tvehi);
            c.setPlaca(placa);

            if (c.guardarUsuario()) {
                respuesta += " \"guardarUsuario\":true";
            } else {

                respuesta += " \"guardarUsuario\":false";
            }

        } else if (proceso.equals("eliminarusuario")) {
            String num_documento = request.getParameter("num_documento");
            Usuario us = new Usuario();

            if (us.borrarUsuario(num_documento)) {
                respuesta += " \"eliminarusuario\":true";

            } else {
                respuesta += " \"eliminarusuario\":false";
            }
        } else if (proceso.equals("listarusuario")) {

            Usuario c = new Usuario();
            ArrayList<Usuario> lista= c.listaUsuarios();
            respuesta += " \"listarusuario\":true, \"Contactos\":" + new Gson().toJson(lista);
        } else if (proceso.equals("actualizarusuario")) {
            
            String tdoc = request.getParameter("tipo_documento");
            String num_documento = request.getParameter("num_documento");
                       System.out.println(num_documento);
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String telefono = request.getParameter("telefono");
            String correo = request.getParameter("correo");
            String tvehi = request.getParameter("tipo_vehiculo");
            String placa = request.getParameter("placa");

            Usuario c = new Usuario();
            c.setTipo_documento(tdoc);
            c.setNum_documento(num_documento);
            c.setNombre(nombre);
            c.setApellido(apellido);
            c.setTelefono(telefono);
            c.setCorreo(correo);
            c.setTipo_vehiculo(tvehi);
            c.setPlaca(placa);

            if (c.actualizarUsuario()) {
                respuesta += " \"actualizarusuario\":true";
            } else {

                respuesta += " \"actualizarusuario\":false";
            }

        }
        //-----------------------------------------------------------------------------------------------------------
    } else {

        respuesta += "\"ok\":false, ";

        respuesta += "\"errorMsg\": \"Proceso no válido\" ";

    }

    respuesta += "}";

    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);

%>


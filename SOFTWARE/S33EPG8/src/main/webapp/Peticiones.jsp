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


<%-- ¿Qué es lo que necesitamos hacer como respuesta a las peticiones?

    1. Identificar cual proceso es el que vamos a codificar o procesar y lueego
    2. Procesarlo y devolver una respuesta. OBJETIVO PRINCIPAL
    3. Vamos a responder esa respuesta (petición), la respuesta va a ser un diccionario
       como java no maneja diccionarios de java script de forma nativa entonces
       se CREA EL DICCIONARIO como si fuera un String.

--%>

<%-- Se crea la respuesta empezandola con una llave abierta y se va concatenando lo que se vaya respondiendo
 como parte de la concatenación de ese String:--%>


<%

     /* Vamos a empezar a avalidar si el proceso existe en la LISTA DE TAREAS y se puede procesar
    o sino que envié un error "     alert(res.data.errorMsg);   "(se encuentra en las funciones o métodos del index.jsp).
 
 LISTA DE TAREAS:
        "listarContacto",
        "eliminarContacto",
        "guardarContacto",
        "actualizarContacto"
 
     */
 
      /* Vamos a empezar con el REQUEST:
   * Se crea una variable de String para guardar el proceso con el cual me hicieron la petición
     se crea un archivo para todas las peticiones.
   * A partir de este request, obtener el parámetro ese metodo de ese objeto global.
   * EL parámetro se llama "proceso"

     */
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
            //Vamos a ir obteniendo cada uno de los datos que nos enviaron también del Frontend
            String tdoc = request.getParameter("tipo_documento");
 
            String num_documento = request.getParameter("num_documento");
                       System.out.println(num_documento);
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String telefono = request.getParameter("telefono");
            String correo = request.getParameter("correo");
            String tvehi = request.getParameter("tipo_vehiculo");
            String placa = request.getParameter("placa");
            //Ahora vamos a crer un objeto tipo usuario
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
    // Para responder de forma global tenemos el "request" pero ahora usamos el "response" 
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
    // y esto es lo que va a obtener "data" en "alert(res.data.errorMsg);"
%>


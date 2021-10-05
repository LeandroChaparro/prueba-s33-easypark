package logica;

/*
 * Grupo 8 EasyPark
 */
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import persistencia.ConexionBD;

public class Usuario {

    private int id_usuario;
    private String nombre;
    private String apellido;
    private String tipo_documento;
    private String num_documento;
    private String tipo_vehiculo;
    private String placa;
    private String telefono;
    private String correo;
    private ConexionBD conexion;

    public Usuario() {
    }

    public void setConexion() {
        this.conexion = new ConexionBD();
        /* Se modifico de "this.conexion = conexion;" a "this.conexion = new ConexionBD();"
        y se elimina la entrada "ConexionBD conexion" en "public void setConexion(ConexionBD conexion) {" para de una vez inicializar la conexión
         */
    }

// Para obtener datos hay dos metodos Get y Post, diferencia el cifrado de datos, con el get obtiene lo que envien del otro formulario y el Set asigna el valor a la variable.
// Es decir el campo de la tabla.
    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getTipo_documento() {
        return tipo_documento;
    }

    public void setTipo_documento(String tipo_documento) {
        this.tipo_documento = tipo_documento;
    }

    public String getNum_documento() {
        return num_documento;
    }

    public void setNum_documento(String num_documento) {
        this.num_documento = num_documento;
    }

    public String getTipo_vehiculo() {
        return tipo_vehiculo;
    }

    public void setTipo_vehiculo(String tipo_vehiculo) {
        this.tipo_vehiculo = tipo_vehiculo;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public boolean guardarUsuario() {
        String sentencia = "INSERT INTO usuarios(nombre, apellido, tipo_documento, num_documento, tipo_vehiculo, placa, telefono, correo) VALUES('" + this.nombre + "','" + this.apellido + "',"
                + "'" + this.tipo_documento + "','" + this.num_documento + "','" + this.tipo_vehiculo + "',"
                + "'" + this.placa + "','" + this.telefono + "','" + this.correo + "');";
        return conexion.insertarBD(sentencia);
    }

    public ArrayList<Usuario> listaUsuarios() {

        ArrayList<Usuario> listaUsuarios = new ArrayList<>();
        String sentencia = "SELECT * FROM usuarios";
        ResultSet rs = conexion.consultarBD(sentencia);
        Usuario us;
        try {
            while (rs.next()) {
                us = new Usuario();
                us.setId_usuario(rs.getInt("id_usuario"));
                us.setNombre(rs.getString("nombre"));
                us.setApellido(rs.getString("apellido"));
                us.setTipo_documento(rs.getString("tipo_documento"));
                us.setNum_documento(rs.getString("num_documento"));
                us.setTipo_vehiculo(rs.getString("tipo_vehiculo"));
                us.setPlaca(rs.getString("placa"));
                us.setTelefono(rs.getString("telefono"));
                us.setCorreo(rs.getString("correo"));
                listaUsuarios.add(us);
            }
        } catch (SQLException ex) {
            System.out.println("Error en la consulta a la base de datos: " + ex.getMessage());
        }

        return listaUsuarios;

    }
    
    
        public boolean actualizarUsuario() {

        String sentencia = "UPDATE usuarios SET nombre='" + this.nombre + "',apellido='" + this.apellido + "', tipo_documento='" + this.tipo_documento + "'"
                + ",num_documento='" + this.num_documento + "',tipo_vehiculo='" + this.tipo_vehiculo + "',placa='" + this.placa + "'"
                + ",telefono='" + this.telefono + ",correo='" + this.correo + "' WHERE num_documento='" + this.num_documento + "';";
        System.out.println(sentencia);
        return conexion.actualizarBD(sentencia);

    }
    
    

    public boolean borrarUsuario(String num_documento) {
        String sentencia = "DELETE FROM usuarios WHERE num_documento ='" + num_documento + "';";
        System.out.println(sentencia);
        return conexion.borrarBD(sentencia);
    }

//--------------------------------------Main para probar 
    public static void main(String[] args) {

//--------------------------------------Guardar Usuario_1 
/*
Usuario ejemploUsuario= new Usuario();
ejemploUsuario.setNombre("Pedro");
ejemploUsuario.setApellido("Pruebas");
ejemploUsuario.setTipo_documento("CC");
ejemploUsuario.setNum_documento("3459980");
ejemploUsuario.setTipo_vehiculo("Bicicleta");
ejemploUsuario.setPlaca("NoAplica");
ejemploUsuario.setTelefono("3007689393");
ejemploUsuario.guardarUsuario();

         */
//--------------------------------------Guardar Usuario_2                
/*
Usuario ejemploUsuario= new Usuario();
ejemploUsuario.setNombre("Yolanda");
ejemploUsuario.setApellido("Tambo");
ejemploUsuario.setTipo_documento("CC");
ejemploUsuario.setNum_documento("1002004567");
ejemploUsuario.setTipo_vehiculo("Carro");
ejemploUsuario.setPlaca("SKD-321");
ejemploUsuario.setTelefono("3112223334");
ejemploUsuario.guardarUsuario();
         */
//--------------------------------------Guardar Usuario_3          
/*          
Usuario ejemploUsuario= new Usuario();
ejemploUsuario.setNombre("Mireya");
ejemploUsuario.setApellido("Martinez");
ejemploUsuario.setTipo_documento("CC");
ejemploUsuario.setNum_documento("2134532122");
ejemploUsuario.setTipo_vehiculo("Carro");
ejemploUsuario.setPlaca("ETD-954");
ejemploUsuario.setTelefono("3139998885");
ejemploUsuario.guardarUsuario();
         */
//--------------------------------------Guardar Usuario_4    
/* 
Usuario ejemploUsuario= new Usuario();
ejemploUsuario.setNombre("Andres");
ejemploUsuario.setApellido("Martinez");
ejemploUsuario.setTipo_documento("CE");
ejemploUsuario.setNum_documento("1100021121");
ejemploUsuario.setTipo_vehiculo("Moto");
ejemploUsuario.setPlaca("GTO-078");
ejemploUsuario.setTelefono("3053333337");
ejemploUsuario.guardarUsuario();
         */
//--------------------------------------Listar Usuarios     
        Usuario ejemploUsuario = new Usuario();
        ArrayList<Usuario> ejemploListaUsuarios = ejemploUsuario.listaUsuarios();

        for (Usuario us : ejemploListaUsuarios) {
            System.out.println("El nombre del usuario es: " + us.getNombre() + " El apellido del usuario es: " + us.getApellido());
        }

//--------------------------------------Obtener Usuario
/*
Usuario ejemploUsuario = new Usuario();
ejemploUsuario.setNum_documento("1015412314");
ejemploUsuario=ejemploUsuario.obtenerUsuario();
System.out.println("El nombre es: "+ejemploUsuario.getNombre());
         */
//--------------------------------------Actualizar Usuario
/*
        Usuario ejemploUsuario = new Usuario();
        ejemploUsuario.setNombre("Leandro");
        ejemploUsuario.setApellido("Chaparro");
        ejemploUsuario.setTipo_documento("CC");
        ejemploUsuario.setNum_documento("1015412314");
        ejemploUsuario.setTipo_vehiculo("Carro");
        ejemploUsuario.setPlaca("ABC-123");
        ejemploUsuario.setTelefono("3118972801");

        ejemploUsuario.setId_usuario(1);
        ejemploUsuario.actualizarUsuario();
         */
//--------------------------------------Borrar Usuario 
/*
Usuario ejemploUsuario = new Usuario();
ejemploUsuario.borrarUsuario(5);
         */
    } //Cierre del Main    

}

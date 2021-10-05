<%-- 
    Document   : index
    Created on : 27/09/2021, 7:13:10 p. m.
    Author     : Leandro
--%>    

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRUD usuarios</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>  <%-------------------------------------------- Se carga la libreria de angular --------------------------------------------%>           
    </head>
    <body>

        <div class="container-fluid" ng-app="S33_G8_Usuarios" ng-controller="contactosController as cn">  

            <div class="row">
                <div class="col-12">
                    <center> <h1>EasyParking (S33-G8) Registro de Usuarios</h1></center>
                </div>
            </div>

            <div class="row">

                <div class="col-6"> 
                    <h3>Ingreso datos</h3> 


                    <div class="row">

                        <div class="col-6">
                            <label>Tipo de documento</label>
                            <select class="form-control" ng-model="cn.tipo_documento">
                                <option></option>
                                <option>CC</option>
                                <option>CE</option>
                                <option>TI</option>
                            </select>



                        </div>
                        <div class="col-6">
                            <label>N° de documento</label>
                            <input class="form-control" type="text" ng-model="cn.num_documento">
                        </div>                        

                    </div>
                    
                    <div class="row">
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" ng-model="cn.nombre">

                        </div>
                        <div class="col-6">
                            <label>Apellido</label>
                            <input class="form-control" type="text" ng-model="cn.apellido">
                        </div>                        

                    </div>                    
                    
                    
                    
                    
                    

                    <div class="row">
                        <div class="col-6">
                            <label>Teléfono</label>
                            <input class="form-control" type="text" ng-model="cn.telefono">
                        </div>
                        <div class="col-6">
                            <label>Correo</label>
                            <input class="form-control" type="text" ng-model="cn.correo">
                        </div>                        

                    </div>

                    <div class="row">
                        <div class="col-6">
                            <label>Tipo de vehículo</label>
                            <select class="form-control" ng-model="cn.tipo_vehiculo">
                                <option></option>
                                <option>Carro</option>
                                <option>Moto</option>
                                <option>Bicicleta</option>
                            </select>

                        </div>
                        <div class="col-6">
                            <label>Placa</label>
                            <input class="form-control" type="text" ng-model="cn.placa">
                        </div>                        

                    </div>
                    
                    <br>  
                    
                    <div class="row">
                        <div class="col-3">
                            <button class="btn btn-success" ng-click="cn.guardarUsuario()"> Guardar </button> 

                        </div>
                        <div class="col-3">
                            <button class="btn btn-primary" ng-click="cn.listarUsuarios()"> Listar Usuarios </button>

                        </div>
                        <div class="col-3">
                            <button class="btn btn-danger" ng-click="cn.eliminarUsuario()"> Eliminar  </button>

                        </div>
                        <div class="col-3">
                            <button class="btn btn-warning" ng-click="cn.actualizarUsuario()"> Actualizar  </button>
                        </div>
                    </div>


                </div>

                <div class="col-6">
                    <h3>Datos usuario</h3> 

                    <div class="row">
                        <div class="col-6">
                            <label>Tipo de documento</label>
                            <input class="form-control" type="text" value="{{cn.tipo_documento}}" disabled="">

                        </div> 

                        <div class="col-6">
                            <label>N° de documento</label>
                            <input class="form-control" type="text" value="{{cn.num_documento}}" disabled="">
                        </div>                        

                    </div>

                    <div class="row">
                        <div class="col-6">
                            <label>Nombre</label>
                            <input class="form-control" type="text" value="{{cn.nombre}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Apellido</label>
                            <input class="form-control" type="text" value="{{cn.apellido}}" disabled="">
                        </div>                        

                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label>Teléfono</label>
                            <input class="form-control" type="text" value="{{cn.telefono}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Correo</label>
                            <input class="form-control" type="text" value="{{cn.correo}}" disabled="">
                        </div>                        

                    </div>


                    <div class="row">
                        <div class="col-6">
                            <label>Tipo de vehículo</label>
                            <input class="form-control" type="text" value="{{cn.tipo_vehiculo}}" disabled="">
                        </div>
                        <div class="col-6">
                            <label>Placa</label>
                            <input class="form-control" type="text" value="{{cn.placa}}" disabled="">
                        </div>                        

                    </div>

                </div>
            </div>

            <div class="row">
                <div class="col-12 table-responsive-xl">
                    <h3>Lista de usuarios</h3>                                                
                    <table class="table table-striped table-hover">                                                
                        <thead class="thead-dark"> 

                            <tr> 
                                <th>Tipo de documento</th> 
                                <th>N° de documento</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Teléfono</th>
                                <th>Correo</th>
                                <th>Tipo de vehículo</th>
                                <th>Placa</th>
                            </tr>                                
                        </thead>



                        <tr ng-repeat="contacto in cn.contactos"> 
                            <td>{{contacto.tipo_documento}}</td> 
                            <td>{{contacto.num_documento}}</td> 
                            <td>{{contacto.nombre}}</td>
                            <td>{{contacto.apellido}}</td>
                            <td>{{contacto.telefono}}</td>
                            <td>{{contacto.correo}}</td>
                            <td>{{contacto.tipo_vehiculo}}</td>
                            <td>{{contacto.placa}}</td>                                
                        </tr>                                                        
                    </table>                        
                </div>                    
            </div>
        </div> 
    </body>

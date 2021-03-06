<%-- 
    Document   : Habitaciones
    Created on : 16/08/2020, 19:10:27
    Author     : Jose
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession obse = request.getSession(false);
    String us = (String) obse.getAttribute("sesion");
    String nom=(String)obse.getAttribute("nom");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Habitaciones</title>
    </head>
    <body>
            <%if(us.equals("normal")||us.equals("")){%>

                <c:forEach items="${habit}" var="h">
                    <div class="d-flex" >
            <div class="card col-lg-4" style="padding:10px">
                
                    <div align="center">
                    <img src="ControladorIMG?id=${h.getId()}" width="250">
                    
                    
                </div> 
               
                                       
            </div>
                    <div class="card col-lg-6">
                        <div align="center">
                            
                        <h1>${h.getNombre()}</h1>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incidunt ut labore 
                                et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
                                nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse 
                                cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, 
                                sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                        <h3>$${h.getPrecio()}</h3>    
                        
                        </div> 
                    </div>
                        <div class="col-lg-2" style="margin:auto">
                            <%if(us.equals("normal") || us.equals("")){%>
                            <a href="Controlador?menu=Reserva&accion=Listar&tipo=${h.getNombre()}&id=${h.getId()}&precio=${h.getPrecio()}&nom=<%=nom%>" class="btn btn-primary btn-block">Reservar</a>
                            <%}%>
                        </div>
                    </div>
                     </c:forEach>
            
            
            
                <%}%>
        <%if (us.equals("admin")) {
        %>
        <div class="d-flex">
            <div class="card col-lg-3">
                    <div class="card-body">
                        <form action="Controlador?menu=Habitaciones" method="POST" enctype="multipart/form-data">
                            <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" value="${habitacion.getNombre()}" name="txtNombre" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Precios</label>
                                <input type="text" value="${habitacion.getPrecio()}" name="txtPrecio" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>Fotos</label>
                                <input type="file" value="${habitacion.getFoto()}" name="fileFoto">
                            </div>
                            <input type="submit" name="accion" value="Agregar" class="btn btn-warning">
                            <input type="submit" name="accion" value="Actualizar" class="btn btn-danger">
                        </form>

                    </div>
                </div>
                <div class="col-lg-9">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Precio</th>
                                <th>Foto</th>
                            </tr>
                        </thead>
                            
                        <tbody>
                            <c:forEach items="${habit}" var="h">
                               <tr>
                                    <td>${h.getId()}</td>
                                    <td>${h.getNombre()}</td>
                                    <td>${h.getPrecio()}</td>
                                    <td><img src="ControladorIMG?id=${h.getId()}" width="250"></td>
                                    <td>
                                        <a href="Controlador?menu=Habitaciones&accion=Editar&id=${h.getId()}" class="btn btn-primary">Editar</a>
                                        <b></b>
                                        <a href="Controlador?menu=Habitaciones&accion=Eliminar&id=${h.getId()}" class="btn btn-danger" id="confirmar">Eliminar</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            
                        </tbody>


                    </table>
                </div>
            
        </div>
        <%}
        %>
    </body>
    <script src="js/Confirmacion.js"></script>    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    
</html>

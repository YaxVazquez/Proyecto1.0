<%-- 
    Document   : PaginaPrincipal
    Created on : 21/11/2016, 12:13:49 PM
    Author     : Yax
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Inicio - Dogs & Co</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="img/holi.ico" />

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/iconos.css">
        <link rel="stylesheet" href="css/menu.css">
        <link rel="stylesheet" href="css/principal.css">

        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
         <%
          HttpSession sesion = request.getSession();
          if(sesion.getAttribute("user") == null){
              String e="Inicia sesion o registrate";
              response.sendRedirect("upsy.html?e="+e+"");
          }
                      String emails = (String)sesion.getAttribute("user");

                            Connection c = null;
                            Statement s = null;
                            ResultSet r = null;

                            try {
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                c = DriverManager.getConnection("jdbc:mysql://localhost/doggos","root","n0m3l0");
                                s = c.createStatement();
                            }
                            catch (SQLException error){
                                out.print(error.toString());
                            }

                            try {
                               r = s.executeQuery("select * from Usuario where Correo ='"+ emails +"';");
                               if (r.next()){
                                    String NameUs = r.getString("NombreUsuario");
                                 %>
         <nav class="navbar navbar-fixed-top colorito">
          <div class="container-fluid">
              
            <div class="navbar-header">
              <button class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="icon-bar hm-icon"></span>
                <span class="icon-bar hm-icon"></span>
                <span class="icon-bar hm-icon"></span>
              </button>
              <a href="PaginaPrincipal.jsp" class="navbar-brand hm-lk"><span class="icon icon-paw"> </span>Dogs & Co.</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right enlaces">
                <li><a href="perfil.jsp"> <% 
                    out.println(NameUs); 
                   %> </a></li>
                <li> 
                    <a href="buscarperros.jsp"><button class="btn culbtn2 buscarD"><img src="img/perrx.png" alt="#" >&nbsp;<span class='glyphicon glyphicon-search' ></span></button></a>        
                </li>
                <li> <form action="buscarcentro.jsp" method="post" class="navbar-form navbar-left"> 
                        <div class="input-group">
                            <input type="text" class="form-control campo" id="center" name="center" placeholder="Buscar centros" autocomplete="off" required>
                            <span class="input-group-btn culbtn">
                                <input type="submit" class="btn" value="Buscar" id="Buscar" name="Buscar">
                            </span>
                        </div>
                </form> </li>
              <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span>Configuracion</a>
                  <ul class="dropdown-menu enlaces2">
                      <li><a href="modificar.jsp">Modificar perfil</a></li>
                      <li><a href="contraseña.jsp">Cambiar contraseña</a></li>
                      <li class="divider"></li>
                      <li><a href="salir.jsp">Salir</a></li>
                  </ul>
              </li>
            </ul>
            </div>  
          </div>
        </nav>
     
        <%       
                               }
                            }
                            catch (SQLException error){
                                out.print(error.toString());
                            }
                    try {
                        String feik = "0";
                        r = s.executeQuery("select * from Usuario where Correo ='"+ emails +"';");
                               if (r.next()){
                                    String co = r.getString("Verificacion");
                                    if(feik.equals(co)){
                                        s = c.createStatement();
                                        out.println("<div class='container-fluid validacion'>" 
                                        +"<form action='PaginaPrincipal.jsp' method='post' class='form-horizontal'>" 
                                            +"<br> <br> <br>"
                                            +"<div class='form-group'>" 
                                                +"<div class='col-xs-6 col-sm-6 col-md-6 col-lg-6'>" 
                                                    +"<p> Ahora solo tienes que validar tu e-mail! </p> "
                                                +"</div>"
                                            +"<div class='col-xs-6 col-sm-6 col-md-6 col-lg-6' style='text-align: right;'>"  
                                                +"<input type='submit' name='reenviar' id='reenviar' class='btn culbtn ' value='Reenviar e-mail:)'>"
                                            +"</div>" 
                                        +"</div>"
                                    +"</form>"
                                +"</div>");
                                    }
                                }
                    }
                    catch (SQLException error){
                                out.print(error.toString());
                     }
            if( request.getParameter("reenviar") != null ) {
                cl.cMail1 env= new cl.cMail1();
                String receptor=emails;
                String titulo="Verifica tu correo ahora!";
                String enviar=":DDDDDDDDDDDDDDDDDDDDDDDDDD";

                try{
                    env.mandaMAil(receptor, titulo, enviar);
                }
                catch(Exception e){
                    e.getMessage();
                }
            }
                    %>
                    
    <br><br> <br><br><br>                   
                    <div>
                        <a href="#" data-toggle="modal" data-target="#filtross"><button>perro</button></a>
                    </div>
                
            <div class="modal fade centrado" id ="filtross">    
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <form action="index.jsp" class="form-horizontal" method="post">
                  <div class="modal-header colors">
                    <button class="close" aria-hidden="true" data-dismiss="modal">&times;</button>
                    <h3 class="modal-title"><span class="glyphicon glyphicon-filter"></span>Filtros de búsqueda</h3>
                  </div>
                  <div class="modal-body">
                      <div class="form-group">
                      </div>
                      <div class="form-group">
                      </div>
                      <div class="form-group">
                      </div>
                      <div class="form-group">
                      </div>
                      
                      
                  </div>
                 <div class="modal-footer">
                    <input type='submit' name='busk' id='busk' class='btn culbtn' value='Encuentra!'s>
                    <button class="btn noculbtn" data-dismiss="modal"> Cancelar </button>
                  </div>
                </form>
                </div>
              </div>
            </div>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>

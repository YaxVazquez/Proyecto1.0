<%-- 
    Document   : perfi
    Created on : 27/11/2016, 03:47:46 PM
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
        <title>Perfil - Dogs & Co</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="img/holi.ico" />

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/iconos.css">
        <link rel="stylesheet" href="css/menu.css">

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
                            PreparedStatement ps = null;

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
                                    String nome = r.getString("Nombre");
                                    String apell = r.getString("Apellido");
                                    String correo = r.getString("Correo");
                                    String tel= r.getString("Telefono");
                                    String Descripcion= r.getString("Descripcion");
                                 %>
         <nav class="navbar colorito">
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
                <div class="container">
                    <div class="col-xs-6 col-xs-offset-3 col-sm-4 col-sm-offset-4 col-md-2 col-md-offset-5 col-lg-2 col-lg-offset-5 perfils">
                        <img src="img/user.jpg" class="img-responsive img-circle img-thumbnail" alt="#I">
                        <a href="completar.jsp"> <span class="glyphicon glyphicon-pencil"> </span> </a>
                    </div>
                    <div class="centrado col-xs-12 col-sm-12 col-md-12 col-lg-12"> 
                        <%
                            out.println("<h3>"+nome+"&nbsp;"+apell+"</h3>");
                            out.println("@"+NameUs+"<br><br>");
                            out.println("Correo: " + correo + "<br> <br>");
                            out.println("Telefono: " + tel + "<br> <br>");
                            if(Descripcion == null ){
                                out.println("<div class='container adornos'> Descripcion: <br> ¿Aún no has completado tu perfil?:( "
                                        + "<a href='completar.jsp'> ¡Hazlo ahora! </a> "
                                            + "<img src=img/perries.png class='col-xs-5 col-xs-offset-7 col-sm-3 col-sm-offset-9 col-md-3 col-md-offset-9  col-lg-2 col-lg-offset-10 img-responsive' alt='doggofeliz'> "
                                    + "</div> <br>");
                            } else {
                            out.println( "<div class='container adornos'>"+ Descripcion+ "<img src=img/perries.png class='col-xs-5 col-xs-offset-7 col-sm-3 col-sm-offset-9 col-md-3 col-md-offset-9  col-lg-2 col-lg-offset-10 img-responsive' alt='doggofeliz'> </div>");
                            }
                        %>
                    </div>
                </div>
        <%       
                               }
                            }
                            catch (SQLException error){
                                out.print(error.toString());
                            }         
                    %>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>

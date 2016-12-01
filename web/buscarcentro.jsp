<%-- 
    Document   : buscarcentro
    Created on : 27/11/2016, 09:10:51 PM
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
        <title>Búsquedas - Dogs & Co</title>
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
                                    String centro = request.getParameter("center");
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
                            <input type="text" class="form-control campo" id="center" name="center" value="<%out.println(centro);%>" placeholder="Buscar centros" autocomplete="off" required>
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
        <%              if(request.getParameter("Buscar") != null){
                               try {
                                    r = s.executeQuery("select * from centro join direccioncentro where centro.IdDireccion = direccioncentro.IdDireccion and NombreCentro ='"+ centro +"';");
                                    if (r.next()){
                                        String NameCe = r.getString("NombreCentro");
                                        String UserC = r.getString("Usuario");
                                        String descripcion = r.getString("Descripcion");
                                        String tel = r.getString("Telefono");
                                        String correo = r.getString("Correo");
                                        
                                        String calle = r.getString("Calle");
                                        String numi = r.getString("NumInt");
                                        String nume = r.getString("NumExt");
                                        String cp = r.getString("Cp");
                                        String colo = r.getString("Colonia");
                                        String dele = r.getString("Delegacion");
                                        String estado = r.getString("Estado");
                                        
                                        out.println("<div class='container centrox'> <h2>" + NameCe+ "</h2>"
                                                + "@"+UserC+ "<br><br>"
                                                        + "<span class='glyphicon glyphicon-earphone'> </span>Telefono: " +tel+ "<br>"
                                                + "<span class='glyphicon glyphicon-envelope'> </span>Correo: " +correo + "<br>"
                                                + "Descripcion:" + descripcion+ "</br>"
                                                + "<span class='glyphicon glyphicon-home'></span> Calle " + calle+ " "+numi +", Colonia "+colo+", "+dele+", "+cp+", "+estado
                                            +"<br> <a href='#'><button class='btn culbtn2'><span class='icon icon-paw'></span> Ver </button></a>"
                                                + "<img src=img/perries2.png class='col-xs-5 col-xs-offset-7 col-sm-3 col-sm-offset-9 col-md-3 col-md-offset-9  col-lg-2 col-lg-offset-10 img-responsive' alt='doggofeliz'> "
                                    + "</div> <br>");
                                    } else{
                                        out.println("<div class='container centrox'> <br> Este centro no esta registrado:( "
                                            + "<img src=img/perries2.png class='col-xs-5 col-xs-offset-7 col-sm-3 col-sm-offset-9 col-md-3 col-md-offset-9  col-lg-2 col-lg-offset-10 img-responsive' alt='doggofeliz'> "
                                    + "</div> <br>");
                                    }
                               }
                               catch (SQLException error){
                                    out.print(error.toString());
                               }
                        } 
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
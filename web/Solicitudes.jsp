<%-- 
    Document   : Solicitudes
    Created on : 17-may-2017, 4:14:15
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" />
        <title>Solicitudes de adopcion</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/estilos1.css">
        <link href="css/cese.css" rel="stylesheet">

        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
        
            </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
           <nav class="navbar navbar-default ">
          <div class="container-fluid" >
            <div class="navbar-header" >
              <button class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
                <a class="navbar-brand ">Solicitudes de adopción</a>
            </div>
            
            <div class="collapse navbar-collapse colo" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right ">
               <li><a href="PerfilCentro.jsp">Perfil Centro</a></li>
              <li><a href="DogsCentro.jsp">Perros</a></li>
              <li><a href="SalirP.jsp">Cerrar Sesión</a></li>
            </ul>
              
            </div>
            </div>
</nav>
            <% 
             HttpSession sesion = request.getSession();
          if(sesion.getAttribute("userCentro") == null){
              String e="Inicia sesion o registrate";
              response.sendRedirect("indexP.jsp?e="+e+"");
          }
          else{
           Connection con=null;
                Statement s = null;
                PreparedStatement pstatement=null;
                ResultSet r = null;
                ResultSet x = null;
                 String usuario = (String)sesion.getAttribute("userCentro");
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost/doggos","root","n0m3l0");
                    s = con.createStatement();
                }
                catch (SQLException error){
                    out.print(error.toString());
                }
        
            }
            %>
              
            <% 
                Connection c = null;
                ResultSet r = null;
                Statement s = null;
                 try {
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                c = DriverManager.getConnection("jdbc:mysql://localhost/doggos","root","n0m3l0");
                                s = c.createStatement();
                            }
                            catch (SQLException error){
                                out.print(error.toString());
                            }
             r = s.executeQuery("select count(*) from solicitudadopcion where idCentro="+sesion.getAttribute("idCen")+";");
              r.next();
              String nSol=r.getString("count(*)");
              out.println("<h1>Tiene "+nSol+" solicitud(es) de adopción</h2>");
             %>
    
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>

        <script src="js/main.js"></script>
    </body>
</html>

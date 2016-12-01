<%-- 
    Document   : index
    Created on : 21/11/2016, 10:29:34 AM
      Author     : ALDO ERNESTO
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
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/main.css">

        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
        <script type="text/javascript">
        <!--
        function contra(e){
            var x = e.which || e.keyCode;
            if((x>=97 && x<=122) || (x>=65 && x<=90) || (x===8|| x ===224 || x ===232|| x===236|| x===242||x===249||x===241) || (x>=48&&x<=57)||(x===8))
                return true;
            else
                return false;
        }
            function validar(contra, repeticion){
                var contraa = contra.value;
                var repetirr = repeticion.value;
                    if(contraa!==repetirr){
                        document.getElementById("con").style.visibility="visible";
                        contra.focus();
                        return false;
                }
                else
                    document.getElementById("con").style.visibility='hidden';
            }
        -->
        </script>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <nav class="navbar navbar-fixed-top color">
          <div class="container-fluid">
            <div class="navbar-header">
              <button class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="icon-bar hm-icon"></span>
                <span class="icon-bar hm-icon"></span>
                <span class="icon-bar hm-icon"></span>
              </button>
              <a href="#" class="navbar-brand hm-link">Dogs & Co.</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right enlaces">
              <li><a href="#Nosotros">¿Quienes somos?</a></li>
              <li><a href="#Centros">Centros</a></li>
              <li><a href="#" data-toggle="modal" data-target="#registro">Registrate</a></li>
              <li><a href="#" data-toggle="modal" data-target="#sesions">Inicia Sesión</a></li>
              <li><a href="#Contacto">Contactanos</a></li>
            </ul>
              
            <div class="modal fade" id ="registro">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <form action="index.jsp" class="form-horizontal" method="post">
                  <div class="modal-header">
                    <button class="close" aria-hidden="true" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Registrate</h4>
                  </div>
                  <div class="modal-body">
                      <div class="form-group">
                        <label for="Nombre" class="col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-1 col-lg-offset-1 control-label"> Nombre </label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                          <input type="text" class="form-control" name="nome" id="nome" placeholder="Nombre(s)">
                        </div>
                        <label for="Apellido" class="col-xs-12 col-sm-12 col-md-1 col-lg-1 control-label">Apellido</label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                          <input type="text" class="form-control" name="apell" id="apell" placeholder="Apellido(s)">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="Repetir" class="col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-1 col-lg-offset-1 control-label">Usuario</label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                          <input type="text" class="form-control" name="user" id="user" placeholder="Nombre de Usuario">
                        </div>
                        <label for="e-mail" class="col-xs-12 col-sm-12 col-md-1 col-lg-1 control-label">E-mail</label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                          <input type="text" class="form-control" name="email" id="email" placeholder="E-mail">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="Contraseña" class="col-xs-12 col-sm-12 col-md-2 col-lg-2 control-label">Contraseña</label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                          <input type="text" class="form-control" name="contrax" id="contrax" placeholder="Contraseña">
                        </div>
                        <label for="Repetir" class="col-xs-12 col-sm-12 col-md-1 col-lg-1 control-label">Confirmar</label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                          <input type="text" class="form-control" name="conf" id="conf" placeholder="Confirmar Contraseña">
                        </div>
                      </div>
                        <div id="con" class="form-group error"> 
                            <p>Las contraseñas no coinciden</p>
                        </div>
                    </div>
                    <p> ¿Ya tienes una cuenta? <a href="#" data-toggle="modal" data-target="#sesion" data-dismiss="modal">Entra</a></p>
                 <div class="modal-footer">
                    <input type='submit' name='RegistroS' id='RegistroS' class='btn' value='Registrarse' onClick='return validar(contrax, conf);'>
                    <button class="btn btn-default" data-dismiss="modal"> Cancelar </button>
                  </div>
                </form>
                </div>
              </div>
            </div>

            <div class="modal fade" id ="sesions">
              <div class="modal-dialog">
                <div class="modal-content">
                  <form action="index.jsp" class="form-horizontal" method="post">
                  <div class="modal-header">
                    <button class="close" aria-hidden="true" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Inicia Sesión</h4>
                  </div>
                  <div class="modal-body">
                      <div class="form-group">
                        <label for="Usuario" class="col-xs-12 col-sm-12 col-md-3 col-md-offset-1 col-lg-3 col-lg-offset-1 control-label">Usuario</label>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                          <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuario">
                        </div>       
                      </div>
                      <div class="form-group">
                        <label for="Contraseña" class="col-xs-12 col-sm-12 col-md-3 col-md-offset-1 col-lg-3 col-lg-offset-1 control-label">Contraseña </label>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                          <input type="text" class="form-control" id="contra" name ="contra" placeholder="Contraseña">
                        </div>
                      </div>
                    <p> ¿Aún no tienes una cuenta? <a href="#" data-toggle="modal" data-target="#registro" data-dismiss="modal">Registrate</a></p>
                  </div>
                  <div class="modal-footer">
                    <input type="submit" class="btn" value="Login" id="LogIn" name="LogIn">
                    <button class="btn btn-default" data-dismiss="modal"> Cancelar </button>
                  </div>
                 </form>
                </div>
              </div>
            </div>
                
            </div>
          </div>
        </nav>

        <div class="carousel slide" id="miSlider" data-ride="carousel">

          <ol class="carousel-indicators">
            <li data-target="#miSlider" data-slide-to="0" class="active"></li>
            <li data-target="#miSlider" data-slide-to="1"></li>
            <li data-target="#miSlider" data-slide-to="2"></li>
          </ol> 

          <div class="carousel-inner">
            <div class="item active">
              <img src="img/img1.jpg" alt="Doggo">    
            </div>

            <div class="item">
              <img src="img/img1.jpg" alt="Doggo">    
            </div>

            <div class="item">
              <img src="img/img1.jpg" alt="Doggo">    
            </div>
          </div>

          <a href="#miSlider" class="carousel-control left" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
          </a>

          <a href="#miSlider" class="carousel-control right" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
          </a>
        </div>
        
        <div class="container" id="Nosotros">
          <h1>¿Quienes somos?</h1>
          <p>Dogs&Co es un proyecto dedicado a ayudar a las personas que ayudan. 
            La adopción de animales siempre ha presentado diversas problemáticas, desde el hecho de que las personas optan por comprar en lugar de adoptar, hasta la dificultad al realizar el proceso de adopción.
             Los perros callejeros representan un sector débil en nuestra sociedad, y las personas que ayudan  a este sector se ven en situaciones complicadas porque cada día hay más y más perros sin hogar, y cada día se pierde más la cultura de la adopción lo que afecta a estas ya sea por cuestiones económicas o  de espacio.

            Se busca motivar la adopción, poniendo al alcance de las personas la información necesaria para facilitar ese proceso.
            Con nuestro software las personas podrán encontrar centros de adopción a su alcance con mayor rapidez, podrán saber más sobre los requisitos para adoptar y buscar su mascota ideal, para así aligerar el proceso.  
          </p>
        </div>  

        <div class="container" id="Centros">
          <h1>Centros</h1>
          <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
              <img src="img/centro1.jpg" class="img-responsive img-" alt="#">
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
              <img src="img/centro2.jpg" class="img-responsive " alt="#">
            </div>

            <div class="clearfix visible-lg visible-md"></div>

            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
              <img src="img/Centro3.jpg" class="img-responsive " alt="#">
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
              <img src="img/centro4.jpg" class="img-responsive " alt="#">
            </div>
          </div>
        </div> 

        <div class="container" id="Contacto">
          <h1>Contacto</h1>
          <form action="#" class="form-horizontal">
            <div class="form-group">
              <label for="Nombre" class="col-xs-12 col-sm-12 col-md-1 col-lg-1">Nombre</label>
              <div class="col-xs-12 col-sm-12 col-md-4 col-md-offset-1 col-lg-4 col-lg-offset-1">
                <input type="text" class="form-control" placeholder="Nombre(s)">
              </div>
              <label for="Apellido" class="col-xs-12 col-sm-12 col-md-1 col-lg-1">Apellido</label>
              <div class="col-xs-12 col-sm-12 col-md-4 col-md-offset-1 col-lg-4 col-lg-offset-1">
                <input type="text" class="form-control" placeholder="Apellido(s)">
              </div>
            </div>
            <div class="form-group">
              <label for="Telefono" class="col-xs-12 col-sm-12 col-md-1 col-lg-1">Telefono</label>
              <div class="col-xs-12 col-sm-12 col-md-4 col-md-offset-1 col-lg-4 col-lg-offset-1">
                <input type="text" class="form-control" placeholder="Telefono">
              </div>
              <label for="Correo" class="col-xs-12 col-sm-12 col-md-1 col-lg-1">Correo</label>
              <div class="col-xs-12 col-sm-12 col-md-4 col-md-offset-1 col-lg-4 col-lg-offset-1">
                <input type="text" class="form-control" placeholder="Correo">
              </div>
            </div>
            <div class="form-group">
              <label for="Ciudad" class="col-xs-12 col-sm-12 col-md-1 col-lg-1">Direccion</label>
              <div class="col-xs-12 col-sm-12 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1">
                <input type="text" class="form-control" placeholder="Ciudad">
              </div>
            </div>
            <div class="form-group">
              <label for="Asunto" class="col-xs-12 col-sm-12 col-md-1 col-lg-1">Asunto</label>
              <div class="col-xs-12 col-sm-12 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1">
                <input type="text" class="form-control" placeholder="Asunto">
              </div>
            </div>
            <div class="form-group">
              <label for="Comentario" class="col-xs-12 col-sm-12 col-md-2 col-lg-2">Comentario</label>
              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <textarea class="form-control" rows="10" placeholder="Dudas, comentarios o sugerencias."></textarea>
              </div>
            </div>
          </form>
        </div> 
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
         <%     
                Connection con=null;
                Statement s = null;
                PreparedStatement pstatement=null;
                ResultSet r = null;
                ResultSet x = null;
                
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost/doggos","root","n0m3l0");
                    s = con.createStatement();
                }
                catch (SQLException error){
                    out.print(error.toString());
                }
        if(request.getParameter("RegistroS") != null)
            {
                String nome=request.getParameter("nome");
                String apell=request.getParameter("apell");
                String user=request.getParameter("user");
                String email=request.getParameter("email");
                String contra=request.getParameter("contrax");
                try
                {
                    r = s.executeQuery("select * from Usuario where Correo ='"+email+"';");
                    if (!r.next()){
                        String queryString="call addUser('"+0+"','"+user+"','"+nome+"'  '"+apell +"','"+contra+"', '"+email+"');";
                         pstatement=con.prepareStatement(queryString);
                         pstatement.executeUpdate();

                             out.println("<script>alert('Registro exitoso')</script>");
                             out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/index.jsp'/>");
                       
                    }
                    else {
                        out.println("<script>abrir();</script>");
                        out.println("<script>alert('Correo ya registrado, por favor utilice otro')</script>");
                    }
                }
                catch(Exception e)
                        {
                            out.println(e.getLocalizedMessage());
                            e.printStackTrace();
                        }
            } else 
            if( request.getParameter("LogIn") != null ) {
                try {
                   String user = request.getParameter("usuario");
                   String conE = request.getParameter("contra");
                   r = s.executeQuery("select * from Usuario where Correo ='"+user+"';");
                   if (r.next()){
                       String co = r.getString("Contraseña");
                       if(conE.equals(co)){
                            HttpSession sesion = request.getSession();
                            sesion.setAttribute("user", request.getParameter("usuario")); 
                              s = con.createStatement();
                            out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/PaginaPrincipal.jsp'/>");
                       }
                       else {
                           out.println("<script> alert ('Contraseña erronea')</script>");
                           out.println("<script> sesione(); </script>");
                       }
                   }
                   else {
                       out.println("<script> alert ('Correo no registrado')</script>");
                       out.println("<script> sesione(); </script>");
                   }
                }
                catch (SQLException error){
                    out.print(error.toString());
                }
            }
        %>
    </body>
</html>

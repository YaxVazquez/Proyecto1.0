<%-- 
    Document   : modificar
    Created on : 27/11/2016, 01:40:33 AM
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
        <title>Modificar - Dogs & Co</title>
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
                                    String Email = r.getString("Correo");
                                    String Nombre = r.getString("Nombre");
                                    String Apellido = r.getString("Apellido");
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
                <li><a href="perfil.jsp"> <span class='glyphicon glyphicon-user'></span> <% 
                    out.println(NameUs); 
                   %> </a></li>
                <li> 
                    <a href="" data-toggle="modal" data-target="#filtross"><span class='glyphicon glyphicon-search' ></span> Busca tu perro ideal &nbsp;</a>        
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
         
        <div class="container centrado">
            <form action="modificar.jsp" class="form-horizontal" method="post">
                  <div>
                      <h3>Modificar datos del perfil</h3>
                  </div>
                  <div class="datox">
                    <div id='userC' class='snc'> <p>No se ha realizado ningún cambio*</p> </div>
                    <div id='user1' class='snc'> <p>Correo ya registrado*</p> </div>
                      <div class="form-group">
                        <label for="Nombre" class="col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-1 col-lg-offset-1 control-label"> Nombre </label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                            <input type="text" class="form-control" name="nome" id="nome" placeholder="Nombre(s)" value="<%out.println(Nombre);%>" autocomplete='off' title='No utilizes simbolos, numeros ni espacios. No más de 20 carateres' pattern="[A-Za-z]{1,20}" required autofocus>
                        </div>
                        <label for="Apellido" class="col-xs-12 col-sm-12 col-md-1 col-lg-1 control-label">Apellido</label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                          <input type="text" class="form-control" name="apell" id="apell" placeholder="Apellido(s)" value="<%out.println(Apellido);%>" autocomplete='off' title='No utilizes simbolos, numeros ni espacios. No más de 20 carateres' pattern="[A-Za-z]{1,20}" required>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="Usuario" class="col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-1 col-lg-offset-1 control-label">Usuario</label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                          <input type="text" class="form-control" name="user" id="user" placeholder="Nombre de Usuario" value="<%out.println(NameUs);%>" autocomplete='off' title='Utiliza - _, letras, numeros y no utilices espacios. No más de 30 carateres' pattern="[a-zA-Z0-9-_]{1,30}" required>
                        </div>
                        <label for="telefono" class="col-xs-12 col-sm-12 col-md-1 col-lg-1 control-label"> Email </label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                          <input type="email" class="form-control" name="email" id="email" placeholder="E-mail" value="<%out.println(Email);%>" pattern="{1,30}" autocomplete='off' required>
                        </div>
                      </div>
                    </div>
                 <div>
                    <input type='submit' name='cambios' id='cambios' class='btn culbtn2' value='Cambiar!'>
                  </div>
                </form>
                        <br>
                <a href="PaginaPrincipal.jsp"><button class="btn noculbtn"><span class='glyphicon glyphicon-trash'></span>Cancelar </button></a>
            </div>
        <%       
                               }

        if(request.getParameter("cambios") != null){
                 String NameUs = r.getString("NombreUsuario");
                 String Email = r.getString("Correo");
                 String Nombre = r.getString("Nombre");
                 String Apellido = r.getString("Apellido");

                 String nombre2 = request.getParameter("nome");
                 String apellido2 = request.getParameter("apell");
                 String userr2 = request.getParameter("user");
                 String email2 = request.getParameter("email");
                      String emailss = (String)sesion.getAttribute("user");

                 
                if(Nombre.equals(nombre2) && Apellido.equals(apellido2) && NameUs.equals(userr2)&& email2.equals(emailss)){
                        out.println("<script>document.getElementById('userC').style.visibility='visible';</script>");
                        }
                else {
                    if (email2.equals(Email)){
                            try
                       {
                                s = c.createStatement();
                               String queryString="update Usuario set NombreUsuario ='"+userr2+"', Nombre='"+nombre2+"', Apellido='"+apellido2+"' where Correo= '"+emails+"' ;";
                                ps=c.prepareStatement(queryString);
                                ps.executeUpdate();
                                out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/PaginaPrincipal.jsp'/>");
                       }
                        catch(SQLException error)
                       {
                           out.println(error.toString());  
                       }
                }
                else {
                        try
                                {
                                    String id = r.getString("IdUSuario");
                                    s = c.createStatement();
                                    r = s.executeQuery("select * from Usuario where Correo ='"+email2+"';");
                                    if (!r.next()){
                                        String queryString="update Usuario set NombreUsuario ='"+userr2+"', Nombre='"+nombre2+"', Apellido='"+apellido2+"', Correo= '"+email2+"', Verificacion = '"+0+"' where IdUsuario = '"+ id +"' ;";
                                         ps=c.prepareStatement(queryString);
                                         ps.executeUpdate();
                                             sesion.setAttribute("user", request.getParameter("email"));
                                             out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/PaginaPrincipal.jsp'/>");
                                                cl.cMail1 env= new cl.cMail1();
                                                String receptor=request.getParameter("email");
                                                String titulo="Verifica tu correo ahora!";
                                                String enviar=":DDDDDDDDDDDDDDDDDDDDDDDDDD";

                                                try{
                                                    env.mandaMAil(receptor, titulo, enviar);
                                                }
                                                catch(Exception e){
                                                    e.getMessage();
                                                }   
                                    }
                                    else {
                                        out.println("<script>document.getElementById('user1').style.visibility='visible';</script>");
                                    }
                                }
                                 catch(SQLException error)
                                {
                                    out.println(error.toString());  
                                }
                   }
                }
          }
                                    }
        catch (SQLException error){
            out.print(error.toString());
        }
                    %>
                    
                    <div class="modal fade centrado" id ="filtross">    
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <form action="ListaPerros.jsp" class="form-horizontal" method="post">
                  <div class="modal-header colors">
                    <button class="close" aria-hidden="true" data-dismiss="modal">&times;</button>
                    <h3 class="modal-title"><span class="glyphicon glyphicon-filter"></span>Filtros de búsqueda</h3>
                  </div>
                  <div class="modal-body">
                      <div class="form-group">
                        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 col-lg-offset-1">
                            <span class="glyphicon glyphicon-leaf"></span> Hembra
                            <input type ="radio" name="sex" value="Hembra" checked>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4"> 
                            <span class="glyphicon glyphicon-fire"></span> Macho
                            <input type ="radio" name="sex" value="Macho"> 
                        </div>
                     </div>
                      <div class="form-group">
                        <label for="Edad" class="col-xs-8 col-xs-offset-2 col-sm-8 col-sm-offset-2 col-md-1 col-lg-1 col-lg-offset-2">Edad</label>
                        <select name="edad" class="col-xs-8 col-xs-offset-2 col-sm-8  col-sm-offset-2 col-md-4 col-lg-4">
                            <option value="Cachorro">Cachorro</option>
                            <option value="Adulto">Adulto</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label for="Tamaño" class="col-xs-8 col-xs-offset-2 col-sm-8 col-sm-offset-2 col-md-1 col-lg-1 col-lg-offset-2">Tamaño</label>
                        <select name="tamano" class="col-xs-8 col-xs-offset-2 col-sm-8 col-sm-offset-2 col-md-4 col-lg-4">
                            <option value="Chico">Raza chica</option>
                            <option value="Mediano">Raza mediana</option>
                            <option value="Grande">Raza grande</option>
                        </select>
                      </div>
                      <div class="form-group">
                         <label for="colors" class="col-xs-8 col-xs-offset-2 col-sm-8  col-sm-offset-2 col-md-1 col-lg-1 col-lg-offset-2">Color</label> 
                            <div> 
                                 <label for="colorb" class="col-xs-6 col-xs-offset-1 col-sm-6 col-sm-offset-1 col-md-1 col-lg-1 col-lg-offset-1">Blanco</label>
                                <input type ="checkbox" name="color" value="Blanco" class="col-xs-3 col-sm-3 col-md-1 col-lg-1 col-lg-offset-1"> 
                            </div> 
                            <div>
                                 <label for="colorn" class="col-xs-6 col-xs-offset-1 col-sm-6 col-sm-offset-1 col-md-1 col-lg-1 col-lg-offset-1">Negro</label>
                                <input type ="checkbox" name="color" value="Negro" class="col-xs-3 col-sm-3 col-md-1 col-lg-1 col-lg-offset-1">
                            </div> 
                      </div>
                       <div class="form-group">  
                           <label for="colors" class="col-xs-0 col-sm-1 col-sm-offset-2 col-md-1 col-lg-1 col-lg-offset-2"> &nbsp; </label> 
                            <div>
                                 <label for="colorc" class="col-xs-6 col-xs-offset-1 col-sm-6 col-sm-offset-1 col-md-1 col-lg-1 col-lg-offset-1">Café</label>
                                <input type ="checkbox" name="color" value="Café" class="col-xs-3 col-sm-3 col-md-1 col-lg-1 col-lg-offset-1">
                            </div> 
                            <div>
                                 <label for="colorm" class="col-xs-6 col-xs-offset-1 col-sm-6 col-sm-offset-1 col-md-1 col-lg-1 col-lg-offset-1">Mixto</label>
                                <input type ="checkbox" name="color" value="Otro" class="col-xs-3 col-sm-3 col-md-1 col-lg-1 col-lg-offset-1">
                            </div> 
                       </div>   
                      <p> O si lo prefieres también encuentra <a href="CentroPerros.jsp"> perros por centros </a> </p> 
                  </div>
                 <div class="modal-footer">
                    <input type='submit' name='busk' id='busk' class='btn culbtn2' value='Encuentra!'s>
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
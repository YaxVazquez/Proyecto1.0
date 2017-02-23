<%-- 
    Document   : completar
    Created on : 27/11/2016, 12:05:19 PM
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
        <title>Completar perfil - Dogs & Co</title>
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
            <form action="completar.jsp" class="form-horizontal" method="post">
                  <div>
                      <h3>Modificar datos del perfil</h3>
                  </div>
                  <div class="datox">
                    <div class="form-group">
                        <label for="Foto" class="col-xs-12 col-sm-12 col-md-2 col-md-offset-1 col-lg-2 col-lg-offset-1"> Agrega una fotografía:  </label>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-md-offset-2 col-lg-9 col-lg-offset-2">
                            <input name="imagen" id="feil" name="feil" type="file">                        
                        </div>
                     </div>
                      <div class="form-group">
                        <label for="Descripcion" class="col-xs-12 col-sm-12 col-md-2 col-md-offset-1 col-lg-2 col-lg-offset-1">Descripcion</label>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-md-offset-2 col-lg-9 col-lg-offset-2">
                            <textarea class="form-control area" rows="5" id='coment' name='coment' placeholder="Agrega una breve descripcion para tu perfil" autocomplete='off'></textarea>
                        </div>
                      </div>
                     <div class="form-group">
                        <label for="telefono" class="col-xs-12 col-sm-12 col-md-1 col-lg-1 col-lg-offset-1 control-label"> Telefono </label>
                        <div class="col-xs-12 col-sm-12 col-md-7 col-lg-7">
                          <input type="text" class="form-control" name="telef" id="telef" placeholder="Telefono" title="No más de 15 caracteres. Solo numeros" patern="[0-9]{1,15}" autocomplete='off' required>
                        </div>
                      </div>
                    <div class="form-group">
                        <label for="Calle" class="col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-1 col-lg-offset-1 control-label">Calle</label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                          <input type="text" class="form-control" name="calle" id="calle" placeholder="Calle" autocomplete='off' pattern="[a-zA-Z ]{1,30}">
                        </div>
                        <label for="Colonia" class="col-xs-12 col-sm-12 col-md-1 col-lg-1 control-label"> Colonia </label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                          <input type="text" class="form-control" name="colo" id="colo" placeholder="Colonia" title="No más de 30 caracteres." patern="[a-zA-Z]{1,30}" autocomplete='off'>
                        </div>
                    </div>
                      <div class="form-group">
                        <label for="Usuario" class="col-xs-12 col-sm-12 col-md-1 col-md-offset-2 col-lg-1 col-lg-offset-2 control-label">NumInt.</label>
                        <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                          <input type="text" class="form-control" name="int" id="int" placeholder="Numero Interior" autocomplete='off' title='Utiliza numeros.No más de 4 carateres' pattern="[0-9]{1,4}">
                        </div>
                        <label for="telefono" class="col-xs-12 col-sm-12 col-md-1 col-lg-1 control-label"> NumExt.</label>
                        <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                          <input type="text" class="form-control" name="ext" id="ext" placeholder="Numero exterior" title="No más de 4 caracteres. Solo numeros" patern="[0-9]{1,4}" autocomplete='off'>
                        </div>
                        <label for="telefono" class="col-xs-12 col-sm-12 col-md-1 col-lg-1 control-label"> C.P. </label>
                        <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                          <input type="text" class="form-control" name="cp" id="cp" placeholder="Codigo Postal" title="No más de 5 caracteres. Solo numeros" patern="[0-9]{1,5}" autocomplete='off'>
                        </div>
                      </div>
                    <div class="form-group">
                        <label for="Delegación" class="col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-1 col-lg-offset-1 control-label">Delegación</label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                          <input type="text" class="form-control" name="dele" id="dele" placeholder="Delegacion" autocomplete='off' pattern="[a-zA-Z ]{1,30}">
                        </div>
                        <label for="Colonia" class="col-xs-12 col-sm-12 col-md-1 col-lg-1 control-label"> Estado </label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                          <input type="text" class="form-control" name="estado" id="estado" placeholder="Estado" title="No más de 30 caracteres." patern="[a-zA-Z ]{1,30}" autocomplete='off'>
                        </div>
                    </div>
                    </div>
                 <div>
                    <input type='submit' name='comple' id='comple' class='btn culbtn2' value='Cambiar!'>
                  </div>
                </form>
            <br>
            <a href="PaginaPrincipal.jsp"><button class="btn noculbtn"> <span class='glyphicon glyphicon-trash'></span>Cancelar </button></a>
            </div>
        <%       
                               }
                            }
                            catch (SQLException error){
                                out.print(error.toString());
                            }
        if(request.getParameter("comple") != null){
                String id = r.getString("IdUsuario");

                String tel = request.getParameter("telef");
                String descrip = request.getParameter("coment");
                
                String calle = request.getParameter("calle");
                String numi = request.getParameter("int");
                String nume = request.getParameter("ext");
                String cop = request.getParameter("cp");
                String colo = request.getParameter("colo");
                String dele = request.getParameter("dele");
                String city = request.getParameter("estado");
                 
                try
                       {
                               String queryString="call addDireccion('"+id+"','"+0+"', '"+calle+"', '"+numi+"', '"+nume+"', '"+cop+"', '"+colo+"', '"+dele+"', '"+city+"', '"+tel+"','"+descrip+"');";
                                ps=c.prepareStatement(queryString);
                                ps.executeUpdate();
                                out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/perfil.jsp'/>");
                       }
                catch(SQLException error)
                       {
                           out.println(error.toString());  
                       }
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
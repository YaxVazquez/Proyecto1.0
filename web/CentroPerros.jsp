<%-- 
    Document   : CentroPerros
    Created on : 22/02/2017, 11:06:13 PM
    Author     : ALDO ERNESTO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.LinkedList"%>
<%@page import="BD.Centro"%>
<%@page import="java.sql.*, java.io.*"%>
<%@page import="classes.ProductosIMG"%>
<%@page import="classes.Productos"%>
<%@page import="classes.ProductosDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
        ProductosDAO p = new ProductosDAO();
        ProductosIMG m = new ProductosIMG();
        HttpSession sesion = request.getSession();
       String idCentr="";
        
    
            %>
<!DOCTYPE html>
<html class="no-js" lang="">
    <head>
         <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Perros disponibles</title>
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
                                 <nav class="navbar navbar-fixed-top color">
          <div class="container-fluid">
              
            <div class="navbar-header" style="color: black;">
              <button class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="icon-bar hm-icon"></span>
                <span class="icon-bar hm-icon"></span>
                <span class="icon-bar hm-icon"></span>
              </button>
              <a href="PaginaPrincipal.jsp" class="navbar-brand hm-lk"><span class="icon icon-paw"> </span>Dogs & Co.</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right enlaces">
                <li><a href="perfil.jsp"><span class="glyphicon glyphicon-user"></span> <% 
                    out.println(NameUs); 
                   %> </a></li>
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
                      <div class="container-fluid ppIMG" id="juas">
                          <div style="text-align: center; margin-top: 150px;">
                              <h1 style=" color:white;text-shadow: 1px 1px 0 #000000, -1px -1px #000000, 1px -1px #000000, -1px 1px #000000, 0 1px #000000, 1px 0 #000000, -1px 0 #000000, 0 -1px #000000;">Selecciona el centro</h1>
                              <form action="CentroPerros.jsp" method="post">
                              <select name="centros">
                              
                              <% 
                              try {
                  
                   r = s.executeQuery("select count(idCentro)  from Centro;");
                   r.next();
                   int cuantos=r.getInt("count(idCentro)");
                   
                          for(int i=0;i<cuantos;i++){
                              r = s.executeQuery("select * from Centro where idCentro='"+(i+1)+"';");
                              r.next();
                              String nombre=r.getString("NombreCentro");
                          out.println("<option>"+nombre+"</option>");
                          }
                             
                   
                }
                catch (SQLException error){
                    out.print(error.toString());
                }
                              String Centr="";
                         
                              if(request.getParameter("ok") !=null ){
                                  
                                  Centr=request.getParameter("centros");
                              r = s.executeQuery("select * from Centro where NombreCentro='"+Centr+"';");
                              r.next();
                              idCentr=r.getString("idCentro");
                              p.setId(idCentr);
                                  
                              }
                              ArrayList<Productos> k = (ArrayList)p.BuscarTodos(); 
    ArrayList<Productos> lis = (ArrayList)m.BuscarTodas();
    ArrayList<String> nperros = new ArrayList<String>();
                              %>
                              
                          </select>
                              <input type="submit" name="ok" value="Ver perros">
                              </form>
                          </div>
                      </div>
                                                                
                              <div class="container" style="margin-top: 20px;">
      <% out.println("<h1 style='text-align:center;'>Nombre del centro: "+Centr+"</h1>");%>
    <%for (int i = 0; i < k.size(); i++) {%>
     
        <div class="col-xs-12 col-sm-6 col-md-6">
               <div class="well well-sm">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <img src="img/<%=lis.get(i).getRuta()%>" alt="" class="img-rounded img-responsive" />
                    </div>
                    <div class="col-sm-6 col-md-8">
                        <h4> <%= k.get(i).getNombre()%></h4>
                        <% nperros.add(i,k.get(i).getNombre() );%>
                        <% String nombre=nperros.get(i); %>
                        
                                                <p>
                            Color: <%=k.get(i).getCantidad()%>
                            <br />
                           Peso: <%=k.get(i).getPrecio()%> kg
                            <br />
                            Tamaño: <%=k.get(i).getRutaImagen()%>
                            <br />
                            Rango de edad: <%=k.get(i).getEdad()%>
                            <br />
                            Sexo: <%=k.get(i).getSex()%>
                                                </p>
                        <!-- Split button -->
                        <div class="btn-group">
                            
                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                Descrpción<span class="caret"></span><span class="sr-only">Descripción</span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li><%=k.get(i).getDescripcion()%></li>
                            </ul>
                    </div>
                            <div class="btn-group"> 
                            <form action='formato.jsp' method='post'>
                                 <% out.println("<input type='hidden' value='"+k.get(i).getNombre()+"' name='perrito'>"); %>
                                    <% out.println("<input type='submit' class='btn btn-success' value='Me interesa este perro ♥' name='meinteresa"+i+"'> </input>");%>
                            </form>
                        </div>
                       
                </div>
            </div>
       </div>
    </div>
         <% }%>
        
         
             </div>
        
         <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>

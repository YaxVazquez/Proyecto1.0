<%-- 
    Document   : formato
    Created on : 15/05/2017, 03:42:12 PM
    Author     : Yax
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Formato - Dogs & Co</title>
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
         <nav class="navbar navbar-fixed-top colorx">
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
                         <form class="form-horizontal" action='formato.jsp' method='post'>
                         <div class="container-fluid">
                              <h1 class='hm-lk2'> Formato de adopción</h1>
                              <label for="perm" class="col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-4">Nombre del perro</label>
                              <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                         <% 
                             String namep= request.getParameter("perrito");
                         out.println("<input type='text' class='form-control' value='"+namep+"' name='nomm' disabled>"); 
                         out.println("<input type='hidden' class='form-control' value='"+namep+"' name='npe'>");
                         
                         %>
                         <br>
                              </div>
                         <label for="perm" class="col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-4">Nombre del interesado</label>
                              <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                         <% 
                             
                             r = s.executeQuery("select * from usuario where Correo ='"+sesion.getAttribute("user")+"';");
                             r.next();
                             String nameinte= r.getString("Nombre");
                             String apeinte= r.getString("Apellido");
                         out.println("<input type='text' class='form-control' value='"+nameinte+ " "+apeinte+"' name='nombreinteresdo' disabled>"); 
                         %>
                         <br>
                              </div>
                         </div>
                            
                         <div class="container-fluid">
                            
                             
                                 <div class="form-group">
                                   <label for="casa" class="col-xs-12 col-sm-12 col-md-3 col-md-offset-1 col-lg-3"> ¿Su casa es propia o rentada? </label>
                                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 col-lg-offset-1">
                                        Propia
                                        <input type ="radio" name="casa" value="Propia" checked>
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2"> 
                                        Rentada
                                        <input type ="radio" name="casa" value="Rentada"> 
                                    </div>
                                 </div>
                                  <div class="form-group">
                                   <label for="edad" class="col-xs-12 col-sm-12 col-md-3 col-md-offset-1 col-lg-3"> ¿Eres mayor de edad? </label>
                                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 col-lg-offset-1">
                                        Si
                                        <input type ="radio" name="edad" value="Si" checked>
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2"> 
                                        No
                                        <input type ="radio" name="edad" value="No"> 
                                    </div>
                                  </div>
                                 <div class="form-group">
                                   <label for="exp" class="col-xs-12 col-sm-12 col-md-3 col-md-offset-1 col-lg-3"> ¿Tiene experiencia con otros perros? </label>
                                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 col-lg-offset-1">
                                        Si
                                        <input type ="radio" name="experiencia" value="Si" checked>
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2"> 
                                        No
                                        <input type ="radio" name="experiencia" value="No"> 
                                    </div>
                                  </div>
                                 <div class="form-group">
                                   <label for="masmas" class="col-xs-12 col-sm-12 col-md-3 col-md-offset-1 col-lg-3"> ¿Tiene otras mascotas? </label>
                                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 col-lg-offset-1">
                                        Si
                                        <input type ="radio" name="mascotas" value="Si" checked>
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2"> 
                                        No
                                        <input type ="radio" name="mascotas" value="No"> 
                                    </div>
                                  </div>
                                   <div class="form-group">
                                    <label for="perm" class="col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-4">¿El perro es para ti, para la familia o para un regalo?</label>
                                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                      <input type="text" class="form-control" name="resp" id="resp" placeholder="Repuesta" autocomplete='off' title='No utilizes simbolos, numeros ni espacios. No más de 20 carateres' pattern="[A-Za-z]{1,20}" required autofocus>
                                    </div>
                                  </div>
                                 <div class="form-group">
                                   <label for="inf" class="col-xs-12 col-sm-12 col-md-3 col-md-offset-1 col-lg-3">En caso de que el perro sea para la familia. ¿Todos estan informados y de acuerdo con esto? </label>
                                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 col-lg-offset-1">
                                        Si
                                        <input type ="radio" name="inn" value="Si" checked>
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2"> 
                                        No
                                        <input type ="radio" name="inn" value="No"> 
                                    </div>
                                  </div>
                                 <div class="form-group">
                                    <label for="enc" class="col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-4">¿Quién sería el responsable economicamente?</label>
                                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                      <input type="text" class="form-control" name="encar" id="encar" placeholder="Repuesta" autocomplete='off' title='No utilizes simbolos, numeros ni espacios. No más de 20 carateres' pattern="[A-Za-z]{1,20}" required autofocus>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                   <label for="time" class="col-xs-12 col-sm-12 col-md-3 col-md-offset-1 col-lg-3">¿Puedes dedicarle el tiempo necesario? </label>
                                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 col-lg-offset-1">
                                        Si
                                        <input type ="radio" name="tim" value="Si" checked>
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2"> 
                                        No
                                        <input type ="radio" name="tim" value="No"> 
                                    </div>
                                  </div>
                                 <div class="form-group">
                                    <label for="cass" class="col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-4">¿En que parte de la casa viviría?</label>
                                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                      <input type="text" class="form-control" name="caz" id="caz" placeholder="Repuesta" autocomplete='off' title='No utilizes simbolos, numeros ni espacios. No más de 20 carateres' pattern="[A-Za-z]{1,20}" required autofocus>
                                    </div>
                                  </div>
                                 <div class="form-group">
                                    <label for="xq" class="col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-4">¿Por que quieres adoptar?</label>
                                    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                      <input type="text" class="form-control" name="xqq" id="xqq" placeholder="Repuesta" autocomplete='off' title='No utilizes simbolos, numeros ni espacios. No más de 20 carateres' pattern="[A-Za-z]{1,20}" required autofocus>
                                    </div>
                                  </div>
                                 <div class="form-group">
                                   <label for="disp" class="col-xs-12 col-sm-12 col-md-3 col-md-offset-1 col-lg-3">¿Estarías dispuesto a recibir visitas del centro para asegurar el bienestar del perro? </label>
                                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 col-lg-offset-1">
                                        Si
                                        <input type ="radio" name="disp" value="Si" checked>
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2"> 
                                        No
                                        <input type ="radio" name="disp" value="No"> 
                                    </div>
                                  </div>
                                 <div class="form-group">
                                   <label for="don" class="col-xs-12 col-sm-12 col-md-3 col-md-offset-1 col-lg-3">¿Harías algún tipo de donativo al centro? </label>
                                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2 col-lg-offset-1">
                                        Si
                                        <input type ="radio" name="dona" value="Si" checked>
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-2"> 
                                        No
                                        <input type ="radio" name="dona" value="No"> 
                                    </div>
                                  </div>
                                  <input type='submit' name='enviar' id='formato' class='btn culbtn2 col-lg-offset-5' value='Listo!'>
                                    <button class="btn noculbtn" > Cancelar </button>
                             
                             <%
                                 Connection con=null;
           
                                 PreparedStatement pstatement=null;
               
                
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost/doggos","root","n0m3l0");
                    s = con.createStatement();
                }
                catch (SQLException error){
                    out.print(error.toString());
                }
                                 if(request.getParameter("enviar") != null){
                                     r = s.executeQuery("select * from Usuario where Correo ='"+sesion.getAttribute("user")+"';");
                                     r.next();
                                     String idUsu=r.getString("idUsuario");
                                     
                                     r = s.executeQuery("select * from Perro where Nombre ='"+request.getParameter("npe")+"';");
                                     r.next();
                                     String  idPe=r.getString("IdPerro");
                                     String idCe=r.getString("idCentro");
                                     String cas= request.getParameter("casa");
                                     String mayor= request.getParameter("edad");
                                     String exper= request.getParameter("experiencia");
                                     String mascot= request.getParameter("mascotas");
                                     String fina= request.getParameter("resp");
                                     String fam= request.getParameter("inn");
                                     String respo= request.getParameter("encar");
                                     String tiemp= request.getParameter("tim");
                                     String lug= request.getParameter("caz");
                                     String pq= request.getParameter("xqq");
                                     String visits= request.getParameter("disp");
                                     String don= request.getParameter("dona");
                                     
                                     try {
                                     String queryString="call addSolicitud('"+0+"','"+idCe+"','"+idUsu+"','"+idPe+"','"+cas +"','"+mayor+"', '"+exper+"', '"+mascot+"', '"+fina+"', '"+fam+"', '"+respo+"' , '"+tiemp+"'"
                                             + ", '"+lug+"' , '"+pq+"' , '"+visits+"' , '"+don+"');";
                                    pstatement=con.prepareStatement(queryString);
                                    pstatement.executeUpdate();
                                    out.println("<script>alert('Se ha enviado tu solicitud al centro responsable')</script>");
                out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/PaginaPrincipal.jsp'/>");
                                     }                   
                                     catch(Exception e)  
                        {
                            out.println(e.getLocalizedMessage());
                            e.printStackTrace();
                        }
                                     
                                 }
            
                             %>
                             <br> <br>
                         </div>
                         </form>
    </body>
</html>

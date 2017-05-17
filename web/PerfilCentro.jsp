<%-- 
    Document   : PerfilCentro
    Created on : 21/11/2016, 06:59:15 PM
    Author     : ALDO ERNESTO
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
        <title>Perfil del centro</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/estilos1.css">
        <link href="css/cese.css" rel="stylesheet">

        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
        <script>
            function validar(nome,contrase,telefo,correo){
                if(nome.length>30){
                    alert("El campo nombre no puede tener más de 30 caracteres");
                    nome.focus();
                    return false;
                }
                else
                     if(contrase.length>30){
                    alert("La contraseña no puede tener más de 30 caracteres");
                    contrase.focus();
                    return false;
                }
            else
                 if(telefo.length>20){
                    alert("El telefono no puede tener más de 20 caracteres");
                    telefo.focus();
                    return false;
                }
            else
                 if(correo.length>30){
                    alert("El correo no puede tener más de 30 caracteres");
                    correo.focus();
                    return false;
                }
            else{
                return true;
            }
        }
        </script>
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
                <a class="navbar-brand ">Perfil del centro</a>
            </div>
            
            <div class="collapse navbar-collapse colo" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right ">
              
              <li><a href="DogsCentro.jsp">Perros</a></li>
              <li><a href="#" data-toggle="modal" data-target="#cambiar">Modificar Datos</a></li>
              <li><a href="Solicitudes.jsp">Solicitudes de adopción</a></li>
              <li><a href="SalirP.jsp">Cerrar Sesión</a></li>
            </ul>
              
            </div>
            </div>
</nav>
            <section id="about" class="section-content about">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                <figure class="fig-profile wow fadeIn" style="visibility: visible; animation-name: fadeIn;">
                    <img class="img-responsive img-circle img-profile" src="img/Walk.jpg">
                    <figcaption>Dogs&Co</figcaption> 
                    </figure>
 <%
            HttpSession sesion = request.getSession();
          if(sesion.getAttribute("userCentro") == null){
              String e="Inicia sesion o registrate";
              response.sendRedirect("indexP.jsp?e="+e+"");
          }
          else{
           String usuario = (String)sesion.getAttribute("userCentro");
          
          
            
            Connection c = null;
            Statement s = null;
            ResultSet R = null;
            
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                c= DriverManager.getConnection("jdbc:mysql://localhost/doggos","root","n0m3l0");
                s = c.createStatement();
            }
            catch(SQLException error) {
                out.print(error.toString());
            }
            try{
                R = s.executeQuery("select * from Centro where NombreCentro='"+usuario+"';");
                if(R.next()){
                    String des = R.getString("Descripcion");
                    String nomb = R.getString("NombreCentro");
                    String tele = R.getString("Telefono");
                     String corr = R.getString("Correo");
                     String dir = R.getString("IdDireccion");
                     out.println(" <h2 class='name'>"+nomb+" </h2>");  
                   out.println(" <h2 class='position'>"+des+" </h2>");
                   out.println(" <br>"); 
                   out.println(" <h4 class='text-center location'> Teléfono: "+tele+" </h4>");
                   out.println(" <h4 class='text-center location'> Correo: "+corr+" </h4>");
               R = s.executeQuery("select * from DireccionCentro where IdDireccion='"+dir+"';");
                      if(R.next()){
                      
                      String call = R.getString("Calle");
                      String numIn = R.getString("NumInt");
                      String numEx = R.getString("NumExt");
                      String cp = R.getString("Cp");
                      String col = R.getString("Colonia");
                      String del = R.getString("Delegacion");
                      String est = R.getString("Estado");
                                       
                   
                   out.println(" <h4 class='text-center location'>Calle "+call+" Número interior: "+numIn +" Número exterior: "+numEx+" Colonia "
                           +col+" Delegación "+del+" "+est+"</h4>");
                   
                  
                      }
                     
                }
            }
            catch (SQLException error){
                        out.print(error.toString());
            }
            }
            %>  
                  

                </div>
                </div>
                </div>
                </section>
        
       
                        
            <%
           Connection c = null;
            Statement s = null;
            ResultSet R = null;
            String usuario = (String)sesion.getAttribute("userCentro");
            String nami = (String)sesion.getAttribute("nCentro");
            
            
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                c= DriverManager.getConnection("jdbc:mysql://localhost/doggos","root","n0m3l0");
                s = c.createStatement();
            }
            catch(SQLException error) {
                out.print(error.toString());
            }
            try{
                R = s.executeQuery("select * from Centro where NombreCentro='"+usuario+"';");
                if(R.next()){
                    String cen = R.getString("NombreCentro");
                    String con  = R.getString("Contraseña");
                    String des = R.getString("Descripcion");
                    String tel = R.getString("Telefono");
                    String corr = R.getString("Correo");
                    
                    
                   out.println("<div class='modal fade' id ='cambiar'>");
              out.println("<div class='modal-dialog modal-lg'>");
                out.println("<div class='modal-content'>");
                  out.println("<form action='PerfilCentro.jsp' class='form-horizontal' method='post'>");
                  out.println("<div class='modal-header'>");
                    out.println("<button class='close' aria-hidden='true' data-dismiss='modal'>&times;</button>");
                    out.println("<h4 class='modal-title'>Modificar Datos</h4>");
                  out.println("</div>"
                          + "<div class='modal-body'>"
                          + " <div class='form-group'>"
                          + " <label for='Nombre' class='col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-1 col-lg-offset-1 control-label'> Nombre </label>"
                          + "<div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'>"
                          + "<input type='text' class='form-control' name='nome' id='nome' value='"+cen+"' disabled> </div>"
                          + " <label for='Apellido' class='col-xs-12 col-sm-12 col-md-1 col-lg-1 control-label'>Clave</label>"
                          + "<div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'>"
                          + "<input type='text' class='form-control' name='contrase' id='contrase' value='"+con+"' required ></div> </div> <div class='form-group'>"
                          + "<label for='Repetir' class='col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-1 col-lg-offset-1 control-label'>Texto</label>"
                          + " <div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'>"
                          + "<textarea class='form-control' name='descripcion' id='descripcion' value='"+des+"'></textarea></div>"
                          + "<label for='e-mail' class='col-xs-12 col-sm-12 col-md-1 col-lg-1 control-label'>Teléfono</label>"
                          + "<div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'>"
                          + "<input type='text' class='form-control' name='fon' id='fon' value='"+tel+"'required></div></div><div class='form-group'>"
                          + "<label for='Contraseña' class='col-xs-12 col-sm-12 col-md-2 col-lg-2 control-label'>Correo</label>"
                          + "<div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'>"
                          + "<input type='text' class='form-control' name='correo' id='correo' value='"+corr+"'required></div></div></div><div class='modal-footer'>"
                          + "<input type='submit' name='Modificar' id='Modificar' value='Modificar' onClick='return validar(nome,contrase,telefo,correo);'>"
                          + " </div></form></div></div> </div>");
                    
                    
                    
                }
            }
            catch (SQLException error){
                        out.print(error.toString());
            }   
           
            if(request.getParameter("Modificar") != null){
                    
                
                 String ncen = request.getParameter("nome");
                 String ncon = request.getParameter("contrase");
                 String ndes = request.getParameter("descripcion");
                 String ntel = request.getParameter("fon");
                 String ncorr = request.getParameter("correo");
                 String userr = request.getParameter("nome");
               
                Connection con=null;
                Statement st = null;
                PreparedStatement pstatement=null;
                ResultSet r = null;
                
                    if (usuario.equals(userr)){
                            try
                       {
                           if(ncon.equals(R.getString("Contraseña"))){
                            
                           }
                           else{
                               Class.forName("com.mysql.jdbc.Driver").newInstance();
                           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doggos","root","n0m3l0");
                           st = con.createStatement();
                               String queryString="update Centro set Contraseña='"+ncon+"' where NombreCentro= '"+usuario+"' ;";
                                pstatement=con.prepareStatement(queryString);
                                pstatement.executeUpdate();
                                out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/PerfilCentro.jsp'/>");
                           out.println("<script>alert('Se ha actualixado la contraseña');</script>");
                           }
                           if(ncen.equals(R.getString("NombreCentro"))){
                           
                           }
                           else{
                           Class.forName("com.mysql.jdbc.Driver").newInstance();
                           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doggos","root","n0m3l0");
                           st = con.createStatement();
                               String queryString="update Centro set NombreCentro ='"+ncen+"' where NombreCentro= '"+usuario+"' ;";
                                pstatement=con.prepareStatement(queryString);
                                pstatement.executeUpdate();
                                out.println("<script>alert('Se ha actualizado el Nombre del Centro') </script>;"); 
                                sesion.setAttribute("nCentro", R.getString("NombreCentro"));
                                out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/PerfilCentro.jsp'/>");
                           } 
                           if(ndes.equals(R.getString("Descripcion"))|| ndes.length() ==0){
                           
                           }
                           else{
                       Class.forName("com.mysql.jdbc.Driver").newInstance();
                           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doggos","root","n0m3l0");
                           st = con.createStatement();
                               String queryString="update Centro set Descripcion='"+ndes+"'where NombreCentro= '"+usuario+"' ;";
                                pstatement=con.prepareStatement(queryString);
                                pstatement.executeUpdate();
                                out.println("<script>alert('Se ha actualizado la descripcion') </script>;"); 
                                out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/PerfilCentro.jsp'/>");
                       }
                           
                           if(ntel.equals(R.getString("Telefono"))){
                           
                           }
                           else{
                           Class.forName("com.mysql.jdbc.Driver").newInstance();
                           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doggos","root","n0m3l0");
                           st = con.createStatement();
                               String queryString="update Centro set Telefono='"+ntel+"'where NombreCentro= '"+usuario+"' ;";
                                pstatement=con.prepareStatement(queryString);
                                pstatement.executeUpdate();
                                out.println("<script>alert('Se ha actualizado el teléfono') </script>;"); 
                                out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/PerfilCentro.jsp'/>");
                           }
                           
                           if(ncorr.equals(R.getString("Correo"))){
                           
                           }
                           else{
                           Class.forName("com.mysql.jdbc.Driver").newInstance();
                           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doggos","root","n0m3l0");
                           st = con.createStatement();
                               String queryString="update Centro set Correo='"+ncorr+"' where NombreCentro= '"+usuario+"' ;";
                                pstatement=con.prepareStatement(queryString);
                                pstatement.executeUpdate();
                                out.println("<script>alert('Se ha actualizado el correo') </script>;"); 
                                out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/PerfilCentro.jsp'/>");
                           }
                           
                       }
                        catch(SQLException error)
                       {
                           out.println(error.toString());  
                       }
                }
                else{
                      
                    }
                }
                                
                   
                                    
//                   }
                
          
            
            %>

        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>

        <script src="js/main.js"></script>
    </body>
</html>

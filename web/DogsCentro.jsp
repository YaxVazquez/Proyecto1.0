<%-- 
    Document   : DogsCentro
    Created on : 23/11/2016, 06:03:51 PM
    Author     : ALDO ERNESTO
--%>
<%@page import="classes.ProductosIMG"%>
<%@page import="classes.Productos"%>
<%@page import="classes.ProductosDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"%>
 <%
        ProductosDAO p = new ProductosDAO();
        ProductosIMG m = new ProductosIMG();
        HttpSession sesion = request.getSession();
       String idCentr=(String)sesion.getAttribute("idCen");
        p.setId(idCentr);
    ArrayList<Productos> k = (ArrayList)p.BuscarTodos(); 
    ArrayList<Productos> lis = (ArrayList)m.BuscarTodas();
    ArrayList<String> nperros = new ArrayList<String>();
            %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" />
        <title>Perfil del centro</title>
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
        <nav class="navbar navbar-default" >
          <div class="container-fluid" >
            <div class="navbar-header">
              <button class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
                <a class="navbar-brand " >Perros</a>
            </div>
            
            <div class="collapse navbar-collapse colo" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right ">
              
              <li><a href="PerfilCentro.jsp">Perfil Centro</a></li>
                            <li><a href="#" data-toggle="modal" data-target="#registro">Agregar Perro</a></li>
                            <li><a href="Solicitudes.jsp">Solicitudes de adopción</a></li> 
                            <li><a href="SalirP.jsp">Cerrar Sesión</a></li>
            </ul>
              
            </div>
            </div>
</nav>
        <div style="text-align: center;">
        <h1>Gestión de Perros</h1>
        </div>
        <div style="text-align:center; margin-left: auto; margin-right: auto; margin-top: 20px;">
            <h3 style="display:inline">Busca un perro</h3> 
            <form action="DogsCentro.jsp" class="form-horizontal" method="post"  style="text-align:center; margin-left: auto; margin-right: auto;">
            <input type="text"    style="display:inline;" name="busque" id="busque" placeholder="Buscar un perro por su nombre" required>
            <input type="submit" name="Buscar"style="display:inline" value="Buscar">
            </form>
            <% 
            
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
        if(request.getParameter("Buscar") != null){
                String nom=request.getParameter("busque");
                r = s.executeQuery("select * from Perro where Nombre='"+nom+"';");
                if(r.next()){
                out.println("<script>alert('El perro se encuentra registrado, búscalo aquí abajito bro :D');</script>");
                }
                else{
                    out.println("<script>alert('El perro no existe');</script>");
                    }
                } 
            }
            %>
            
             <div class="container" style="margin-top: 20px;">
      
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
                        <% 
                            String nombre=nperros.get(i);
                Connection c = null;
                Statement s = null;
                ResultSet r = null;
                PreparedStatement ps = null;
                String col="";
                          String pes="";
                          String tam="";
                          String eda="";
                          String desc="";
                          String sex="";
                
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    c = DriverManager.getConnection("jdbc:mysql://localhost/doggos","root","n0m3l0");
                    s = c.createStatement();
                }
                catch (SQLException error){
                    out.print(error.toString());
                }

                try {
                  
                   r = s.executeQuery("select * from Perro where Nombre ='"+nombre+"';");
                   r.next();
                           col=r.getString("Color");
                           pes=r.getString("Peso");
                           tam=r.getString("Tamano");
                           eda=r.getString("Rango_edad");
                        desc=r.getString("Descripcion");
                        sex=r.getString("Sexo");
                          
                             
                   
                }
                catch (SQLException error){
                    out.print(error.toString());
                }
             
                            
                         out.println("<div class='modal fade' id ='cambiar"+i+"'>");
              out.println("<div class='modal-dialog modal-lg'>");
                out.println("<div class='modal-content'>");
                  out.println("<form action='DogsCentro.jsp' class='form-horizontal' method='post'>");
                  out.println("<div class='modal-header'>");
                    out.println("<button class='close' aria-hidden='true' data-dismiss='modal'>&times;</button>");
                    out.println("<h4 class='modal-title'>Modificar Datos</h4>");
                  out.println("</div>"
                          + "<div class='modal-body'>"
                          + " <div class='form-group'>"
                          + " <label for='Nombre' class='col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-1 col-lg-offset-1 control-label'> Nombre </label>"
                          + "<div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'>"
                          + "<input type='text' class='form-control' name='nome' id='nome' value='"+nombre+"'required> </div>"
                          + " <label for='Apellido' class='col-xs-12 col-sm-12 col-md-1 col-lg-1 control-label'>Color</label>"
                          + "<div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'>"
                          + "<input type='text' class='form-control' name='color' id='color' value='"+col+"' disabled=”disabled”></div> </div> <div class='form-group'>"
                          + "<label for='Repetir' class='col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-1 col-lg-offset-1 control-label'>Peso</label>"
                          + " <div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'>"
                          + "<input type='text' class='form-control' name='peso' id='peso' value='"+pes+"'required></div>"
                          + "<label for='e-mail' class='col-xs-12 col-sm-12 col-md-1 col-lg-1 control-label'>Tamaño</label>"
                          + "<div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'>"
                          + "<input type='text' class='form-control' name='tamano' id='tamano' value='"+tam+"' disabled=”disabled”></div></div>"
                                  + "<div class='form-group'>"
                        +"<label for='Repetir' class='col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-1 col-lg-offset-1 control-label'>Edad</label>"
                        +"<div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'>"
                          +"<select name='sexo'><option value='"+eda+"'>"+eda+"</option></select>"
                                  +"<label for='Repetir' class='col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-1 col-lg-offset-1 control-label'>Sexo</label>"
                                  + " <input type='text' class='form-control' name='sexo' id=sexo' value='"+sex+"'disabled=”disabled” ></div></div> <div class='form-group'>"
                          + "<label for='Contraseña' class='col-xs-12 col-sm-12 col-md-2 col-lg-2 control-label'>Descripcion</label>"
                          + "<div class='col-xs-12 col-sm-12 col-md-4 col-lg-4'>"
                          + "<textarea class='form-control' name='descripcion' id='descripcion' value='"+desc+"'></textarea></div></div></div><div class='modal-footer'>"
                          + "<input type='submit' name='Modificar"+i+"' id='Modificar' value='Modificar' onClick='return validar(nome,contrase,telefo,correo);'>"
                          + " </div></form></div></div> </div>");
                        out.println("<input type='hidden' value='"+nperros.get(i)+"' id=''>");
                        
                          

                         if(request.getParameter("Modificar"+i) != null){
                 String nnom = request.getParameter("nome");
                 String ncol = request.getParameter("color");
                 String npes = request.getParameter("peso");
                 String ntam = request.getParameter("tamano");
                 String nedad = request.getParameter("edad");
                 String ndes = request.getParameter("descripcion");
                  
                  String userr = (String)sesion.getAttribute("user");
               
                Connection con=null;
                Statement st = null;
                PreparedStatement pstatement=null;
                
                r = s.executeQuery("select * from Perro where Nombre ='"+nombre+"';");
                   r.next();
                    String id = r.getString("idPerro");
                     if(nnom.equals(r.getString("Nombre"))){
                            
                           } 
                           else{
                               Class.forName("com.mysql.jdbc.Driver").newInstance();
                           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doggos","root","n0m3l0");
                           st = con.createStatement();
                               String queryString="update Perro set Nombre='"+nnom+"' where IdPerro= '"+id+"' ;";
                                pstatement=con.prepareStatement(queryString);
                                pstatement.executeUpdate();
                                out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/DogsCentro.jsp'/>");
                           out.println("<script>alert('Se ha actualizado el nombre');</script>");
                           }
                          
                           if(ndes.equals(r.getString("Descripcion"))|| ndes.length() ==0){
                           
                           }
                           else{
                       Class.forName("com.mysql.jdbc.Driver").newInstance();
                           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doggos","root","n0m3l0");
                           st = con.createStatement();
                               String queryString="update Perro set Descripcion='"+ndes+"'where idPerro= '"+id+"' ;";
                                pstatement=con.prepareStatement(queryString);
                                pstatement.executeUpdate();
                                out.println("<script>alert('Se ha actualizado la descripcion') </script>;"); 
                                out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/DogsCentro.jsp'/>");
                       }
                                                   
                           if(npes.equals(r.getString("Peso"))){
                           
                           }
                           else{
                           Class.forName("com.mysql.jdbc.Driver").newInstance();
                           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doggos","root","n0m3l0");
                           st = con.createStatement();
                               String queryString="update Perro set Peso='"+npes+"' where IdPerro= '"+id+"' ;";
                                pstatement=con.prepareStatement(queryString);
                                pstatement.executeUpdate();
                                out.println("<script>alert('Se ha actualizado el peso') </script>;"); 
                                out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/DogsCentro.jsp'/>");
                           }
                      
                           if(nedad.equals(r.getString("Rango_Edad"))){
                           
                           }
                           else{
                           Class.forName("com.mysql.jdbc.Driver").newInstance();
                           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/doggos","root","n0m3l0");
                           st = con.createStatement();
                               String queryString="update Perro set Rango_Edad='"+nedad+"' where IdPerro= '"+id+"' ;";
                                pstatement=con.prepareStatement(queryString);
                                pstatement.executeUpdate();
                                out.println("<script>alert('Se ha actualizado la edad') </script>;"); 
                                out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/DogsCentro.jsp'/>");
                           }
                }
                        

                    out.println("<div class='modal fade' id ='eliminar"+i+"'><div class='modal-dialog modal-lg'>"
               +"<div class='modal-content'> <form action='DogsCentro.jsp' class='form-horizontal' method='post'>"
                +"<div class='modal-header'><button class='close' aria-hidden='true' data-dismiss='modal'>&times;</button>"
                 +"<h4 class='modal-title'>Eliminar perro</h4> </div><div class='modal-body'>"
                  +"<div class='form-group'><h1>¿Seguro que deseas eliminar a "+nombre+"</h1> </div></div><div class='modal-footer'>"
                   +"<input type='submit' name='eliminar"+i+"' id='eliminar' class='btn' value='Eliminar' onClick='return validar(contrax, conf);'>"
                  +"</div></form></div></div> </div>");
                     if(request.getParameter("eliminar"+i) != null){
                              
                Connection con=null;
                Statement st = null;
                PreparedStatement pstatement=null;
                
                r = s.executeQuery("select * from Perro where Nombre ='"+nombre+"';");
                   if(r.next()){
                    try
                   {
                      s.executeUpdate("delete from Perro where Nombre='"+nombre+"';"); 
                      out.println("<script>alert('Se ha eliminado a "+nombre+"')</script>");
                      out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/DogsCentro.jsp'/>");
                   }
                   catch(SQLException error)
                   {
                       out.print(error.toString());
                   }
                   }
                     }
               
                        %>
                        
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
                            <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
                                Opciones <span class="caret"></span><span class="sr-only">Opciones</span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                               <% out.println( "<li><a href='#' data-toggle='modal' data-target='#cambiar"+i+"'>Editar</a></li>"); %>
                                <li class="divider"></li>
                                <% out.println( "<li><a href='#' data-toggle='modal' data-target='#eliminar"+i+"'>Eliminar</a></li>"); %>
                                </ul>
                    </div>
                </div>
            </div>
       </div>
    </div>
         <% }%>
        
         
             </div>
 
 
             
            </div>
        <div class="modal fade" id ="registro">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <form action="DogsCentro.jsp" class="form-horizontal" method="post">
                  <div class="modal-header">
                    <button class="close" aria-hidden="true" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Registrar Perro</h4>
                  </div>
                  <div class="modal-body">
                      <div class="form-group">
                        <label for="Nombre" class="col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-1 col-lg-offset-1 control-label"> Nombre </label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                          <input type="text" class="form-control" name="nome" id="nome" placeholder="Nombre(s)"required>
                        </div>
                        <label for="Apellido" class="col-xs-12 col-sm-12 col-md-1 col-lg-1 control-label">Peso</label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                          <input type="text" class="form-control" name="peso" id="peso" placeholder="Pesos(kg)"required>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="Repetir" class="col-xs-12 col-sm-12 col-md-1 col-md-offset-1 col-lg-1 col-lg-offset-1 control-label">Color</label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                          
                            <Select name="color">
                                <option value="default">Seleccione una opción</option>
                                <option value="blanco">Blanco</option>
                                <option value="negro">Negro</option>
                                <option value="cafe">Café</option>
                                <option value="otro">Otro</option>
                            </Select>
                        </div>
                        <label for="e-mail" class="col-xs-12 col-sm-12 col-md-1 col-lg-1 control-label">Tamaño</label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                            
                            <Select name="tamano">
                                <option value="default">Seleccione una opción</option>
                                <option value="chico">Chico</option>
                                <option value="mediano">Mediano</option>
                                <option value="grande">Grande</option>
                            </Select>
                         
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="Contraseña" class="col-xs-12 col-sm-12 col-md-2 col-lg-2 control-label">Rango de Edad</label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                          
                            <select name="edad">
                                <option value="default">Seleccione una opción</option>
                                <option value="cachorro">Cachorro</option>
                                <option value="adulto">Adulto</option>
                            </select>
                            
                        </div>
                        <label for="sexo" class="col-xs-12 col-sm-12 col-md-1 col-lg-1 control-label">Sexo</label>
                        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                            <select name="sexo">
                                <option value="default">Seleccione una opción</option>
                                <option value="macho">Macho</option>
                                <option value="hembra">Hembra</option>
                            </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="Repetir" class="col-xs-12 col-sm-12 col-md-2 col-lg-2 control-label">Descripcion</label>
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
                            <textarea class="form-control" name="descripcion" required></textarea>
                        </div>
                      </div>
                      
                    </div>
                 <div class="modal-footer">
                    <input type='submit' name='RegistroS' id='RegistroS' class='btn' value='Registrar' onClick='return validar(contrax, conf);'>
                  </div>
                </form>
                </div>
              </div>
            </div>
         
        <%
                     
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
        if(request.getParameter("RegistroS") != null)
            {
                String nome=request.getParameter("nome");
                String pes=request.getParameter("peso");
                String col=request.getParameter("color");
                String tam=request.getParameter("tamano");
                String ed=request.getParameter("edad");
                String des=request.getParameter("descripcion");
                String fot=request.getParameter("descripcion");
                String sexx=request.getParameter("sexo");
                r = s.executeQuery("select * from Centro where NombreCentro='"+usuario+"';");
                r.next();
                    String idCen= r.getString("idCentro");
                try
                {
                    r = s.executeQuery("select * from Perro where Nombre ='"+nome+"' and IdCentro='"+idCen+"';");
                    if (!r.next()){
                        String queryString="call addPerro('"+0+"','"+nome+"','"+pes+"','"+col +"','"+tam+"', '"+ed+"', '"+des+"', '"+idCen+"', '"+sexx+"');";
                         pstatement=con.prepareStatement(queryString);
                         pstatement.executeUpdate();
                         
                             out.println("<script>alert('Registro exitoso')</script>");
                             out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/DogsCentro.jsp'/>");
                          
                    }
                    else {
                      out.println("<script>alert('Un perro ya ha sido registrado con ese nombre')</script>");
                    }
                }
                catch(Exception e)
                        {
                            out.println(e.getLocalizedMessage());
                            e.printStackTrace();
                        }
            } 
        %>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/vendor/bootstrap.min.js"></script>

        <script src="js/main.js"></script>
    </body>
</html>
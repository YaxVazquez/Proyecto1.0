<%-- 
    Document   : PaginaPrincipal
    Created on : 21/11/2016, 12:13:49 PM
    Author     : Yax
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="BD.Centro"%>
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
        <title>Inicio - Dogs & Co</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="img/holi.ico" />

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/iconos.css">
        <link rel="stylesheet" href="css/menu.css">

        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGyaNdstetbXtATNir6dVbKMHY159Qeu4"></script>
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
                                 %>
         <nav class="navbar navbar-fixed-top color">
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
                 <li> 
                    <a href="" data-toggle="modal" data-target="#filtross"><span class='glyphicon glyphicon-search' ></span> Busca tu perro ideal &nbsp;</a>        
                </li>
                <li> 
                    <a href="#mapa"><span class='glyphicon glyphicon-map-marker' ></span>Cercanos a mí</a>        
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
                     
      <div class="container-fluid ppIMG" id="hola">
            <br> <br> <br> <br>
                        <div class="col-xs-3 col-sm-3 col-md-4 col-lg-4">
                            <br> <br>
                            <a href="#" data-toggle="modal" data-target="#filtross">
                                <button class="btn culbtn3"> Encuentra mi perro ideal</button>
                            </a>
                        </div>
                       <div class="col-xs-9 col-sm-9 col-md-8 col-lg-8">
                            <img src="img/ppiax.png" class="img-responsive img2" alt="#">
                        </div>
        </div>
                
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
                    <input type='submit' name='busk' id='busk' class='btn culbtn2' value='Encuentra!'>
                    <button class="btn noculbtn" data-dismiss="modal"> Cancelar </button>
                  </div>
                </form>
                </div>
              </div>
            </div>

    <br>
    <div class="container" id="tips">
            <h1 class="titleh1 col-lg-offset-3">  ¿Estas pensando en adoptar un perro? <p class="tipss col-lg-offset-2"> &nbsp; &nbsp; PUNTOS A CONSIDERAR</p> </h1> 
            <hr class="bbl"> <span class="col-lg-offset-6 glyphicon glyphicon-heart"></span> <hr class="bbl"> 
            <p class="fraes col-lg-offset-1"> <span class="glyphicon glyphicon-heart"></span>¿Porqué quieres compartir tu vida con un animal? </p>
            <br>
            <p class="fraes col-lg-offset-1"> <span class="glyphicon glyphicon-heart"></span>¿Tienes tiempo?  </p>
            <br>
            <p class="fraes col-lg-offset-1"> <span class="glyphicon glyphicon-heart"></span>¿Puedes permitirte económicamente una adopción? </p>
            <br>
            <p class="fraes col-lg-offset-1"> <span class="glyphicon glyphicon-heart"></span>¿Puedes tener uno en el lugar donde vives? </p>
            <br>
            <p class="fraes col-lg-offset-1"> <span class="glyphicon glyphicon-heart"></span>¿Son tus hábitos de vida adecuados para el animal que tienes en mente? </p>
            <br>   
    </div>
    <br>
    <div class="container bugg"> 
        <br> 
        <h1 class="titleh1 col-lg-offset-2"> ¡CENTROS DE ADOPCIÓN CERCANOS A TI! </h1> 
        <p class="fraes col-lg-offset-1"> Ubica un centro cerca de tu domicilio, las etiquetas del perrito los representan.
            Dale click y conoce el nombre, telefono y correo. 
            <br> Si es que tienes la oportunidad, visita los centros, conoce su forma de trabajar.
            <br> Hay muchas formas de ayudar. Puedes ser voluntario, ser hogar temporal, apadrinar a un perro, hacer una donación.
            <br> O simplemente difunde con tus vecinos, amigos, en tus redes sociales. 
            <br> ¡Haz que más gente se sume!</p>
        <br>
    </div>
    <br>
    <div class="container" id="mapa" style="height: 400px;"> </div>
                   
                    <script type="text/javascript">
		
		var divMapa= document.getElementById('mapa');
		navigator.geolocation.getCurrentPosition(functionOk, functionNel);
                
                
                function setMarkersok(map){
                    var gMap= map; 
                    var image = {
                        url: 'http://www.petessentials.ie/wp-content/uploads/2015/02/dog-icon-@2x.png',
                        size: new google.maps.Size(60, 60),
                        
                    };
                    
                    <%
                        LinkedList<Centro> lista = BD.ConsultaCentro.getCentros();
                         for (int i=0;i<lista.size();i++)
                         {
                             
			out.println("var gCoder"+i+"= new google.maps.Geocoder();");
                        out.println("var objInformacion={");
			out.println("address:"+"'"+lista.get(i).getMapa()+"'"+"}");	

			out.println("gCoder"+i+".geocode(objInformacion, fnCoder"+i+");");

			out.println("function fnCoder"+i+"(datos){");
			out.println("var coordenadas= datos[0].geometry.location;");

			out.println("var config={");	
			out.println("map: gMap,");		
			out.println("position:coordenadas,");		
			out.println("title:'Centro "+lista.get(i).getNombre()+"'}");		
				

                        out.println("var gMarkerDV"+i+"= new google.maps.Marker(config)");
                        out.println("gMarkerDV"+i+".setIcon(image);");       
                                
                        out.println("var objHTML= {");
			out.println("content:\"<div style='height:270px;width:400px;'> <form action='detallescentro.jsp' class='form-horizontal' method='post'> <h3 class='fraes'>Centro "+lista.get(i).getNombre()+""
                                + "</h3><br>"
                                + "<p class='fraes'><b>Teléfono:</b> "+ lista.get(i).getTelefono()+"</p><br>"
                                + "<p class='fraes'><b>Correo:</b> "+ lista.get(i).getCorreo()+"</p>"
                                        + "<input type='submit' class='btn culbtn2' value='Ver' id='perfils' name='perfils'>"
                                                + "</form></div>\"");
                        out.println("}");
			out.println("var gIW"+ i +"= new google.maps.InfoWindow(objHTML);");	
			out.println("google.maps.event.addListener(gMarkerDV"+i+",'click', function(){gIW"+i+".open(gMap,gMarkerDV"+i+");})");	
			out.println("}");
                         }
                    %>
                }
		
		function functionOk(respuesta){
			var lat= respuesta.coords.latitude;
			var lon= respuesta.coords.longitude;

			var gLatLon= new google.maps.LatLng(lat, lon);
			
			var objConfigM={
				zoom:17,
				center:gLatLon
			}
			
			var myMap= new google.maps.Map(divMapa, objConfigM);
                        setMarkersok(myMap);

			var objConfigMarker={
				position:gLatLon,
				animation: google.maps.Animation.DROP,
				draggable:true,
				map: myMap,
				title:"Usted está aquí"
			}

			var gMarker = new google.maps.Marker(objConfigMarker);
                        
                        
////////////////////////////////////Hasta aquí se carga el mapa inicial/////////////////////////////

			
		}
                
                
                //ubicacion no permitida
		function functionNel(){
			
			var gCoder= new google.maps.Geocoder();

			var objInformacion={
				address: 'CDMX'
			}

			gCoder.geocode(objInformacion, fnCoderNo);

			function fnCoderNo(datos){
				var coordenadas= datos[0].geometry.location; //obj LatLong

				var objConfig={
					zoom:9,
					center:coordenadas
				}
			
				var gMap= new google.maps.Map(divMapa, objConfig);
                                setMarkersok(gMap);
			}
                   	
		}
	</script> 
        <br>
        <HR class="line" noshade="noshade"/>
        <footer>
        <div class="container-fluid creditos">
            <div class="col-xs-11 col-xs-offset-1 col-sm-11 col-md-4 col-lg-3  navbar-brand"><p>LynxCanine™</p></div>
            <div class="col-xs-9 col-xs-offset-3 col-sm-11 col-md-4 col-lg-3 col-lg-offset-1 creditosR">
                <a href="https://www.facebook.com/literariathegame" class="navbar-brand"><span class="icon icon-facebook facebook"></span></a>
                <a href="https://twitter.com/literariagame" class="navbar-brand"><span class="icon icon-twitter twitter"></span></a>
                <a href="https://www.youtube.com/channel/UCzl2Wzu738n6v8LicLgdfxA" class="navbar-brand"><span class="icon icon-youtube2 youtube"></span></a>
            </div>
            <div class="col-xs-11 col-xs-offset-1 col-sm-11 col-md-4 col-lg-3 navbar-brand"> <span class="glyphicon glyphicon-envelope"> </span> Contacto: dogsandco.lc@gmail.com</div> 
        </div>
        </footer>
        <br>
        
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>

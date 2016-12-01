<%-- 
    Document   : validar
    Created on : 27/11/2016, 12:47:51 AM
    Author     : Yax
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dogs & Co</title>
        <link rel="shortcut icon" type="image/x-icon" href="img/holi.ico" />
    </head>
    <body>
        <%
                Connection con=null;
                Statement s = null;
                PreparedStatement pstatement=null;
                ResultSet r = null;
                
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    con = DriverManager.getConnection("jdbc:mysql://localhost/doggos","root","n0m3l0");
                    s = con.createStatement();
                }
                catch (SQLException error){
                    out.print(error.toString());
                }

                try
                {
                    HttpSession sesion = request.getSession();
                    String emails = (String)sesion.getAttribute("user");
                    
                    r = s.executeQuery("select * from Usuario where Correo ='"+emails+"';");
                    if (r.next()){
                            String queryString="update Usuario set Verificacion='"+1+"' where Correo ='"+emails+"';";
                            pstatement=con.prepareStatement(queryString);
                            pstatement.executeUpdate();
                            out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/PaginaPrincipal.jsp'/>");
                       
                    }
                    else {
                        out.println("<script>alert('Inicia sesión para validar')</script>");
                        out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/index.jsp'/>");
                        out.println("<script> sesione(); </script>");
                    }
                }
                catch(Exception e)
                {
                    out.println(e.getLocalizedMessage());
                    e.printStackTrace();
                } 
        %>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>

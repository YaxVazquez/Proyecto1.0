<%-- 
    Document   : salir
    Created on : 15/05/2016, 11:30:38 PM
    Author     : Yax
--%>
<%@page import="java.sql.*, java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection c = null;
            Statement s = null;
            PreparedStatement ps = null;
            
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                c= DriverManager.getConnection("jdbc:mysql://localhost/doggos","root","n0m3l0");
                s = c.createStatement();
            }
            catch(SQLException error) {
                out.print(error.toString());
            }
        try{
                    HttpSession sesion = request.getSession();
                    String usuario = (String)sesion.getAttribute("user");
                    
                    String queryString="update Usuario set Sesion='"+0+"' where Correo ='"+usuario+"';";
                    ps=c.prepareStatement(queryString);
                    ps.executeUpdate();
                    sesion.invalidate();  
                    response.sendRedirect("index.jsp"); 
        }
        catch(Exception e)
                        {
                            out.println(e.getLocalizedMessage());
                            e.printStackTrace();
                            out.print("Adios");
                        }    
               
        %>
    </body>
</html>

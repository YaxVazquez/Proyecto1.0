
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chistopher
 */
public class RegistrarC extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
            
            int id;
            String nom,email,tel,user,contra;
            String calle,numint,numext,cp,colonia,delegacion,estado;
            String descripcion;
        
        
        try (PrintWriter out = response.getWriter()) {
            //Prametros
            
            
            nom=request.getParameter("nomC");
            email=request.getParameter("correo");
            tel=request.getParameter("tel");
            user=request.getParameter("usuario");
            contra=request.getParameter("contrax");
            calle=request.getParameter("calle");
            numint=request.getParameter("numint");
            numext=request.getParameter("numext");
            cp=request.getParameter("cp");
            colonia=request.getParameter("colonia");
            delegacion=request.getParameter("delegacion");
            estado=request.getParameter("estado");
            descripcion=request.getParameter("comment");
            
            try{
                BD.Conexion con= new BD.Conexion();
                con.conectar();
                ResultSet r1= con.consulta("call addCentro('"+0+"','"+nom+"','"+user+"','"+contra+"','"+descripcion+"','"+tel+"','"+email+"','"+calle+"','"+numint+"','"+numext+"','"+cp+"','"+colonia+"','"+delegacion+"','"+estado+"');");
                
                if(r1.next())
                {
                    String mensaje=r1.getString("msj");
                
                    out.println("<script>alert('"+mensaje+"')</script>");
                    out.println("<meta http-equiv='refresh' content='.0000001;URL=http://localhost:8080/Proyecto1.0/menuAdmin.jsp'/>");
                }
                  
            }
            catch(SQLException error){
                out.print(error.toString());
            }
            out.close();
        }
    }

    

}

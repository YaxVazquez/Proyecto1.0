/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductosSeleccion {
    
    String sex;
    String eda;
    String tam;
    String col;
    public void setDes(String sex,String eda, String tam, String col) {
        this.sex = sex;
        this.eda = eda;
        this.tam = tam;
        this.col = col;
    }

    public List<Productos> BuscarTodos() throws SQLException {
        
        String query = "select * from Perro where sexo='"+sex+"' and Rango_edad='"+eda+"' and Tamano='"+tam+"' and Color='"+col+"';";
        try(Connection con = Conection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            List<Productos> list = new ArrayList<>();
            while(rs.next()) {				
                list.add(crearDTO(rs));
               
            }
            return list;
        }
    }
    public Productos BuscarPorProducto(String id) throws SQLException {
            String query = "select * from Perro WHERE idPerro = ?";
            try(Connection con = Conection.getConnection()) {
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, id);
                ResultSet rs = ps.executeQuery();
                Productos p = null;
                if(rs.next()) {
                        p = crearDTO(rs);
                }
                    return p;
            }
            
	}
    
    
    private Productos crearDTO(ResultSet rs) throws SQLException {
        Productos p = new Productos();
        p.setIdProductos(rs.getString("idPerro"));
        p.setNombre(rs.getString("nombre"));
        p.setPrecio(rs.getString("peso"));
        p.setCantidad(rs.getString("color"));
        p.setDescripcion(rs.getString("descripcion"));
        p.setRutaImagen(rs.getString("Tamano"));
        p.setEdad(rs.getString("Rango_Edad"));
        p.setidCen(rs.getString("idCentro"));
         p.setSex(rs.getString("Sexo"));
         
         
        return p;
    }
    
   
}
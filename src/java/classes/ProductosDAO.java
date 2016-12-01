/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author ALDO ERNESTO
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductosDAO {

    public List<Productos> BuscarTodos() throws SQLException {
        String query = "select * from Perro;";
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
        
        return p;
    }
    
   
}
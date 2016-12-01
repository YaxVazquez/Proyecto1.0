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

public class ProductosIMG {

    public List<Productos> BuscarTodas() throws SQLException {
        String query = "select * from Fotos;";
        try(Connection con = Conection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            List<Productos> list = new ArrayList<>();
            while(rs.next()) {				
                list.add(crearIMG(rs));
            }
            return list;
        }
    }
    
    
    private Productos crearIMG(ResultSet rs) throws SQLException {
        Productos p = new Productos();
        p.setRuta(rs.getString("Foto"));       
        return p;
    }
    
   
}

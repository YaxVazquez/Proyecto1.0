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
public class Productos {
private String idPerro;
    private String nombre;
    private String peso;
    private String color;
    private String tamano;
    private String descripcion;
    private String image;
    private String edad;
    private String idCentro;
    private String sexo;
    private int cuantos;

    /**
     * @return the idProductos
     */
    public String getIdProductos() {
        return idPerro;
    }

    /**
     * @param idProductos the idProductos to set
     */
    public void setIdProductos(String idProductos) {
        this.idPerro = idProductos;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the precio
     */
    public String getPrecio() {
        return peso;
    }

    /**
     * @param precio the precio to set
     */
    public void setPrecio(String precio) {
        this.peso = precio;
    }

    /**
     * @return the cantidad
     */
    public String getCantidad() {
        return color;
    }

    /**
     * @param cantidad the cantidad to set
     */
    public void setCantidad(String cantidad) {
        this.color = cantidad;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the rutaImagen
     */
    public String getRutaImagen() {
        return tamano;
    }

    /**
     * @param rutaImagen the rutaImagen to set
     */
    public void setRutaImagen(String rutaImagen) {
        this.tamano = rutaImagen;
    }
    public String getRuta() {
        return image;
    }

    /**
     * @param rutaImagen the rutaImagen to set
     */
    public void setRuta(String rutaImagen) {
        this.image = rutaImagen;
    }
    public String getEdad() {
        return edad;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setEdad(String ed) {
        this.edad = ed;
    }
     public String getIdCen() {
        return idCentro;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setidCen(String id) {
        this.idCentro = id;
    }
    public String getSex() {
        return sexo;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setSex(String sexo) {
        this.sexo = sexo;
    }
  
}

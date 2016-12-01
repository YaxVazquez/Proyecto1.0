/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl;

import java.util.Properties;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class cMail1 {
    public String _error = "";
    String _para = "";
    String _cuerpoMsj = "";
    String _de = "dogsandco.lc@gmail.com";
    String _titulo = "";
    
    public cMail1()
    {
        
    }
    public boolean mandaMAil(String Para, String Titulo, String Msj)
    {
        boolean envio = false;
        this._titulo = Titulo;
        this._para  = Para;
        this._cuerpoMsj = Msj;
        
        try
        {
            
            
            // Configuracion de la cuenta de envio de mail
            Properties confMail = new Properties();
            confMail.setProperty("mail.smtp.host", "smtp.gmail.com");
            confMail.setProperty("mail.smtp.starttls.enable", "true");
            confMail.setProperty("mail.smtp.port", "587");
            confMail.setProperty("mail.smtp.user", "dogsandco.lc@gmail.com");
            confMail.setProperty("mail.smtp.auth", "true");
            // Sesion
            Session session = Session.getDefaultInstance(confMail);
            
            //contenido html
            BodyPart contenidohtml = new MimeBodyPart( ) ; 
            contenidohtml.setContent("<html>" 
                    + "Hola, es genial saber de ti <a href='http://localhost:8080/Proyecto1.0/validar.jsp'> haz click aqui</a> y verifica tu cuenta" 
                    + "</html>", "text/html" ) ; 
                // Una MultiParte para agrupar texto y adjunto. 
            MimeMultipart multiPart = new MimeMultipart( ) ; 
            multiPart.addBodyPart(contenidohtml) ;
            
            
            // Creamos el MAil
            MimeMessage correo = new MimeMessage(session);
            correo.setFrom(new InternetAddress(this._de));
            correo.addRecipient(Message.RecipientType.TO, new InternetAddress(this._para));
            correo.setSubject(this._titulo);
            //correo.setText(this._cuerpoMsj);
            correo.setContent(multiPart ) ; 

            // Enviamos MAil .
            Transport t = session.getTransport("smtp");
            t.connect("dogsandco.lc@gmail.com", "Dogs&Co.12345678");
            t.sendMessage(correo, correo.getAllRecipients());

            // Cerramos conexion.
            t.close();
            envio = true;
        }
        catch (Exception e)
        {        
            this._error = e.getMessage();
        }
        return envio;
    }   
}
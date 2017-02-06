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
                    + "<div style=\"height: 180px; border: 3px dotted #4DAF7C;padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;\">\n" +
"	<table>\n" +
"		<tr>\n" +
"			<td>\n" +
"				\n" +
"		<h3>¡Hola!</h3>\n" +
"		<h4>Gracias por registrarte, activa tu cuenta</h4><br>\n" +
"		\n" +
"		<a href='http://localhost:8080/Proyecto1.0/validar.jsp'><input type=\"button\" name=\"activar\" style=\"width: 80px;\n" +
"    											   height: 40px;\n" +
"    												font-family: Lane;\n" +
"    												font-size: 18px;\n" +
"    		text-align: center;\n" +
"    cursor: pointer;\n" +
"    outline: none;\n" +
"    color: white;\n" +
"    background-color: #f1c40f;\n" +
"    border: none;\n" +
"    border-radius: 8px;\" value=\"Activar\"></a>\n" +
"		\n" +
"	\n" +
"\n" +
"			</td>\n" +
"			<td>&nbsp;</td>\n" +
"			<td>&nbsp;</td>\n" +
"			<td>&nbsp;</td>\n" +
"			<td><img src=\"https://1.bp.blogspot.com/-lV68sFGNuc8/WJNixitSNOI/AAAAAAAAAL4/-f4U8edpQR8Zy9aGPKDpRqlxvOole9uegCLcB/s1600/perries.png\" alt=\"doggofeliz\" style=\"width:130px;height:130px;\"></td>\n" +
"		</tr>\n" +
"\n" +
"	</table>\n" +
"\n" +
"	<h4>Si no puedes visualizar el correo, copia la siguiente url en tu navegador: http://localhost:8080/Proyecto1.0/validar.jsp</h4>\n" +
"	</div>" 
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
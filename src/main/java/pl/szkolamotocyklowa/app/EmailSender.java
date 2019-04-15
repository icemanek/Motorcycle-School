package pl.szkolamotocyklowa.app;


import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Service
public class EmailSender {

    private final String username = "";
    private final String password = "";
    private Properties props = new Properties();


    public void sendResetPasswordMail(String to, String link) {


        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                }
        );

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress());
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject("Resetowanie hasła");

            String email2 = "<html>" + "<head>"
                    + "<style type='text/css'>"
                    + "body { background: linear-gradient(to right, #ff8177 0%, #ff867a 0%, #ff8c7f 21%, #f99185 52%, #cf556c 78%, #b12a5b 100%); font-family: 'Yanone Kaffeesatz';" +
                    " font-weight: 700; font-size: 1.4em;}" +
                    "h1{background-color: #353535; color: chocolate;}" +
                    "a{color:green;}" + "p{color:black}" + "</style>" +
                    "</head>" + "<body>" + "<h1> <b> Witaj! " + "</b> </h1>" +
                    "<p> <br><br> Poprosiłeś/aś o link do resetowania hasła." +
                    "<br><br>Aby dokończyc proces musisz kliknąć w link który znajduje się poniżej. " + link +
                    "<br><br> </p>" + " <p> <b>Gotowe! </p>" + "</body>" + "</html>";

            message.setContent(email2, "text/html; charset=utf-8");

            Transport.send(message);

            System.out.println("Email wysłany");

        } catch (MessagingException e) {


            throw new RuntimeException(e);
        }
    }


    public void sendRegistrationMail(String to, String body) {

        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                }
        );


        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress());
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject("Rejestracja konta");

            String email1 = "<html>" + "<head>" +
                    "<style type='text/css'>" +
                    "body { background: linear-gradient(to right, #ff8177 0%, #ff867a 0%, #ff8c7f 21%, #f99185 52%, #cf556c 78%, #b12a5b 100%);" +
                    " font-family: 'Yanone Kaffeesatz'; font-weight: 700; font-size 1.4em;}"
                    + "h1{background-color:#353535;color:chocolate;}" + "a{color:green;}"
                    + "p{color:black}" + "</style>" + "</head>" + "<body>"
                    + "<h1> <b> Witaj! " + "</b> </h1>" + "<p> <br><br> Dokonałaś/eś rejestracji!"
                    + "<br><br>Aby dokończyc proces musisz kliknąć w link który znajduje się poniżej. "
                    + body + "<br><br> </p>" + "<p> <b>Gotowe! </p>" + "</body>" + "</html>";

            message.setContent(email1, "text/html; charset=utf-8");

            Transport.send(message);

            System.out.println("Email wysłany");

        } catch (MessagingException e) {


            throw new RuntimeException(e);
        }
    }
}
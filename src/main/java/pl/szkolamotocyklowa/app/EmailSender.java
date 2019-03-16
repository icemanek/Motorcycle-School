package pl.szkolamotocyklowa.app;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Service
public class EmailSender {

    public void sendMail(String to, String subject, String emailBody) throws MessagingException{
        final String username = "*********";
        final String password = "******";

        Properties props = new Properties();
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
            message.setSubject(subject);
            message.setContent(emailBody, "text/html; charset=utf-8");
            Transport.send(message);

            System.out.println("Email wysłany");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
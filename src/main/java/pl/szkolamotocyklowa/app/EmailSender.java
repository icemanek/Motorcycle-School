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

            String email2 = "<!DOCTYPE html><html xmlns='http://www.w3.org/1999/xhtml'" +
                    " xmlns:v='urn:schemas-microsoft-com:vml' " +
                    "xmlns:o='urn:schemas-microsoft-com:office:office'>" +
                    "<head>  <title></title>  " +
                    "<meta http-equiv='X-UA-Compatible' content='IE=edge'> " +
                    "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>" +
                    "<meta name='viewport' content='width=device-width, initial-scale=1.0'>" +
                    "<style type='text/css'>  #outlook a { padding: 0; }  .ReadMsgBody { width: 100%; } " +
                    " .ExternalClass { width: 100%; }  .ExternalClass * { line-height:100%; } " +
                    " body { margin: 0; padding: 0; -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; }" +
                    "  table, td { border-collapse:collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; } " +
                    " img { border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none; " +
                    "-ms-interpolation-mode: bicubic; }  p { display: block; margin: 13px 0; }</style>" +
                    "<style type='text/css'>  @media only screen and (max-width:480px)" +
                    " {    @-ms-viewport { width:320px; }    @viewport { width:320px; }  }</style>" +
                    " <link href='https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700' " +
                    "rel='stylesheet' type='text/css'>    <style type='text/css'>   " +
                    "     @import url(https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700);   " +
                    " </style> <style type='text/css'>  @media only screen and (min-width:480px) " +
                    "{    .mj-column-per-100 { width:100%!important; }  }</style>" +
                    "</head><body style='background: #353535;'>   " +
                    " <div class='mj-container' style='background-color:#353535;'>" +
                    "<div style='margin:0px auto;max-width:600px;'>" +
                    "<table role='presentation' cellpadding='0' cellspacing='0' style='font-size:0px;width:100%;'" +
                    " align='center' border='0'><tbody><tr>" +
                    "<td style='text-align:center;vertical-align:top;direction:ltr;" +
                    "font-size:0px;padding:9px 0px 9px 0px;'><div class='mj-column-per-100 outlook-group-fix'" +
                    " style='vertical-align:top;display:inline-block;direction:ltr;" +
                    "font-size:13px;text-align:left;width:100%;'><table role='presentation'" +
                    " cellpadding='0' cellspacing='0' style='vertical-align:top;' width='100%' border='0'>" +
                    "<tbody><tr><td style='word-wrap:break-word;font-size:0px;padding:15px 15px 15px 15px;'" +
                    " align='center'><div style='cursor:auto;color:#F5A623;" +
                    "font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.5;text-align:center;'>" +
                    "<p><span style='font-size:28px;'><strong>Witaj!</strong></span></p></div></td></tr></tbody></table></div></td>" +
                    "</tr></tbody></table></div><div style='margin:0px auto;max-width:600px;'>" +
                    "<table role='presentation' cellpadding='0' cellspacing='0' style='font-size:0px;width:100%;'" +
                    " align='center' border='0'><tbody><tr><td style='text-align:center;" +
                    "vertical-align:top;direction:ltr;font-size:0px;padding:9px 0px 9px 0px;'>>" +
                    "<div class='mj-column-per-100 outlook-group-fix' style='vertical-align:top;display:inline-block;" +
                    "direction:ltr;font-size:13px;text-align:left;width:100%;'><table role='presentation' cellpadding='0' " +
                    "cellspacing='0' width='100%' border='0'><tbody><tr><td style='word-wrap:break-word;font-size:0px;" +
                    "padding:15px 15px 15px 15px;' align='center'><div style='cursor:auto;color:#F5A623;" +
                    "font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.5;text-align:center;'>" +
                    "<p><span style='font-size:24px;'><strong>Poprosiłeś/aś o reset hasła</strong></span></p></div></td></tr></tbody></table>" +
                    "</div></td></tr></tbody></table></div><div style='margin:0px auto;max-width:600px;'>" +
                    "<table role='presentation' cellpadding='0' cellspacing='0' style='font-size:0px;width:100%;'" +
                    " align='center' border='0'><tbody><tr><td style='text-align:center;vertical-align:top;" +
                    "direction:ltr;font-size:0px;padding:9px 0px 9px 0px;'><div class='mj-column-per-100 outlook-group-fix'" +
                    " style='vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;'>" +
                    "<table role='presentation' cellpadding='0' cellspacing='0' width='100%' border='0'><tbody><tr>" +
                    "<td style='word-wrap:break-word;font-size:0px;padding:15px 15px 15px 15px;' align='center'>" +
                    "<div style='cursor:auto;color:#F5A623;font-family:Ubuntu, Helvetica, Arial, sans-serif;" +
                    "font-size:11px;line-height:1.5;text-align:center;'><p><span style='font-size:20px;'>" +
                    "<strong>Aby ustawić nowe hasło musisz kliknąć przycisk który znajduje się poniżej</strong>" +
                    "</span></p></div></td></tr></tbody></table></div>></td></tr></tbody></table></div>" +
                    "<div style='margin:0px auto;max-width:600px;'>" +
                    "<table role='presentation' cellpadding='0' cellspacing='0' style='font-size:0px;width:100%;'" +
                    " align='center' border='0'><tbody><tr><td style='text-align:center;" +
                    "vertical-align:top;direction:ltr;font-size:0px;padding:9px 0px 9px 0px;'>" +
                    "<div class='mj-column-per-100 outlook-group-fix' style='vertical-align:top;" +
                    "display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;'>" +
                    "<table role='presentation' cellpadding='0' cellspacing='0' width='100%' border='0'>" +
                    "<tbody><tr><td style='word-wrap:break-word;font-size:0px;padding:25px 25px 25px 25px;' align='center'>" +
                    "<table role='presentation' cellpadding='0' cellspacing='0' style='border-collapse:separate;width:100%;' " +
                    "align='center' border='0'><tbody><tr><td style='border:0px solid #000;" +
                    "border-radius:33px;color:#000000;cursor:auto;padding:20px 60px;' align='center'" +
                    " valign='middle' bgcolor='#F5A623'> <a href=http://localhost:8080/password/reset?resetToken="
                    + link +" style='text-decoration:none;background:#F5A623;color:#000000;"+
                    "font-family:Ubuntu, Helvetica, Arial, sans-serif, Helvetica, Arial, sans-serif;font-size:30px;" +
                    "font-weight:normal;line-height:120%;text-transform:none;margin:0px;' target='_blank'>Resetowanie hasła</a></td></tr></tbody></table></td></tr></tbody></table></div></td></tr></tbody>" +
                    "</table></div><div style='margin:0px auto;max-width:600px;'><table role='presentation'" +
                    " cellpadding='0' cellspacing='0' style='font-size:0px;width:100%;' align='center' border='0'>" +
                    "<tbody><tr><td style='text-align:center;vertical-align:top;direction:ltr;font-size:0px;" +
                    "padding:9px 0px 9px 0px;'><div class='mj-column-per-100 outlook-group-fix' " +
                    "style='vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;'>" +
                    "<table role='presentation' cellpadding='0' cellspacing='0' width='100%' border='0'>" +
                    "<tbody></tbody></table></div></td></tr></tbody></table></div></div></body></html>";

            message.setContent(email2, "text/html; charset=utf-8");

            Transport.send(message);

            System.out.println("Email resetowania hasła wysłany");

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

            String email1 = "<!DOCTYPE html><html xmlns='http://www.w3.org/1999/xhtml' " +
                    "xmlns:v='urn:schemas-microsoft-com:vml' xmlns:o='urn:schemas-microsoft-com:office:office'>" +
                    "<head>  <title></title>  <meta http-equiv='X-UA-Compatible' content='IE=edge'> <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>" +
                    "<meta name='viewport' content='width=device-width, initial-scale=1.0'><style type='text/css'> " +
                    " #outlook a { padding: 0; }  .ReadMsgBody { width: 100%; }  .ExternalClass { width: 100%; }  " +
                    ".ExternalClass * { line-height:100%; }  body { margin: 0; padding: 0; -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; } " +
                    " table, td { border-collapse:collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; } " +
                    " img { border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none; -ms-interpolation-mode: bicubic; } " +
                    " p { display: block; margin: 13px 0; }</style><style type='text/css'>  @media only screen and (max-width:480px) " +
                    "{    @-ms-viewport { width:320px; }    @viewport { width:320px; }  }</style>" +
                    " <link href='https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700' rel='stylesheet' type='text/css'> " +
                    "   <style type='text/css'>        @import url(https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700);" +
                    "    </style> <style type='text/css'>  @media only screen and (min-width:480px)" +
                    " {    .mj-column-per-100 { width:100%!important; } " +
                    " }</style></head><body style='background: #353535;'>   " +
                    " <div class='mj-container' style='background-color:#353535;'><div style='margin:0px auto;max-width:600px;'>" +
                    "<table role='presentation' cellpadding='0' cellspacing='0' style='font-size:0px;width:100%;' align='center' border='0'>" +
                    "<tbody><tr><td style='text-align:center;vertical-align:top;direction:ltr;font-size:0px;padding:9px 0px 9px 0px;'>" +
                    "<div class='mj-column-per-100 outlook-group-fix' " +
                    "style='vertical-align:top;display:inline-block;direction:ltr;font-size:13px;" +
                    "text-align:left;width:100%;'><table role='presentation' cellpadding='0' cellspacing='0' " +
                    "style='vertical-align:top;' width='100%' border='0'><tbody><tr>" +
                    "<td style='word-wrap:break-word;font-size:0px;padding:15px 15px 15px 15px;' " +
                    "align='center'><div style='cursor:auto;color:#F5A623;" +
                    "font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:1.5;text-align:center;'>" +
                    "<p><span style='font-size:28px;'><strong>Witaj!</strong></span></p></div></td></tr></tbody>" +
                    "</table></div></td></tr></tbody></table></div><div style='margin:0px auto;max-width:600px;'>" +
                    "<table role='presentation' cellpadding='0' cellspacing='0' style='font-size:0px;width:100%;' " +
                    "align='center' border='0'><tbody><tr><td style='text-align:center;vertical-align:top;direction:ltr;" +
                    "font-size:0px;padding:9px 0px 9px 0px;'>><div class='mj-column-per-100 outlook-group-fix' " +
                    "style='vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;'>" +
                    "<table role='presentation' cellpadding='0' cellspacing='0' width='100%' border='0'><tbody><tr>" +
                    "<td style='word-wrap:break-word;font-size:0px;padding:15px 15px 15px 15px;' align='center'>" +
                    "<div style='cursor:auto;color:#F5A623;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;" +
                    "line-height:1.5;text-align:center;'><p><span style='font-size:24px;'>" +
                    "<strong>Dokonałeś/aś rejestracji</strong></span></p></div></td></tr></tbody></table>" +
                    "</div></td></tr></tbody></table></div><div style='margin:0px auto;max-width:600px;'>" +
                    "<table role='presentation' cellpadding='0' cellspacing='0' style='font-size:0px;width:100%;'" +
                    " align='center' border='0'><tbody><tr><td style='text-align:center;vertical-align:top;direction:ltr;" +
                    "font-size:0px;padding:9px 0px 9px 0px;'><div class='mj-column-per-100 outlook-group-fix' " +
                    "style='vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;'>" +
                    "<table role='presentation' cellpadding='0' cellspacing='0' width='100%' border='0'>" +
                    "<tbody><tr><td style='word-wrap:break-word;font-size:0px;padding:15px 15px 15px 15px;' align='center'>" +
                    "<div style='cursor:auto;color:#F5A623;font-family:Ubuntu, Helvetica, Arial, sans-serif;" +
                    "font-size:11px;line-height:1.5;text-align:center;'><p><span style='font-size:20px;'>" +
                    "<strong>Aby dokończyć proces musisz kliknąć przycisk który znajduje się poniżej</strong>" +
                    "</span></p></div></td></tr></tbody></table></div>></td></tr></tbody></table></div>" +
                    "<div style='margin:0px auto;max-width:600px;'><table role='presentation' cellpadding='0' cellspacing='0' " +
                    "style='font-size:0px;width:100%;' align='center' border='0'><tbody><tr>" +
                    "<td style='text-align:center;vertical-align:top;direction:ltr;font-size:0px;padding:9px 0px 9px 0px;'>" +
                    "<div class='mj-column-per-100 outlook-group-fix'" +
                    " style='vertical-align:top;display:inline-block;direction:ltr;font-size:13px;" +
                    "text-align:left;width:100%;'><table role='presentation' cellpadding='0' cellspacing='0'" +
                    " width='100%' border='0'><tbody><tr><td style='word-wrap:break-word;font-size:0px;" +
                    "padding:25px 25px 25px 25px;' align='center'><table role='presentation' cellpadding='0'" +
                    " cellspacing='0' style='border-collapse:separate;width:100%;' align='center' border='0'>" +
                    "<tbody><tr><td style='border:0px solid #000;border-radius:33px;color:#000000;" +
                    "cursor:auto;padding:20px 60px;' align='center' valign='middle' bgcolor='#F5A623'><a href=http://localhost:8080/user/confirm-account?token="
                    + body+" style='text-decoration:none;background:#F5A623;color:#000000;"+
                    "font-family:Ubuntu, Helvetica, Arial, sans-serif, Helvetica, Arial, sans-serif;font-size:30px;" +
                    "font-weight:normal;line-height:120%;text-transform:none;margin:0px;' target='_blank'>Kliknij tutaj!</a></td></tr></tbody></table></td></tr></tbody></table></div></td></tr></tbody>" +
                    "</table></div><div style='margin:0px auto;max-width:600px;'><table role='presentation'" +
                    " cellpadding='0' cellspacing='0' style='font-size:0px;width:100%;' align='center' border='0'>" +
                    "<tbody><tr><td style='text-align:center;vertical-align:top;direction:ltr;font-size:0px;" +
                    "padding:9px 0px 9px 0px;'><div class='mj-column-per-100 outlook-group-fix' " +
                    "style='vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;'>" +
                    "<table role='presentation' cellpadding='0' cellspacing='0' width='100%' border='0'>" +
                    "<tbody></tbody></table></div></td></tr></tbody></table></div></div></body></html>";

            message.setContent(email1, "text/html; charset=utf-8");

            Transport.send(message);

            System.out.println("Email weryfikacji konta wysłany");

        } catch (MessagingException e) {


            throw new RuntimeException(e);
        }
    }
}
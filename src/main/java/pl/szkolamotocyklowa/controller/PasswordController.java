package pl.szkolamotocyklowa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.szkolamotocyklowa.app.EmailSender;
import pl.szkolamotocyklowa.app.User.User;
import pl.szkolamotocyklowa.repository.UserRepository;
import javax.mail.MessagingException;
import javax.validation.Validator;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping(value = "/password")
public class PasswordController {




    @Autowired
    UserRepository userRepository;

    @Autowired
    EmailSender emailSender;

    @Autowired
    Validator validator;


    @GetMapping(value = "/forgot")
    public String displayForgotPasswordPage(Model model) {


        model.addAttribute("user", new User());

        return "forgotPass";
    }

    @PostMapping(value = "/forgot")
    public String processForgotPassword(String email, Model model) throws MessagingException {


        User user = userRepository.findByEmail(email);


        user.setResetToken(UUID.randomUUID().toString());

        userRepository.save(user);

        String body = "http://localhost:8080/password/reset?resetToken=" + user.getResetToken();

        emailSender.sendMail(user.getEmail(), "Resetowanie hasła", "<html>" +
                "<head>" + "<style type='text/css'>" +
                "body { background: linear-gradient(to right, #ff8177 0%, #ff867a 0%, #ff8c7f 21%, #f99185 52%, #cf556c 78%, #b12a5b 100%); font-family: 'Yanone Kaffeesatz'; font-weight: 700; font-size: 1.4em;}" +
                "h1{background-color: #353535; color: chocolate;}" + "a{color:green;}" +
                "p{color:black}" + "</style>" + "</head>" + "<body>" +
                "<h1> <b> Witaj " + " " + user.getFirstName() + "!</b> </h1>" + "<p> <br><br> Poprosiłeś/aś o link do resetowania hasła." +
                "<br><br>Aby dokończyc proces musisz kliknąć w link który znajduje się poniżej. " + "<br><br> </p>"
                + "<a href='" + body + "'>" + "Kliknij tutaj aby zresetować hasło. <br><br>" + "</a>" + " <p> <b>Gotowe! </p>" + "</body>" + "</html>");


        model.addAttribute("succ", "Jeśli email istnieje w bazie, został wysłany link resetujący hasło.");

        return "forgotPassSucc";


    }


    @GetMapping(value = "/reset")
    public String displayResetPasswordPage(Model model, @RequestParam("resetToken") String resetToken) {

        Optional<User> user = userRepository.findByResetToken(resetToken);

        if (user.isPresent()) {

            model.addAttribute("user", new User());

            return "changePass";
        } else {

            model.addAttribute("error", "Błąd!");

            return "error";
        }
    }

    @PostMapping(value = "/reset")
    public String setNewPassword(Model model, @RequestParam Map<String, String> requestParams) {


        Optional<User> user1 = userRepository.findByResetToken(requestParams.get("resetToken"));


        if (user1.isPresent()) {

            User resetUser = user1.get();

            resetUser.setPassword(requestParams.get("password"));

            resetUser.setResetToken(null);

            userRepository.save(resetUser);

            model.addAttribute("passChng", "Hasło zostało zmienione!");

            return "home";
        } else {

            model.addAttribute("error", "Błąd!");
            return "error";
        }


    }

}

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
import pl.szkolamotocyklowa.app.User.UserService;

import java.util.Map;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequestMapping(value = "/password")
public class PasswordController {


    private UserService userService;

    @Autowired
    void userRepo(UserService userService) {

        this.userService = userService;
    }


    private EmailSender emailSender;

    @Autowired
    void EmailSender(EmailSender emailSender) {
        this.emailSender = emailSender;
    }


    @GetMapping(value = "/forgot")
    public String displayForgotPasswordPage(Model model) {


        model.addAttribute("user", new User());

        return "forgotPass";
    }

    @PostMapping(value = "/forgot")
    public String processForgotPassword(String email, Model model) {


        User user = userService.findByEmail(email);


        user.setResetToken(UUID.randomUUID().toString());

       userService.updateUser(user);

        emailSender.sendResetPasswordMail(user.getEmail(), user.getResetToken());

        model.addAttribute("succ", "Jeśli email istnieje w bazie, został wysłany link resetujący hasło.");

        return "forgotPassSucc";


    }


    @GetMapping(value = "/reset")
    public String displayResetPasswordPage(Model model, @RequestParam("resetToken") String resetToken) {

        Optional<User> user = userService.findByResetToken(resetToken);

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


        Optional<User> user1 = userService.findByResetToken(requestParams.get("resetToken"));


        if (user1.isPresent()) {

            User resetUser = user1.get();

            resetUser.setPassword(requestParams.get("password"));

            resetUser.setResetToken(null);

            userService.updateUser(resetUser);

            model.addAttribute("passChng", "Hasło zostało zmienione!");

            return "home";

        } else {

            model.addAttribute("error", "Błąd!");
            return "error";
        }


    }

}

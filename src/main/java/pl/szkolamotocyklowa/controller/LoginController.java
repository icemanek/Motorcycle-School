package pl.szkolamotocyklowa.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.szkolamotocyklowa.app.User.User;
import pl.szkolamotocyklowa.repository.UserRepository;

import javax.validation.Valid;

@Controller
public class LoginController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute @Valid User user, Model model, BindingResult result) {
        if (result.hasErrors()) {
            return "login";
        }
        User userDb = userRepository.findByUsername(user.getUsername());
        boolean isLoggged = userDb != null && BCrypt.checkpw(user.getPassword(), userDb.getPassword());
        if (!isLoggged) {
            model.addAttribute("loginFailed", true);
            return "login";
        }

               return "zalogowany";
    }



}

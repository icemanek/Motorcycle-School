package pl.szkolamotocyklowa.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.szkolamotocyklowa.app.User.User;
import pl.szkolamotocyklowa.repository.UserRepository;


@Controller
public class LoginController {

    @Autowired
    private UserRepository userRepository;


  @RequestMapping("/login")
    public String login(@ModelAttribute ("login") User user, Model model, BindingResult result) {

        if (result.hasErrors()) {
            return "login";
        }
        User userDb = userRepository.findByUsername(user.getUsername());
        boolean isLoggged = userDb != null && BCrypt.checkpw(user.getPassword(), userDb.getPassword());
        if (!isLoggged) {


            model.addAttribute("loginFailed", true);

            return "login";
        }

               return "redirect:/welcome";
    }


    @RequestMapping( "/welcome")
    public String welcome() {
        return "success";
    }


}

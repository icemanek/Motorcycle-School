package pl.szkolamotocyklowa.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.szkolamotocyklowa.app.User.User;
import pl.szkolamotocyklowa.repository.UserRepository;

import javax.validation.Valid;

@Controller
public class LoginController {

    @Autowired
    private UserRepository userRepository;


  @RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.PUT})
    public String login(@Valid @ModelAttribute ("login") User user, Model model, BindingResult result, @RequestParam(value = "error") String error) {

      if(error != null){

          result.rejectValue("error", "error.login", "mesg");

      }
        if (result.hasErrors()) {


            return "login";
        }
        User userDb = userRepository.findByUsername(user.getUsername());
        boolean isLoggged = userDb != null && BCrypt.checkpw(user.getPassword(), userDb.getPassword());
        if (!isLoggged) {


            model.addAttribute("loginFailed", true);

            return "login";
        }

        model.addAttribute("message", "zalogowałeś się!");

               return "home";
    }

    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.PUT})
    public String showLogin(Model model){

      User user = new User();
        model.addAttribute("login", user);

      return "login";
    }

}

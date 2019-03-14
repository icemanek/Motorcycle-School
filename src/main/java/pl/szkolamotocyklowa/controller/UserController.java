package pl.szkolamotocyklowa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.szkolamotocyklowa.app.EmailSender;
import pl.szkolamotocyklowa.app.User.ConfirmationToken;
import pl.szkolamotocyklowa.app.User.User;
import pl.szkolamotocyklowa.repository.ConfirmationTokenRepository;
import pl.szkolamotocyklowa.repository.UserRepository;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.validation.Validator;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    @Qualifier("userRepository")
    UserRepository userRepository;

    @Autowired
    EmailSender emailSender;

    @Autowired
    Validator validator;

    @Autowired
    private ConfirmationTokenRepository confirmationTokenRepository;


    // <----------------------------Dodawanie użytkownika------------------->

    @GetMapping("/add")
    public String showUser(Model model) {

        model.addAttribute("user", new User());

        return "register_user";

    }



    @PostMapping("/add")
    public String addUser(@ModelAttribute @Valid User user, Model model, BindingResult bindingResult, HttpServletRequest request) throws MessagingException {


        User user1 = userRepository.findByEmail(user.getEmail());
        User user2 = userRepository.findByUsername(user.getUsername());

        if (user1 != null) {
            bindingResult.rejectValue("email", "error.email", "Jest juz taki email w bazie!");

            return "register_user";

        }
        if (user2 != null) {

            bindingResult.rejectValue("username", "username.error", "Ta nazwa jest w użyciu");

            return "register_user";
        } else if (bindingResult.hasErrors()) {

            return "register_user";

        } else {

            userRepository.save(user);

            ConfirmationToken confirmationToken = new ConfirmationToken(user);

            confirmationTokenRepository.save(confirmationToken);


            emailSender.sendMail(user.getEmail(),"Konto w serwisie","<b>Witaj " + " "+ user.getFirstName()+"!</b>" +"<br> Dokonałeś rejestracji!" +
                    "<br>Aby dokończyc proces musisz kliknąć w link który znajduje się poniżej:<br> "
            + "http://localhost:8080/confirm-account?token=" + confirmationToken.getConfirmationToken());

            model.addAttribute("confirmationMessage", "Pomyślnie utworzyłeś konto!Potwierdzenie wysłane na adres" + user.getEmail());

            return "success";
        }
    }

    //<----------------Edycja użytkownika----------------->

    @GetMapping("/update/{id}")
    public String updateUser(@PathVariable Long id, Model model) {


        User user = userRepository.findUserById(id);
        model.addAttribute("user", user);

        return "register_user";
    }

    @PostMapping("/update/{id}")
    public String updateUser(@PathVariable Long id, @ModelAttribute User user) {

        userRepository.save(user);

        return "redirect:../all";

    }

    //<-------------------Lista użytkowników---------------->

//    @GetMapping("/all")
//    public String allUsers(Model model) {
//
//        List<User> userList = userRepository.findAll();
//        model.addAttribute("users", userList);
//
//        return "userList";
//    }

    //<------------------Usuwanie użytkownika-------------------->
//
//    @GetMapping("/delete/{id}")
//    public String deleteUser(@PathVariable Long id) {
//
//        userRepository.deleteById(id);
//
//        return "redirect:../all";
//    }

    @RequestMapping(value="/confirm-account", method= {RequestMethod.GET, RequestMethod.POST})
    public String confirmUserAccount(Model model, @RequestParam("token")String confirmationToken)
    {
        ConfirmationToken token = confirmationTokenRepository.findByConfirmationToken(confirmationToken);

        if(token != null)
        {
            User user = userRepository.findByEmail(token.getUser().getEmail());
            user.setEnabled(true);
            userRepository.save(user);

            return "accountVerified";
        }
        else
        {
            model.addAttribute("message", "The link is invalid or broken!");
            return "error";
        }

    }



    public UserRepository getUserRepository() {
        return userRepository;
    }

    public void setUserRepository(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public ConfirmationTokenRepository getConfirmationTokenRepository() {
        return confirmationTokenRepository;
    }

    public void setConfirmationTokenRepository(ConfirmationTokenRepository confirmationTokenRepository) {
        this.confirmationTokenRepository = confirmationTokenRepository;
    }

}
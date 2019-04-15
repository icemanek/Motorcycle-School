package pl.szkolamotocyklowa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.szkolamotocyklowa.app.EmailSender;
import pl.szkolamotocyklowa.app.User.ConfirmationToken;
import pl.szkolamotocyklowa.app.User.User;
import pl.szkolamotocyklowa.repository.ConfirmationTokenRepository;
import pl.szkolamotocyklowa.repository.UserRepository;

import javax.validation.Valid;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {


    private UserRepository userRepository;

    @Autowired
    void userRepo(UserRepository userRepository) {

        this.userRepository = userRepository;
    }


    private EmailSender emailSender;

    @Autowired
    void EmailSender(EmailSender emailSender) {
        this.emailSender = emailSender;
    }


    private ConfirmationTokenRepository confirmationTokenRepository;


    @Autowired
    void ConfirmationTokenRepository(ConfirmationTokenRepository confirmationTokenRepository) {
        this.confirmationTokenRepository = confirmationTokenRepository;
    }

    // <----------------------------Rejestracja użytkownika------------------->

    @GetMapping("/add")
    public String showUser(Model model) {

        model.addAttribute("user", new User());

        return "register_user";

    }

    @PostMapping("/add")
    public String addUser(@ModelAttribute @Valid User user, Model model, BindingResult bindingResult) {


        User user1 = userRepository.findByEmail(user.getEmail());
        User user2 = userRepository.findByUsername(user.getUsername());

        if (user1 != null) {
            bindingResult.rejectValue("email", "error.email", "Jest juz taki email w bazie!");

            return "register_user";

        }
        if (user2 != null) {

            bindingResult.rejectValue("username", "username.error", "Ta nazwa jest w użyciu");

            return "register_user";

        }
        if (bindingResult.hasErrors()) {


            return "register_user";

        } else {

            userRepository.save(user);

            ConfirmationToken confirmationToken = new ConfirmationToken(user);

            confirmationToken.setExpiryDate(24);

            confirmationTokenRepository.save(confirmationToken);

            emailSender.sendRegistrationMail(user.getEmail(), "<br><br> <a href=http://localhost:8080/user/confirm-account?token=" + confirmationToken.getConfirmationToken() + ">Kliknij tutaj</a>");

            model.addAttribute("confirmationMessage", "Pomyślnie utworzyłeś konto! Potwierdzenie wysłane na adres  " + user.getEmail());

            return "success";
        }
    }


    //<---------------Aktywacja konta przez link wysłany na email----------------------------------->

    @RequestMapping(value = "/confirm-account", method = {RequestMethod.GET, RequestMethod.POST})
    public String confirmUserAccount(Model model, @RequestParam("token") String confirmationToken) {
        ConfirmationToken token = confirmationTokenRepository.findByConfirmationToken(confirmationToken);


        if (token != null) {

            User user = userRepository.findByEmail(token.getUser().getEmail());
            user.setEnabled(true);
            userRepository.save(user);

            return "accountVerified";


        } else {

            model.addAttribute("error", "WYstąpił błąd! Spróbuj ponownie lub zgłoś się do administratora!");

            return "error";
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

//    <-------------------Lista użytkowników---------------->

    @GetMapping("/all")
    public String allUsers(Model model) {

        List<User> userList = userRepository.findAll();
        model.addAttribute("users", userList);

        return "userList";
    }

//    <------------------Usuwanie użytkownika-------------------->

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id) {

        userRepository.deleteById(id);

        return "redirect:../all";
    }

}

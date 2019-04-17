package pl.szkolamotocyklowa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.szkolamotocyklowa.app.EmailSender;
import pl.szkolamotocyklowa.app.User.ConfirmationToken;
import pl.szkolamotocyklowa.app.User.User;
import pl.szkolamotocyklowa.app.User.UserService;
import pl.szkolamotocyklowa.repository.ConfirmationTokenRepository;
import javax.validation.Valid;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {


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


        User user1 = userService.findByEmail(user.getEmail());
        User user2 = userService.findByUsername(user.getUsername());

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

            userService.createUser(user);

            ConfirmationToken confirmationToken = new ConfirmationToken(user);

            confirmationToken.setExpiryDate(24);

            confirmationTokenRepository.save(confirmationToken);

            emailSender.sendRegistrationMail(user.getEmail(), confirmationToken.getConfirmationToken());

            model.addAttribute("confirmationMessage", "Pomyślnie utworzyłeś konto! Potwierdzenie wysłane na adres  " + user.getEmail());

            return "success";
        }
    }


    //<---------------Aktywacja konta przez link wysłany na email----------------------------------->

    @RequestMapping(value = "/confirm-account", method = {RequestMethod.GET, RequestMethod.POST})
    public String confirmUserAccount(Model model, @RequestParam("token") String confirmationToken) {
        ConfirmationToken token = confirmationTokenRepository.findByConfirmationToken(confirmationToken);


        if (token != null) {

            User user = userService.findByEmail(token.getUser().getEmail());

            user.setEnabled(true);

            userService.updateUser(user);



            return "accountVerified";


        } else {

            model.addAttribute("error", "WYstąpił błąd! Spróbuj ponownie lub zgłoś się do administratora!");

            return "error";
        }


    }


    //<----------------Edycja użytkownika----------------->

    @GetMapping("/update/{id}")
    public String updateUser(@PathVariable Long id, Model model) {


        User user = userService.findUserById(id);

        model.addAttribute("user", user);

        return "register_user";
    }

    @PostMapping("/update/{id}")
    public String updateUser(@PathVariable Long id, @ModelAttribute User user) {

        userService.updateUser(user);

        return "redirect:../all";

    }

//    <-------------------Lista użytkowników---------------->

    @GetMapping("/all")
    public String allUsers(Model model) {

        List<User> userList = userService.findAll();

        model.addAttribute("users", userList);

        return "userList";
    }

//    <------------------Usuwanie użytkownika-------------------->

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id) {

        userService.deleteUser(id);

        return "redirect:../all";
    }

}

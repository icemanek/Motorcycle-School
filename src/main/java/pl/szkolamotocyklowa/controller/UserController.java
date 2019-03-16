package pl.szkolamotocyklowa.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;
import pl.szkolamotocyklowa.app.EmailSender;
import pl.szkolamotocyklowa.app.User.ConfirmationToken;
import pl.szkolamotocyklowa.app.User.User;
import pl.szkolamotocyklowa.repository.ConfirmationTokenRepository;
import pl.szkolamotocyklowa.repository.UserRepository;

import javax.mail.MessagingException;
import javax.validation.Valid;
import javax.validation.Validator;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
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
    public String addUser(@ModelAttribute @Valid User user, Model model, BindingResult bindingResult) throws MessagingException {


        User user1 = userRepository.findByEmail(user.getEmail());
        User user2 = userRepository.findByUsername(user.getUsername());

        if (user1 != null) {
            bindingResult.rejectValue("email", "error.email", "Jest juz taki email w bazie!");

            return "register_user";

        }
        if (user2 != null) {

            bindingResult.rejectValue("username", "username.error", "Ta nazwa jest w użyciu");

            return "register_user";

        } if (bindingResult.hasErrors()) {


            return "register_user";

        } else {

            userRepository.save(user);

            ConfirmationToken confirmationToken = new ConfirmationToken(user);

            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.HOUR_OF_DAY,24);
            confirmationToken.setExpiryDate(cal);

            confirmationTokenRepository.save(confirmationToken);

            String body = "http://localhost:8080/user/confirm-account?token="+ confirmationToken.getConfirmationToken();

            emailSender.sendMail(user.getEmail(),"Aktywacja konta","<html>"+
                    "<head>"+"<style type='text/css'>"+
                    "body { background: linear-gradient(to right, #ff8177 0%, #ff867a 0%, #ff8c7f 21%, #f99185 52%, #cf556c 78%, #b12a5b 100%); font-family: 'Yanone Kaffeesatz'; font-weight: 700; font-size: 1.4em;}" +
                    "h1{background-color: #353535; color: chocolate;}"+"a{color:green;}"+
                    "p{color:black}" + "</style>"+ "</head>" + "<body>"+
                    "<h1> <b> Witaj " + " "+ user.getFirstName()+"!</b> </h1>" +"<p> <br><br> Dokonałeś rejestracji!" +
                    "<br><br>Aby dokończyc proces musisz kliknąć w link który znajduje się poniżej "+"<br> Masz na to 24h, po tym czasie token zostanie skasowany"+ "<br><br> </p>"
                    + "<a href='"+body+ "'>"+ "Kliknij tutaj aby aktywować swoje konto. <br><br>"+ "</a>"+" <p> <b>Gotowe! </p>" +"</body>"+"</html>");

            model.addAttribute("confirmationMessage", "Pomyślnie utworzyłeś konto!Potwierdzenie wysłane na adres  " + user.getEmail());

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
            model.addAttribute("error", "WYstąpił błąd! Spróbuj ponownie lub zgłoś się do administratora!");
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
package pl.szkolamotocyklowa.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpRequest;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
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
import javax.servlet.http.HttpServletRequest;
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
    private PasswordEncoder passwordEncoder;

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

            confirmationToken.setExpiryDate(24);

            confirmationTokenRepository.save(confirmationToken);

            String body = "http://localhost:8080/user/confirm-account?token="+ confirmationToken.getConfirmationToken();

            emailSender.sendMail(user.getEmail(),"Aktywacja konta","<html>"+
                    "<head>"+"<style type='text/css'>"+
                    "body { background: linear-gradient(to right, #ff8177 0%, #ff867a 0%, #ff8c7f 21%, #f99185 52%, #cf556c 78%, #b12a5b 100%); font-family: 'Yanone Kaffeesatz'; font-weight: 700; font-size: 1.4em;}" +
                    "h1{background-color: #353535; color: chocolate;}"+"a{color:green;}"+
                    "p{color:black}" + "</style>"+ "</head>" + "<body>"+
                    "<h1> <b> Witaj " + " "+ user.getFirstName()+"!</b> </h1>" +"<p> <br><br> Dokonałaś/eś rejestracji!" +
                    "<br><br>Aby dokończyc proces musisz kliknąć w link który znajduje się poniżej. "+ "<br><br> </p>"
                    + "<a href='"+body+ "'>"+ "Kliknij tutaj aby aktywować swoje konto. <br><br>"+ "</a>"+" <p> <b>Gotowe! </p>" +"</body>"+"</html>");

            model.addAttribute("confirmationMessage", "Pomyślnie utworzyłeś konto! Potwierdzenie wysłane na adres  " + user.getEmail());

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


        if(token != null) {

            User user = userRepository.findByEmail(token.getUser().getEmail());
            user.setEnabled(true);
            userRepository.save(user);

            return "accountVerified";

        } if (token.isExpired()){

            model.addAttribute("error", "Link aktywacyjny wygasł");
        return "error";
    }

        else {
            model.addAttribute("error", "WYstąpił błąd! Spróbuj ponownie lub zgłoś się do administratora!");

            return "error";
        }

    }

    @GetMapping(value = "/forgot")
    public String displayForgotPasswordPage(Model model){


        model.addAttribute("user", new User());

        return "forgotPass";
    }

    @PostMapping(value = "/forgot")
    public String processForgotPassword(String email, Model model) throws MessagingException {


        User user = userRepository.findByEmail(email);

//        if(!optional.isPresent()){
//
//            model.addAttribute("error", "Nie ma takiego adresu w bazie!");
//
//            return "error";
//
//        } else {


          user.setResetToken(UUID.randomUUID().toString());

          userRepository.save(user);

            String body = "http://localhost:8080/user/reset?resetToken=" + user.getResetToken();

            emailSender.sendMail(user.getEmail(), "Resetowanie hasła", "<html>" +
                    "<head>" + "<style type='text/css'>" +
                    "body { background: linear-gradient(to right, #ff8177 0%, #ff867a 0%, #ff8c7f 21%, #f99185 52%, #cf556c 78%, #b12a5b 100%); font-family: 'Yanone Kaffeesatz'; font-weight: 700; font-size: 1.4em;}" +
                    "h1{background-color: #353535; color: chocolate;}" + "a{color:green;}" +
                    "p{color:black}" + "</style>" + "</head>" + "<body>" +
                    "<h1> <b> Witaj " + " " + user.getFirstName() + "!</b> </h1>" + "<p> <br><br> Poprosiłeś/aś o link do resetowania hasła." +
                    "<br><br>Aby dokończyc proces musisz kliknąć w link który znajduje się poniżej. " + "<br><br> </p>"
                    + "<a href='" + body + "'>" + "Kliknij tutaj aby zresetować hasło. <br><br>" + "</a>" + " <p> <b>Gotowe! </p>" + "</body>" + "</html>");


            model.addAttribute("succ", "Link do zresetowania hasła wysłany na adres email!");

            return "forgotPassSucc";


        }




    @GetMapping(value = "/reset")
    public String displayResetPasswordPage(Model model, @RequestParam("resetToken") String resetToken){

        Optional<User> user = userRepository.findByResetToken(resetToken);

        if(user.isPresent()){

            model.addAttribute("resetToken", resetToken);

            return "changePass";
        } else {

            model.addAttribute("error", "Błąd!");

            return "error";
        }
    }

  @PostMapping(value = "/reset")
  public String setNewPassword(Model model, @RequestParam Map<String,String> requestParams){



        Optional<User> user = userRepository.findByResetToken(requestParams.get("resetToken"));

        if (user.isPresent()){

            User resetUser = user.get();

            resetUser.setPassword(passwordEncoder.encode(requestParams.get("password")));

            resetUser.setResetToken(null);

            userRepository.save(resetUser);

            model.addAttribute("passChng","Hasło zostało zmienione!" );

            return "login";
        } else {

            model.addAttribute("error", "Błąd!");
            return "error";
        }






  }


}
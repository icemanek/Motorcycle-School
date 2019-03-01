package pl.szkolamotocyklowa.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.szkolamotocyklowa.app.User.User;
import pl.szkolamotocyklowa.app.activities.Activities;
import pl.szkolamotocyklowa.repository.ActivitiesRepository;
import pl.szkolamotocyklowa.repository.UserRepository;

import javax.validation.Valid;
import javax.validation.Validator;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserRepository userRepository;


    @Autowired
    Validator validator;


    @Autowired
    ActivitiesRepository activitiesRepository;

    @ModelAttribute("activities")
    public Collection<Activities> kursy(){

        List<Activities> kursy2 = new ArrayList<>();

        kursy2.add(new Activities("Podstawowy"));
        kursy2.add(new Activities("Rozszerzony"));
        kursy2.add(new Activities("Premium"));

        return kursy2;
    }


    // <----------------------------Dodawanie użytkownika------------------->

    @GetMapping("/add")
    public String showUser(Model model) {

        model.addAttribute("user", new User());

        return "user";

    }



    @PostMapping("/add")
    public String addUser(@ModelAttribute @Valid User user, @ModelAttribute Activities activities, BindingResult bindingResult) {


       User user1 =  userRepository.findByEmail(user.getEmail());

        if (user1 != null ) {
            bindingResult.rejectValue("email","error.email","Jest juz taki email w bazie! Kliknij 'Zaloguj sie'");

            return "user";

        } else if(bindingResult.hasErrors()) {

            return "user";

        }

        else {

            userRepository.save(user);

            return "home";
        }

    }

    //<----------------Edycja użytkownika----------------->

    @GetMapping("/update/{id}")
    public String updateUser(@PathVariable Long id, Model model) {


        User user = userRepository.findUserById(id);
        model.addAttribute("user", user);

        return "user";
    }

    @PostMapping("/update/{id}")
    public String updateUser(@PathVariable Long id, @ModelAttribute User user) {

        userRepository.save(user);

        return "redirect:../all";

    }

    //<-------------------Lista użytkowników---------------->

    @GetMapping("/all")
    public String allUsers(Model model) {

        List<User> userList = userRepository.findAll();
        model.addAttribute("users", userList);

        return "userList";
    }

    //<------------------Usuwanie użytkownika-------------------->

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable Long id) {

        userRepository.deleteById(id);

        return "redirect:../all";
    }


}

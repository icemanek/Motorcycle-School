package pl.szkolamotocyklowa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.szkolamotocyklowa.app.Activities.Activities;
import pl.szkolamotocyklowa.repository.ActivitiesRepository;

import java.util.List;

@Controller
@RequestMapping("/kursy")
public class ActivitiesController {


    @Autowired
    ActivitiesRepository activitiesRepository;



    // <----------------------------Dodawanie kursow------------------->

    @GetMapping("/add")
    public String showActivity(Model model) {

        model.addAttribute("activities", new Activities());

        return "kursy";

    }

    @PostMapping("/add")
    public String addActivity(@ModelAttribute Activities activities) {

        activitiesRepository.save(activities);

        return "redirect:all";

    }
    //<-----------------------------Edycja Kursu---------------------->

    @GetMapping("/update/{id}")
    public String updateActivity(@PathVariable Long id, Model model) {


       Activities activities = activitiesRepository.findActivitiesById(id);
        model.addAttribute("activities", activities);

        return "kursy";
    }

    @PostMapping("/update/{id}")
    public String updateActivity(@PathVariable Long id, @ModelAttribute Activities activities) {

        activitiesRepository.save(activities);

        return "redirect:../all";

    }

//<-------------------Lista kursow---------------->

    @GetMapping("/all")
    public String allActivity(Model model) {

        List<Activities> activitiesList = activitiesRepository.findAll();
        model.addAttribute("activities", activitiesList);

        return "activityList";
    }

    //<------------------Usuwanie kursow-------------------->

    @GetMapping("/delete/{id}")
    public String deleteActivity(@PathVariable Long id) {

        activitiesRepository.deleteById(id);

        return "redirect:../all";
    }



}

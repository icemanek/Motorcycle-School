package pl.szkolamotocyklowa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.szkolamotocyklowa.app.Instructor.Instructor;
import pl.szkolamotocyklowa.repository.InstructorRepository;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/instructor")
public class InstructorController {


    @Autowired
    InstructorRepository instructorRepository;


    // <----------------------------Dodawanie instruktora------------------->

    @GetMapping("/add")
    public String showInstructor(Model model) {

        model.addAttribute("instructor", new Instructor());

        return "register_instructor";

    }

    @PostMapping("/add")
    public String addInstructor(@ModelAttribute @Valid Instructor instructor, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {

            return "register_instructor";
        } else {
            instructorRepository.save(instructor);

            return "redirect:all";

        }
    }

    //<--------------------------------------------------------------------------_>

    //<----------------Edycja instruktora----------------->

    @GetMapping("/update/{id}")
    public String updateInstructor(@PathVariable Long id, Model model) {


        Instructor instructor= instructorRepository.findInstructorById(id);
        model.addAttribute("instructor", instructor);

        return "register_instructor";
    }

    @PostMapping("/update/{id}")
    public String updateInstructor(@PathVariable Long id, @ModelAttribute Instructor instructor) {

        instructorRepository.save(instructor);

        return "redirect:../all";

    }

    //<------------------------lista instruktorow------------------->


    @GetMapping("/all")
    public String allInstructors(Model model) {

        List<Instructor> instructorList = instructorRepository.findAll();
        model.addAttribute("instructors", instructorList);

        return "instructorList";
    }

    //<-----------------------Usuwanie instruktora---------------->

    @GetMapping("/delete/{id}")
    public String deleteInstructor(@PathVariable Long id) {

        instructorRepository.deleteById(id);

        return "redirect:../all";
    }

}

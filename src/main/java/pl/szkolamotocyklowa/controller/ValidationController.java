package pl.szkolamotocyklowa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.szkolamotocyklowa.FieldError;
import pl.szkolamotocyklowa.app.User.User;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
public class ValidationController {

    @Autowired
    private Validator validator;

    @GetMapping("/validate")
    public String validate(Model model) {
        User user = new User();
        Set<ConstraintViolation<User>> errors = validator.validate(user);

        List<FieldError> fieldErrors = new ArrayList<>();
        for (ConstraintViolation<User> error : errors) {
            FieldError fieldError = new FieldError(error.getPropertyPath().toString(), error.getMessage());
            fieldErrors.add(fieldError);
        }
        model.addAttribute("errors", fieldErrors);
        return "validate";
    }
}

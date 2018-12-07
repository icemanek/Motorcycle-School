package pl.szkolamotocyklowa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GeneralController {


        @RequestMapping("/")
    public String home(){

            return "home";

        }

        @RequestMapping("/onas")
    public String oNas(){

            return "onas";
        }

        @RequestMapping("/drive")
    public String drive(){

            return "drive";

        }

        @RequestMapping("/contact")
    public String contact(){

            return "contact";
        }

        @RequestMapping("/zalogowany")
    public String zalogowany(){

            return "zalogowany";
        }
}

package finalProject.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by ryanmada1 on 6/14/2016.
 */
@Controller
public class IndexController {


    @RequestMapping(value = {"/", "/home/"})
    public String index() {
        return "home/index";
    }


    @RequestMapping(value = "/home/login")
    public String login() {return "home/login"; }
}

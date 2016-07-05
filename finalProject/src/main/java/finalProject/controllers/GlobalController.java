package finalProject.controllers;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

/**
 * Created by ryanmada1 on 7/1/2016.
 */
@ControllerAdvice
public final class GlobalController {

    @Autowired
    private DataSource dataSource;

    @ModelAttribute
    public void addAttributes(Model model) {
        org.springframework.security.core.Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = "notLoggedIn";
        if(auth != null) {
            name = auth.getName(); //get logged in username
        }

        model.addAttribute("loggedInUser",name);

    }

}

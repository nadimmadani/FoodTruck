package finalProject.controllers;

import finalProject.domain.Owner;
import finalProject.domain.Truck;
import finalProject.domain.VO.AdminVO;
import finalProject.services.OwnerService;
import finalProject.services.TruckService;
import org.apache.log4j.Logger;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.apache.tomcat.util.net.jsse.openssl.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;


/**
 * Created by ryanmada1 on 6/28/2016.
 */
@Controller
public class AdminController {


    @Autowired
    private DataSource dataSource;

    @Autowired
    private OwnerService ownerService;

    @Autowired
    private TruckService truckService;

    private Logger log = Logger.getLogger((AdminController.class));

    @RequestMapping(value="/home/map", method = RequestMethod.GET)
    public String mapHome() {
        return "/home/map";
    }

    @RequestMapping(value="/admin/addtruck", method = RequestMethod.GET)
    public String getTrucks(Model model) {
        model.addAttribute("AdminVO", new AdminVO());
        return "/admin/trucks_add";
    }

    @RequestMapping(value = "/admin/addtruck", method = RequestMethod.POST)
    public String postaddTruck(AdminVO adminVO, Model model) throws Exception {
        org.springframework.security.core.Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username

        //create getByUsername custom repository and use String name to grab owner
        Owner owner = ownerService.getByUserName(name);
        List<Truck> truckList = new ArrayList<>();

        if(owner.getTruckList()!= null) {
            truckList = owner.getTruckList();

        }

        truckList.add( new Truck(adminVO.getNewTruckName(), adminVO.getNewTruckDescription(),"false"));



        owner.setTruckList(truckList);

        ownerService.saveOwner(owner);

        model.addAttribute("AdminVO", new AdminVO());
        return "/admin/trucks_add";
    }

    @RequestMapping(value = "/home/signup", method = RequestMethod.GET)
    public String getSignUp(Model model) {
        model.addAttribute("AdminVO", new AdminVO());
        return "/home/signup";
    }

    @RequestMapping(value = "/home/signup", method = RequestMethod.POST)
    public String postSignUp(AdminVO adminVO, Model model) throws Exception {

        Owner newOwner = new Owner(adminVO.getNewUserName(), adminVO.getNewPassword());

        ownerService.saveOwner(newOwner);

        //creating user in spring security
        JdbcUserDetailsManager userDetailService = new JdbcUserDetailsManager();
        userDetailService.setDataSource(dataSource);
        PasswordEncoder encoder = new BCryptPasswordEncoder();

        if (!userDetailService.userExists(newOwner.getUserName())) {
            List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
            authorities.add(new SimpleGrantedAuthority("USER"));
            User userDetails = new User(newOwner.getUserName(), encoder.encode(newOwner.getPassword()), authorities);

            userDetailService.createUser(userDetails);
        }

        return "redirect:/admin/addtruck";
    }

    @RequestMapping(value = "/admin/trucklist", method = RequestMethod.GET)
    public String getTruckList( Model model) {

        Owner owner = getLoggedInOwner();

        model.addAttribute("newTruckList", owner.getTruckList());

        model.addAttribute("adminVO", new AdminVO());
        return "/admin/truck_list";
    }

    @RequestMapping(value = "/admin/delete/{id}")
    public String deleteTruck(@PathVariable int id) {
        truckService.deleteTruck(id);

        return "redirect:/admin/truck_list";
    }

    //region HELPER METHODS
    public Owner getLoggedInOwner() {

        org.springframework.security.core.Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();

        Owner owner = ownerService.getByUserName(name);

//        int id = owner.getId();

        return owner;
    }
    //endregion

}

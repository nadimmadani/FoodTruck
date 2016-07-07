package finalProject.rest;

import finalProject.controllers.AdminController;
import finalProject.domain.Owner;
import finalProject.domain.Truck;
import finalProject.repositories.TruckRepository;
import finalProject.services.OwnerService;
import finalProject.services.TruckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

/**
 * Created by ryanmada1 on 7/6/2016.
 */
@RestController
@RequestMapping("/rest/")
public class UpdateTruckController {

    @Autowired
    OwnerService ownerService;

    @Autowired
    TruckService truckService;

    @RequestMapping("list")
    public Iterable<Truck> listAllTrucks() {

        Owner owner = getLoggedInOwner();
        return owner.getTruckList();
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public Truck updateTruck( Truck truck) {
        return truckService.saveTruck(truck);
    }

    @RequestMapping(value = "delete", method = RequestMethod.DELETE)
    public String deleteTruck(@PathVariable int id){
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

package finalProject.rest;

import finalProject.controllers.AdminController;
import finalProject.domain.Location;
import finalProject.domain.Owner;
import finalProject.domain.Truck;
import finalProject.repositories.TruckRepository;
import finalProject.services.LocationService;
import finalProject.services.OwnerService;
import finalProject.services.TruckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

    @Autowired
    LocationService locationService;

    @RequestMapping("truck/{id}")
    public Truck getTruckById(@PathVariable int id) {

        return truckService.getTruckById(id);
    }

    @RequestMapping("list")
    public Iterable<Truck> listAllTrucks() {

        Owner owner = getLoggedInOwner();
        return owner.getTruckList();
    }

    @RequestMapping(value = "update/{cordsLat}/{cordsLong}", method = RequestMethod.POST)
    public Truck updateTruck(Truck truck, @PathVariable String cordsLat, @PathVariable String cordsLong) {
//        Location previousLocation = truck.getTruckLocation();
//        locationService.deleteLocation(previousLocation.getId());
        Location location = new Location();
        location.setCoordinates(cordsLat + ", " + cordsLong);
        Truck realTruck = truckService.getTruckById(truck.getId());
        realTruck.setTruckName(truck.getTruckName());
        realTruck.setTruckLocation(location);
        realTruck.setIsRunning(truck.getIsRunning());
        realTruck.setTruckDescription(truck.getTruckDescription());

//        truck.setTruckLocation(location);
        return truckService.saveTruck(realTruck);
    }

    @RequestMapping(value = "deleteTruck/{id}")
    public String deleteTruck(@PathVariable int id) {

        List<Truck> trucksList = getLoggedInOwner().getTruckList();
        Truck truckToBeRemoved = new Truck();
        for(Truck t: trucksList) {
            if (t.getId() == id) {
                truckToBeRemoved = t;
            }
        }
        if (truckToBeRemoved != null)
            trucksList.remove(truckToBeRemoved);

        getLoggedInOwner().setTruckList(trucksList);
        ownerService.saveOwner(getLoggedInOwner());
        truckService.deleteTruck(id);

        return "/admin/trucklist";

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

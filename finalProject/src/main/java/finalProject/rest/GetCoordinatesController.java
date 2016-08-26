package finalProject.rest;

import finalProject.domain.Truck;
import finalProject.services.TruckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by ryanmada1 on 7/11/2016.
 */
@RestController
@RequestMapping("/rest/")
public class GetCoordinatesController {
    @Autowired
    TruckService truckService;

    @RequestMapping("maplist")
    public Iterable<Truck> getTruckList() {

        return truckService.listAllTrucks();
    }

}

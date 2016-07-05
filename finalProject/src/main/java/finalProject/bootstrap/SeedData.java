package finalProject.bootstrap;

import finalProject.domain.Owner;
import finalProject.domain.Truck;
import finalProject.services.OwnerService;
import finalProject.services.TruckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import java.lang.annotation.ElementType;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ryanmada1 on 6/28/2016.
 */
@Component
public class SeedData implements ApplicationListener<ContextRefreshedEvent> {

    @Autowired
    private OwnerService ownerService;

    @Autowired
    private TruckService truckService;

    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
        generateOwnerAndTruckData();
    }

    private void generateOwnerAndTruckData() {
        Owner owner1 = new Owner();
        owner1.setUserName("Ryan");
        owner1.setPassword("123");

        List truckList1 = new ArrayList<Truck>();
        Truck truck1 = new Truck();

        truck1.setTruckName("TacoTruck");
        truck1.setTruckDescription("blah blah blah");

        truckList1.add(truck1);

        owner1.setTruckList(truckList1);

        ownerService.saveOwner(owner1);
    }
}

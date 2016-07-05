package finalProject.services;

import finalProject.domain.Truck;
import org.springframework.stereotype.Service;

/**
 * Created by ryanmada1 on 6/27/2016.
 */
@Service
public interface TruckService {
    Truck getTruckById(Integer id);

    Truck saveTruck(Truck truck);

    Iterable<Truck> listAllTrucks();

    Iterable<Truck> saveAllTrucks(Iterable<Truck> truckIterable);

    void deleteTruck(Integer id);

}

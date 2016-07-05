package finalProject.services.impl;

import finalProject.domain.Truck;
import finalProject.repositories.TruckRepository;
import finalProject.services.TruckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ryanmada1 on 6/28/2016.
 */
@Service
public class TruckServiceImpl implements TruckService {

    @Autowired
    private TruckRepository truckRepository;

    @Override
    public Truck getTruckById(Integer id) {
        return truckRepository.findOne(id);
    }

    @Override
    public Truck saveTruck(Truck truck) {
        return truckRepository.save(truck);
    }

    @Override
    public Iterable<Truck> listAllTrucks() {
        return truckRepository.findAll();
    }

    @Override
    public Iterable<Truck> saveAllTrucks(Iterable<Truck> truckIterable) {
        return truckRepository.save(truckIterable);
    }

    @Override
    public void deleteTruck(Integer id) {
        truckRepository.delete(id);
    }
}

package finalProject.services.impl;

import finalProject.domain.Location;
import finalProject.repositories.LocationRepository;
import finalProject.services.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ryanmada1 on 6/28/2016.
 */
@Service
public class LocationServiceImpl implements LocationService {

    @Autowired
    private LocationRepository locationRepository;

    @Override
    public Location getLocationById(Integer id) {
        return locationRepository.findOne(id);
    }

    @Override
    public Location saveLocation(Location location) {
        return locationRepository.save(location);
    }

    @Override
    public void deleteLocation(Integer id) {
        locationRepository.delete(id);
    }
}

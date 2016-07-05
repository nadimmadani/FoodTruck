package finalProject.services;

import finalProject.domain.Location;
import org.springframework.stereotype.Service;

/**
 * Created by ryanmada1 on 6/27/2016.
 */
@Service
public interface LocationService {
    Location getLocationById(Integer id);
    Location saveLocation(Location location);
    void deleteLocation(Integer id);
}

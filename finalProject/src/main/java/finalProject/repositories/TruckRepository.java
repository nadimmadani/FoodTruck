package finalProject.repositories;

import finalProject.domain.Truck;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by ryanmada1 on 6/27/2016.
 */
@Repository
public interface TruckRepository extends CrudRepository<Truck, Integer> {
}

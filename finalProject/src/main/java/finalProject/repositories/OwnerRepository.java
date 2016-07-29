package finalProject.repositories;

import finalProject.domain.Owner;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by ryanmada1 on 6/27/2016.
 */
public interface OwnerRepository extends CrudRepository<Owner, Integer> {

    Owner findByUserName(String userName);


}

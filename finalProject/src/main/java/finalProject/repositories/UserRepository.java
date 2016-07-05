package finalProject.repositories;

import finalProject.domain.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by ryanmada1 on 6/27/2016.
 */
@Repository
public interface UserRepository extends CrudRepository<User, Integer> {
}

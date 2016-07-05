package finalProject.repositories;

import finalProject.domain.UserInfo;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by ryanmada1 on 6/27/2016.
 */
@Repository
public interface UserInfoRepository extends CrudRepository<UserInfo, Integer> {
}

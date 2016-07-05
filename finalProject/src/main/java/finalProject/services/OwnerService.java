package finalProject.services;

import finalProject.domain.Owner;
import org.springframework.stereotype.Service;

/**
 * Created by ryanmada1 on 6/27/2016.
 */
@Service
public interface OwnerService {
    Owner getOwnerById(Integer Id);

    Owner saveOwner(Owner owner);

    void deleteOwner(Integer id);

    Owner getByUserName(String userName);
}

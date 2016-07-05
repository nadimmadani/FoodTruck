package finalProject.services;

import finalProject.domain.Owner;
import finalProject.domain.OwnerContact;
import org.springframework.stereotype.Service;

/**
 * Created by ryanmada1 on 6/27/2016.
 */
@Service
public interface OwnerContactService {
    OwnerContact getOwnerContactById(Integer id);
    OwnerContact saveOwnerContact(OwnerContact ownerContactr);
    void deleteOwnerContact(Integer id);
}

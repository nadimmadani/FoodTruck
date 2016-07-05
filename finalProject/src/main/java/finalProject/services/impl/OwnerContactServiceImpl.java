package finalProject.services.impl;

import finalProject.domain.Owner;
import finalProject.domain.OwnerContact;
import finalProject.repositories.OwnerContactRepository;
import finalProject.services.OwnerContactService;
import finalProject.services.OwnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ryanmada1 on 6/28/2016.
 */
@Service
public class OwnerContactServiceImpl implements OwnerContactService {
    @Autowired
    private OwnerContactRepository ownerContactRepository;

    @Override
    public OwnerContact getOwnerContactById(Integer id) {
        return ownerContactRepository.findOne(id);
    }

    @Override
    public OwnerContact saveOwnerContact(OwnerContact ownerContact) {
        return ownerContactRepository.save(ownerContact);
    }

    @Override
    public void deleteOwnerContact(Integer id) {
        ownerContactRepository.delete(id);
    }
}

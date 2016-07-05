package finalProject.services.impl;

import finalProject.domain.Owner;
import finalProject.repositories.OwnerRepository;
import finalProject.services.OwnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ryanmada1 on 6/28/2016.
 */
@Service
public class OwnerServiceImpl implements OwnerService {

    @Autowired
    private OwnerRepository ownerRepository;

    @Override
    public Owner getOwnerById(Integer Id) {
        return ownerRepository.findOne(Id);
    }

    @Override
    public Owner saveOwner(Owner owner) {
        return ownerRepository.save(owner);
    }

    @Override
    public void deleteOwner(Integer id) {
        ownerRepository.delete(id);
    }

    @Override
    public Owner getByUserName(String userName) {
        return ownerRepository.findByUserName(userName);
    }
}

package finalProject.services;

import finalProject.domain.User;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ryanmada1 on 6/28/2016.
 */
@Service
public interface UserService {
    User getUserById(Integer id);

    Iterable<User> listAllUsers();

    User saveUser(User user);

    void deleteUser(Integer id);
}

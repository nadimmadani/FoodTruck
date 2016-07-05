package finalProject.services;

import finalProject.domain.Menu;
import org.springframework.stereotype.Service;

/**
 * Created by ryanmada1 on 6/27/2016.
 */
@Service
public interface MenuService {
    Menu getMenuById(Integer id);

    Menu saveMenu(Menu menu);

    void delete(Menu menu);
}

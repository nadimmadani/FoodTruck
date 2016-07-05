package finalProject.services.impl;

import finalProject.domain.Menu;
import finalProject.repositories.MenuRepository;
import finalProject.services.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ryanmada1 on 6/28/2016.
 */
@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuRepository menuRepository;

    @Override
    public Menu getMenuById(Integer id) {
        return menuRepository.findOne(id);
    }

    @Override
    public Menu saveMenu(Menu menu) {
        return menuRepository.save(menu);
    }

    @Override
    public void delete(Menu menu) {
        menuRepository.delete(menu);

    }
}

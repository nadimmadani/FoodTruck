package finalProject.services;

import finalProject.domain.UserInfo;
import org.springframework.stereotype.Service;

/**
 * Created by ryanmada1 on 6/28/2016.
 */
@Service
public interface UserInfoService {

    UserInfo getUserInfoById(Integer id);

    UserInfo saveUserInfo(UserInfo userInfo);

    void deleteUserInfo(Integer id);
}

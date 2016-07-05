package finalProject.services.impl;

import finalProject.domain.UserInfo;
import finalProject.repositories.UserInfoRepository;
import finalProject.services.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by ryanmada1 on 6/28/2016.
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    private UserInfoRepository userInfoRepository;

    @Override
    public UserInfo getUserInfoById(Integer id) {
        return userInfoRepository.findOne(id);
    }

    @Override
    public UserInfo saveUserInfo(UserInfo userInfo) {
        return userInfoRepository.save(userInfo);
    }

    @Override
    public void deleteUserInfo(Integer id) {
        userInfoRepository.delete(id);

    }
}

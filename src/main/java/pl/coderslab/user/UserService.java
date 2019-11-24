package pl.coderslab.user;

import org.springframework.stereotype.Service;

@Service
public interface UserService {
    User findUserByEmail(String email);
    void saveUser(User user);
  //void changeUserPassword(User user);

}



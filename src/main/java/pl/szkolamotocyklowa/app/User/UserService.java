package pl.szkolamotocyklowa.app.User;

import java.util.List;
import java.util.Optional;

public interface UserService {


    void createUser(User user);

    void deleteUser(Long id);

    void updateUser(User user);

    User showUser(Long id);

    User findByUsername(String username);

    User findByEmail(String email);

    User findUserById(Long id);

    Optional<User> findUserByEmail(String email);

    Optional<User> findByResetToken(String resetToken);

    List<User> findAll();



}

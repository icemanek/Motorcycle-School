package pl.szkolamotocyklowa.app.User;

import java.util.List;

public interface UserDao {


    void createUser(User user);

    void deleteUser(Long id);

    void updateUser(User user);

    User showUser(Long id);

    List<User> findAll();
}

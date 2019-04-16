package pl.szkolamotocyklowa.app.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.szkolamotocyklowa.repository.UserRepository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class UserServiceImpl implements UserService {


    private UserDao userDao;

    @Autowired
    private void userDao(UserDao userDao){

        this.userDao = userDao;
    }


    private UserRepository userRepository;

    @Autowired
    private void userRepository(UserRepository userRepository){

        this.userRepository = userRepository;
    }


    @Override
    public void createUser(User user) {

        userDao.createUser(user);

    }

    @Override
    public void deleteUser(Long id) {

        userDao.deleteUser(id);

    }

    @Override
    public void updateUser(User user) {

        userDao.updateUser(user);

    }

    @Override
    public User showUser(Long id) {
        return userDao.showUser(id);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public User findUserById(Long id) {
        return userRepository.findUserById(id);
    }

    @Override
    public Optional<User> findUserByEmail(String email) {
        return userRepository.findUserByEmail(email);
    }

    @Override
    public Optional<User> findByResetToken(String resetToken) {
        return userRepository.findByResetToken(resetToken);
    }

    @Override
    public List<User> findAll(){
        return userDao.findAll();
    }

}

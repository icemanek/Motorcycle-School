package pl.szkolamotocyklowa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.szkolamotocyklowa.app.User.User;

public interface UserRepository extends JpaRepository<User, Long> {



    User findUserById(Long id);



    User findByUsername(String username);

        User findByEmail(String email);

}
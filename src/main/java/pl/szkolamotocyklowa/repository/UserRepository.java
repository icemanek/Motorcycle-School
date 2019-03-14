package pl.szkolamotocyklowa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import pl.szkolamotocyklowa.app.User.User;

@Repository("userRepository")
public interface UserRepository extends CrudRepository<User, String> {

    User findByUsername(String username);

    User findByEmail(String email);

    User findUserById(Long id);

}

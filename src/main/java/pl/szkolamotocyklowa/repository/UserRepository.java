package pl.szkolamotocyklowa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.szkolamotocyklowa.app.User.User;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User,Long> {

    User findByUsername(String username);

    User findByEmail(String email);

    User findUserById(Long id);

    Optional<User> findUserByEmail(String email);

    Optional<User> findByResetToken(String resetToken);

}

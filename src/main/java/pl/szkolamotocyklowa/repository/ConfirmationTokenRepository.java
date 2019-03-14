package pl.szkolamotocyklowa.repository;


import org.springframework.data.repository.CrudRepository;
import pl.szkolamotocyklowa.app.User.ConfirmationToken;

public interface ConfirmationTokenRepository extends CrudRepository<ConfirmationToken, String> {
    ConfirmationToken findByConfirmationToken(String confirmationToken);
}

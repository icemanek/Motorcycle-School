package pl.szkolamotocyklowa.repository;


import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import pl.szkolamotocyklowa.app.User.ConfirmationToken;

import java.util.Date;

public interface ConfirmationTokenRepository extends CrudRepository<ConfirmationToken, String> {


    ConfirmationToken findByConfirmationToken(String confirmationToken);


    @Modifying
    @Query("delete from ConfirmationToken t where t.expiryDate <= ?1")
    void deleteAllExpiredSince(Date now);




}

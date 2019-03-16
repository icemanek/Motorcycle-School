package pl.szkolamotocyklowa.app;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import pl.szkolamotocyklowa.repository.ConfirmationTokenRepository;

import javax.transaction.Transactional;
import java.time.Instant;
import java.util.Date;

@Service
@Transactional
public class TokensPurgeTask {


    @Autowired
    private ConfirmationTokenRepository confirmationTokenRepository;

    @Scheduled(cron = "${purge.cron.expression}")
    public void purgeExpired() {
        Date now = Date.from(Instant.now());
        confirmationTokenRepository.deleteAllExpiredSince(now);
    }

}

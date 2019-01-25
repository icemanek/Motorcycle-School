package pl.szkolamotocyklowa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.szkolamotocyklowa.app.activities.Activities;

public interface ActivitiesRepository extends JpaRepository<Activities, Long> {



    Activities findActivitiesById(Long id);



}

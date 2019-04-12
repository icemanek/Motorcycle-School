package pl.szkolamotocyklowa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.szkolamotocyklowa.app.Activities.Activities;

public interface ActivitiesRepository extends JpaRepository<Activities, Long> {



    Activities findActivitiesById(Long id);



}

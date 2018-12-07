package pl.szkolamotocyklowa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.szkolamotocyklowa.app.Instructor.Instructor;

public interface InstructorRepository extends JpaRepository<Instructor, Long> {


    Instructor findInstructorById(Long id);

}

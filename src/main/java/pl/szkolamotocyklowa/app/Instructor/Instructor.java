package pl.szkolamotocyklowa.app.Instructor;

import pl.szkolamotocyklowa.app.activities.Activities;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "INSTRUCTORS")
public class Instructor {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String firstNameInstructor;

    @NotBlank
    private String lastNameInstructor;

    @NotBlank
    @Email
    private String emailInstructor;

    @Transient
    private String fullNameInstructor;


    @OneToMany(fetch = FetchType.EAGER)
    private List<Activities> activitiesInstructor = new ArrayList<>();


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstNameInstructor() {
        return firstNameInstructor;
    }

    public void setFirstNameInstructor(String firstNameInstructor) {
        this.firstNameInstructor = firstNameInstructor;
    }

    public String getLastNameInstructor() {
        return lastNameInstructor;
    }

    public void setLastNameInstructor(String lastNameInstructor) {
        this.lastNameInstructor = lastNameInstructor;
    }

    public String getFullNameInstructor() {
        return fullNameInstructor;
    }

    public void setFullNameInstructor(String fullNameInstructor) {
        this.fullNameInstructor = fullNameInstructor;
    }




    public String getEmailInstructor() {
        return emailInstructor;
    }

    public void setEmailInstructor(String emailInstructor) {
        this.emailInstructor = emailInstructor;
    }

    public List<Activities> getActivitiesInstructor() {
        return activitiesInstructor;
    }

    public void setActivitiesInstructor(List<Activities> activitiesInstructor) {
        this.activitiesInstructor = activitiesInstructor;
    }

}

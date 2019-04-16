package pl.szkolamotocyklowa.app.Instructor;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.validator.constraints.Length;
import org.mindrot.jbcrypt.BCrypt;
import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.time.LocalDate;


@Entity
@Table(name = "INSTRUCTORS")
public class Instructor {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotEmpty(message = "Pole nie może być puste!")
    @Column(unique = true)
    @Length(min = 3, message = "Za mało znaków")
    private String loginInstructor;

    @NotEmpty(message = "Pole nie może być puste!")
    @Length(min = 2, message = "Za mało znaków")
    private String firstNameInstructor;

    @NotEmpty(message = "Pole nie może być puste!")
    @Length(min = 8, message = "Za mało znaków")
    private String password;

    @NotEmpty(message = "Pole nie może być puste!")
    @Length(min = 2, message = "Za mało znaków")
    private String lastNameInstructor;

    @NotEmpty(message = "Pole nie może być puste!")
    @Email(message = "Wpisz poprawny email!")
    @Column(unique = true)
    private String emailInstructor;

    @CreationTimestamp
    private LocalDate createdInstructor;

    @Transient
    private String fullNameInstructor;

    private String role = "instructor";

    private int enabled = 1;

//    @OneToMany(fetch = FetchType.EAGER)
//    private List<Activities> activitiesInstructor = new ArrayList<>();


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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getEmailInstructor() {
        return emailInstructor;
    }

    public void setEmailInstructor(String emailInstructor) {
        this.emailInstructor = emailInstructor;
    }

//    public List<Activities> getActivitiesInstructor() {
//        return activitiesInstructor;
//    }
//
//    public void setActivitiesInstructor(List<Activities> activitiesInstructor) {
//        this.activitiesInstructor = activitiesInstructor;
//    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = BCrypt.hashpw(password, BCrypt.gensalt());
    }

    public String getLoginInstructor() {
        return loginInstructor;
    }

    public void setLoginInstructor(String loginInstructor) {
        this.loginInstructor = loginInstructor;
    }

    public int getEnabled() {
        return enabled;
    }

    public void setEnabled(int enabled) {
        this.enabled = enabled;
    }

    public LocalDate getCreatedInstructor() {
        return createdInstructor;
    }

    public void setCreatedInstructor(LocalDate createdInstructor) {
        this.createdInstructor = createdInstructor;
    }
}

package pl.szkolamotocyklowa.app.User;



import org.hibernate.annotations.CreationTimestamp;
import org.mindrot.jbcrypt.BCrypt;


import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.time.LocalDate;



@Entity
public class User {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @NotBlank
    @Column(unique = true)
    @Size(min = 4)
    private String username;

    @NotBlank
    @Size(min = 4)
    private String firstName;

    @NotBlank
    @Size(min = 4)
    private String lastName;

    @NotBlank
    private String password;

    @NotEmpty
    @Email
    @Column(unique = true)
    private String email;


    private int enabled = 1;

    @CreationTimestamp
    private LocalDate created;

    @Transient
    private String fullName;

    private String role = "user";

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    //    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//    private List<Activities> activities;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return firstName + " " + lastName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public LocalDate getCreated() {
        return created;
    }

    public void setCreated(LocalDate created) {
        this.created = created;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = BCrypt.hashpw(password, BCrypt.gensalt());
    }

//    public List<Activities> getActivities() {
//        return activities;
//    }
//
//    public void setActivities(List<Activities> activities) {
//        this.activities = activities;
//    }

    public int getEnabled() {

        return enabled;
    }

    public void setEnabled(int enabled) {

        this.enabled = enabled;

    }




}

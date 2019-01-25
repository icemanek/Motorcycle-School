package pl.szkolamotocyklowa.app.activities;

import org.hibernate.annotations.CreationTimestamp;
import pl.szkolamotocyklowa.app.User.User;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Date;

@Entity
@Table(name = "ACTIVITIES")
public class Activities {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String title;

    @Temporal(TemporalType.DATE)
    @CreationTimestamp
    private Date dateActivity;

    @ManyToOne
    private User user;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDateActivity() {
        return dateActivity;
    }

    public void setDateActivity(Date dateActivity) {
        this.dateActivity = dateActivity;
    }

//    public User getUser() {
//        return user;
//    }
//
//    public void setUser(User user) {
//        this.user = user;
//    }

    public Activities() {
    }

    public Activities(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        return title;
    }


}

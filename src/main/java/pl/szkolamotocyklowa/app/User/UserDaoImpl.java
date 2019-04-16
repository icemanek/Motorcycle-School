package pl.szkolamotocyklowa.app.User;

import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void createUser(User user){

        entityManager.persist(user);
    }


    @Override
    public void deleteUser(Long id){

        User user = showUser(id);

        if(user != null){

            entityManager.remove(user);
        }
    }


    @Override
    public void updateUser(User user){

        entityManager.merge(user);
    }

    @Override
    public User showUser(Long id){

        return entityManager.find(User.class,id);
    }

    @Override
    public List<User> findAll(){

        Query findAllUsers = entityManager.createQuery("SELECT u from User u");

        return findAllUsers.getResultList();
    }

}

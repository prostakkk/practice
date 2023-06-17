package org.example.dao.implement;

import org.example.dao.UserDao;
import org.example.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    private SessionFactory sessionFactory;

    @Autowired
    public UserDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public User getUserById(int idUser) {
        Session currentSession = sessionFactory.getCurrentSession();

        return null;
    }

    @Override
    public List<User> getAllUsers() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<User> query =
                currentSession.createQuery ("from User", User.class);
        List<User> users = query.getResultList();
        return users;
    }

    @Override
    public void saveUser(User user) {

    }

    @Override
    public void deleteUser(int id) {

    }
}

package org.example.services.implement;

import jakarta.transaction.Transactional;
import org.example.dao.UserDao;
import org.example.entities.User;
import org.example.services.UserService;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    private final SessionFactory sessionFactory;
    private final UserDao userDao;

    @Autowired
    public UserServiceImpl(SessionFactory sessionFactory, UserDao userDao) {
        this.sessionFactory = sessionFactory;
        this.userDao = userDao;
    }



    @Override
    @Transactional
    public List<User> getUsers() {
        return userDao.getAllUsers();
    }

    @Override
    @Transactional
    public User getUser(int id) {
        return null;
    }

    @Override
    @Transactional
    public void deleteUser(int id) {

    }

    @Override
    @Transactional
    public void saveUser(User user) {

    }


}

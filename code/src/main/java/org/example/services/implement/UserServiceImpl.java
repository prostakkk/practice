package org.example.services.implement;

import org.example.dao.UserDao;
import org.example.entities.User;
import org.example.services.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {


    private final UserDao userDao;

    @Autowired
    public UserServiceImpl( UserDao userDao) {

        this.userDao = userDao;
    }



    @Override

    public List<User> getUsers() {
        return userDao.getAllUsers();
    }

    @Override

    public User getUser(int id) {
        return null;
    }

    @Override

    public void deleteUser(int id) {

    }

    @Override

    public void saveUser(User user) {

    }


}

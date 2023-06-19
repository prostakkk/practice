package org.example.dao.implement;

import org.example.dao.UserDao;
import org.example.entities.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {


    @Override
    public User getUserById(int idUser) {

        return null;
    }

    @Override
    public List<User> getAllUsers() {

        return null;
    }

    @Override
    public void saveUser(User user) {

    }

    @Override
    public void deleteUser(int id) {

    }
}

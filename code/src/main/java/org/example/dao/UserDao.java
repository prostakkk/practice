package org.example.dao;

import org.example.entities.User;

import java.util.List;

public interface UserDao {

    User getUserById(int idUser);
    List<User> getAllUsers();
    void saveUser(User user);
    void deleteUser(int id);

    /*
    getUserByUsername(username)
    isEnabledUser(id)
    void setEnabled(id)
     */
}

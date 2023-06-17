package org.example.services;

import org.example.entities.User;

import java.util.List;

public interface UserService {

    public List<User> getUsers();
    public User getUser(int id);
    void deleteUser(int id);
    void saveUser(User user);
}

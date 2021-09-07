package com.babai.spring_boot.service;


import com.babai.spring_boot.model.User;

import java.util.List;

public interface UserService {

    List<User> getAllUsers();
    void addUser(User user);
    void saveUser(User user);
    User getUserById(Long id);
    void deleteUserById(Long id);
}

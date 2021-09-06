package com.babai.spring_boot.dao;

import com.babai.spring_boot.model.User;
import java.util.List;

public interface UserDao {

    List<User> getAll();
    void add (User user, List<Long> id);
    void save(User user, List<Long> id);
    User getUserById(Long id);
    void delete(Long id);
    User getUserByName(String name);
}

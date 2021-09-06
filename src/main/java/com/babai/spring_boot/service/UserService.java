package com.babai.spring_boot.service;

import com.babai.spring_boot.model.User;
import java.util.List;

public interface UserService {

    List<User> getAll();
    void add (User user, List<Long> id);
    void save(User user, List<Long> id);
    User getUserById(Long id);
    void delete(Long id);
}

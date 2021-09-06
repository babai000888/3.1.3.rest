package com.babai.spring_boot.dao.impl;

import com.babai.spring_boot.dao.UserDao;
import com.babai.spring_boot.model.User;
import com.babai.spring_boot.repository.RoleRepository;
import com.babai.spring_boot.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import java.util.List;


@Component
public class UserDaoImpJPA implements UserDao {

    @Autowired
    UserRepository userRepository;

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public List<User> getAll() {
        return userRepository.getAllByIdIsNotNull();
    }

    @Override
    public void add (User user, List<Long> id) {
        if (getUserByName(user.getName()) != null) {
            System.out.println("Duplication of user: "+ user);
            return;
        }
        save(user, id);
    }

    @Autowired
    RoleDaoImpJPA roleDaoImpJPA;
    @Override
    public void save (User user, List<Long> id) {
        if(id != null) {
            for (Long roleId : id) {
                user.addRole(roleDaoImpJPA.getRoleById(roleId));
            }
        }
        userRepository.save(encodePassword(user));
    }

    @Override
    public User getUserById(Long id) {
        return userRepository.getUserByIdOrId(id,id).orElse(null);
    }

    @Override
    public void delete(Long id) {
        userRepository.deleteById(id);
    }

    @Override
    public User getUserByName(String name) {
        return userRepository.findUserByName(name).orElse(null);
    }

    private User encodePassword(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        return user;
    }


}

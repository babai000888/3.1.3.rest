package com.babai.spring_boot.service.impl;


import com.babai.spring_boot.model.User;
import com.babai.spring_boot.repository.UserRepository;
import com.babai.spring_boot.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    @Override
    public List<User> getAllUsers() { return userRepository.findAll(); }

    @Override
    public void addUser(User user) {
        if (userRepository.findUserByName(user.getName()).orElse(null) != null) {
            System.out.println("Duplication of user: "+ user);
            return;
        }
        saveUser(user);
    }


    private final PasswordEncoder passwordEncoder;

    private User encodePassword(User user) {
        if(user.getId() == null || !user.getPassword().equals(userRepository.findById(user.getId()).orElse(null).getPassword())) {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
        }
        return user;
    }

    @Override
    public void saveUser(User user) { userRepository.save(encodePassword(user)); }

    @Override
    public User getUserById(Long id) { return userRepository.findById(id).orElse(null); }

    @Override
    public void deleteUserById(Long id) { userRepository.deleteById(id); }
}

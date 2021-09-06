package com.babai.spring_boot.security.custom;

import com.babai.spring_boot.model.User;
import com.babai.spring_boot.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.Optional;

@Service("userDetailsService")
@Transactional
public class MyUserDetailsService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<User> userOpt = userRepository.findUserByName(username);
        if (userOpt.isEmpty()) {
            throw new UsernameNotFoundException("Username not found");
        }
        User user = userOpt.get();
        return new org.springframework.security.core.userdetails.User(
                user.getName(), user.getPassword(), user.isEnabled(), true, true,
                true, user.getAuthorities());
    }
}
package com.babai.spring_boot.repository;

import com.babai.spring_boot.model.User;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{

    @EntityGraph(value = "User.roles")
    Optional<User> findUserByName (String name);
    @EntityGraph(value = "User.roles")
    List<User> findAll();
    @EntityGraph(value = "User.roles")
    Optional<User> findById(Long Id);
}

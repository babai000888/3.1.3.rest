package com.babai.spring_boot.model;

import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
@ToString
@Entity
@NamedEntityGraph(name = "User.roles", attributeNodes = @NamedAttributeNode("roles"))
public class User implements UserDetails {
    @Id
    @GeneratedValue
    private Long id;
    @Column(unique=true)
    private String name; // уникальное значение
    @Column(nullable=false)
    private String password;
    private String lastName;
    private int age;
    private String email;
    @ManyToMany
    @JoinTable(
            name = "users_roles",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() { return roles; }

    @Override
    public String getPassword() { return password; }

    @Override
    public String getUsername() { return name; }

    @Override
    public boolean isAccountNonExpired() { return true; }

    @Override
    public boolean isAccountNonLocked() { return true; }

    @Override
    public boolean isCredentialsNonExpired() { return true; }

    @Override
    public boolean isEnabled() { return true; }

    public void addRole(Role role) {
        if(this.roles ==null) { this.roles = new HashSet<>(); }
        this.roles.add(role);
    }
}

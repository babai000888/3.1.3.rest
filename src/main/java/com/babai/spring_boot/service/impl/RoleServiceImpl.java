package com.babai.spring_boot.service.impl;


import com.babai.spring_boot.model.Role;
import com.babai.spring_boot.repository.RoleRepository;
import com.babai.spring_boot.service.RoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
public class RoleServiceImpl implements RoleService {

    private final RoleRepository roleRepository;

    @Override
    public List<Role> getAllRoles() { return roleRepository.findAll(); }
    @Override
    public Role getRoleById(Long id) { return roleRepository.findById(id).orElse(null); }
    @Override
    public void deleteRoleById(Long id) { roleRepository.deleteById(id); }
    @Override
    public Role getRoleByName(String role) { return roleRepository.findByRole(role).orElse(null); }
    @Override
    public void addRoleByName(String role) {
        if (getRoleByName(role) != null) {
            System.out.println("Duplication of role: "+ role);
            return;
        }
        roleRepository.save(new Role(role));
    }
}

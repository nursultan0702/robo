package com.robo.robo.repository;

import com.robo.robo.model.Role;
import com.robo.robo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Set;

public interface UserRepository extends JpaRepository<User,Long> {
   User findByUsername(String username);
   List<User> findByRoles(Set<Role> roles);
}

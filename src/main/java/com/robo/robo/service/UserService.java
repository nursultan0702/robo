package com.robo.robo.service;

import com.robo.robo.model.Role;
import com.robo.robo.model.User;
import com.robo.robo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByUsername(username);
    }

    public User getByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public List<User> getByRole(Role teacher) {
        return userRepository.findByRoles(Collections.singleton(teacher));
    }

    public boolean existsByUsername(String admin) {
        User user = userRepository.findByUsername(admin);
        if(user!=null){
            return true;
        }
        return false;
    }

    public void save(User user) {
        userRepository.save(user);
    }

    public void delete(User user) {
        user.setActive(false);
        userRepository.save(user);
    }
}

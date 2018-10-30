package com.robo.robo.controllers;

import com.robo.robo.model.Role;
import com.robo.robo.model.User;
import com.robo.robo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepository userRepository;
    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }
    @PostMapping("/registration")
    public String addUser(User user, Map<String,Object> model){
        User userFromDb = userRepository.findByUsername(user.getUsername());
        Set<Role> roleSet = new HashSet<>();
        roleSet.add(Role.USER);
        if(userFromDb != null) {
            model.put("message","User exist!");
            return "registration";
        }
        user.setActive(true);
        user.setRoles(roleSet);
        userRepository.save(user);
        return "redirect:/login";
    }
}

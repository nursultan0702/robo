package com.robo.robo.controllers;

import com.robo.robo.model.Role;
import com.robo.robo.model.User;
import com.robo.robo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@PreAuthorize("hasAuthority('ADMIN') ")
public class RegistrationController {
    @Autowired
    private UserRepository userRepository;
    @Value("${upload.image.path}")
    private String path;
    @GetMapping("/registration")
    public String registration(Model model){

        model.addAttribute("roles", Role.values());
        return "registration";
    }
    @PostMapping("/registration")
    public String addUser(@RequestParam("image") MultipartFile file,
                          @RequestParam String username,
                          @RequestParam String firstname,
                          @RequestParam String secondname,
                          @RequestParam String middlename,
                          @RequestParam String password,
                          Model model,
                          @RequestParam Map<String,String> form) throws IOException {
        User userFromDb = userRepository.findByUsername(username);
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        if(userFromDb != null) {
            model.addAttribute("message","User exist!");
            return "registration";
        }
        User user = new User();
        user.setActive(true);
        user.setUsername(username);
        user.setFirstname(firstname);
        user.setMiddlename(middlename);
        user.setSecondname(secondname);
        user.setPassword(bCryptPasswordEncoder.encode(password));
        if(file != null && !file.getOriginalFilename().isEmpty()){
            File uploadDir = new File(path);
            if(!uploadDir.exists() && !file.getOriginalFilename().isEmpty()) {
                uploadDir.mkdir();
            }
            String  uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(path + "/" + resultFileName));
            user.setImage(resultFileName);

        }
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.setRoles(new HashSet<Role>());
        for (String key  : form.keySet()) {
            if(roles.contains(key))
                user.getRoles().add(Role.valueOf(key));
        }
        userRepository.save(user);
        return "redirect:/registration";
    }
}

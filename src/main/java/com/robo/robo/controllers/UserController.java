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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserRepository userRepository;
    @Value("${upload.image.path}")
    private String path;

    @PreAuthorize("hasAuthority('ADMIN') ")
    @GetMapping
    public String userList(Model model){
        model.addAttribute("users",userRepository.findAll());
        return "userList";
    }

    @GetMapping("/profile")
    public String profile(){
        return "profile";
    }
    @PreAuthorize("hasAuthority('ADMIN') ")
    @GetMapping("{id}")
    public String userEditForm(@PathVariable("id") User user, Model model ){
        model.addAttribute("edituser",user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PostMapping
    public String userSave(@RequestParam("image") MultipartFile file,
                           @RequestParam String username,
                           @RequestParam String firstname,
                           @RequestParam String secondname,
                           @RequestParam String middlename,
                           @RequestParam String password,
                           @RequestParam(required = false, defaultValue = "non") String profession,
                           @RequestParam("userId") User user,
                           Model model,
                           @RequestParam Map<String,String> form,
                           Principal principal
    ) throws IOException {
        User requestUser = userRepository.findByUsername(principal.getName());
        if(requestUser.getRoles().contains(Role.ADMIN)|| requestUser == user){
            BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
            user.setActive(true);
            user.setUsername(username);
            user.setFirstname(firstname);
            user.setMiddlename(middlename);
            user.setSecondname(secondname);
            user.setUsername(username);
            user.setProfession(profession);
            if(form.containsKey("changePassword"))
                user.setPassword(bCryptPasswordEncoder.encode(password));

            if(file != null && !file.getOriginalFilename().isEmpty()){
                File uploadDir = new File(path);
                if(!uploadDir.exists() && !file.getOriginalFilename().isEmpty()) {
                    uploadDir.mkdir();
                }
                String  uuidFile = UUID.randomUUID().toString();
                String resultFileName = uuidFile + "." + file.getOriginalFilename();
                file.transferTo(new File(path + "/" + resultFileName));
                user.setImage("/img/" + resultFileName);

            }
            if(requestUser.getRoles().contains(Role.ADMIN) && form.containsKey("isEdit")) {
                Set<String> roles = Arrays.stream(Role.values())
                        .map(Role::name)
                        .collect(Collectors.toSet());
                user.getRoles().clear();
                for (String key : form.keySet()) {
                    if (roles.contains(key))
                        user.getRoles().add(Role.valueOf(key));
                }
                userRepository.save(user);
                return "redirect:/user";
            }

        }
        userRepository.save(user);
        return "redirect:/user/profile";
    }


}

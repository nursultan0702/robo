package com.robo.robo.config;

import com.robo.robo.model.Role;
import com.robo.robo.model.User;
import com.robo.robo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.annotation.PostConstruct;
import java.util.Collections;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserService userService;
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                    .authorizeRequests()
                    .antMatchers("/","/news","/course/","/static/**","/task/static/**","/course/static/**","/user/static/**","/img/**","/news/single-news/**"
                    ,"/news/like/**").permitAll()
                    .anyRequest().authenticated()
                .and()
                    .formLogin()
                .defaultSuccessUrl("/",true)
                    .loginPage("/login")
                    .permitAll()
                .and()
                    .logout()
                    .permitAll();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService)
                .passwordEncoder(getBCryptPasswordEncoder());
    }

    @Bean
    public BCryptPasswordEncoder getBCryptPasswordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @PostConstruct
    public void setupAdminUser() {
        if (!userService.existsByUsername("admin@admin.kz")) {
            User user = new User();
            user.setUsername("admin@admin.kz");
            user.setFirstname("Admin");
            user.setSecondname("Admin");
            user.setMiddlename("Admin");
            user.setImage("/img/p1.png");
            user.setRoles(Collections.singleton(Role.ADMIN));
            String password = "admin";
            user.setPassword(password);
            user.setPassword(getBCryptPasswordEncoder().encode(password));
            userService.save(user);
        }
    }
}

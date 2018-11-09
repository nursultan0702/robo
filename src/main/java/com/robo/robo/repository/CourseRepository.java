package com.robo.robo.repository;

import com.robo.robo.model.Course;
import com.robo.robo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CourseRepository extends JpaRepository<Course,Long> {
    List<Course> findByStudent(User user);
    List<Course> findByTeacher(User user);
}

package com.robo.robo.repository;

import com.robo.robo.model.Course;
import com.robo.robo.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TaskRepository extends JpaRepository<Task,Long> {
    List<Task> findByCourse(Course course);
    List<Task> findByTaskName(String taskName);
}

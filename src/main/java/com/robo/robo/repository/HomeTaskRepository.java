package com.robo.robo.repository;

import com.robo.robo.model.HomeTask;
import com.robo.robo.model.Task;
import com.robo.robo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HomeTaskRepository extends JpaRepository<HomeTask,Long> {
    List<HomeTask> findByTask(Task task);
    HomeTask findByTaskAndStudent(Task task, User student);
    List<HomeTask> findByStudent(User user);
}

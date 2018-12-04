package com.robo.robo.model;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "course")
@Data
public class Course {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private String about;
    private String img;
    private Integer price;
    private Integer hours;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "teacher_id")
    private User teacher;
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "student_id")
    private List<User> students;
}

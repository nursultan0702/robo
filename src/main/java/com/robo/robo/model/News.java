package com.robo.robo.model;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "news")
@Data
public class News {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;
    private String title;
    @Column(length = 1000)
    private String text;
    @Column(length = 500)
    private String shortText;
    private String imgName;
    private String date;
    private Integer likes;
}

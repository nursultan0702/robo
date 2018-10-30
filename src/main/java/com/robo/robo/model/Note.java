package com.robo.robo.model;

import lombok.Data;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "notes")
@Data
public class Note {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String date;
    private boolean unread;
    private String authorName;
    private String authorEmail;
    private String authorPhoneNumber;
    private String text;
}

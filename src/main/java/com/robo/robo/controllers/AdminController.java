package com.robo.robo.controllers;

import com.robo.robo.model.Note;
import com.robo.robo.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.Map;

@Controller
public class AdminController {
    @Autowired
    private NoteService noteService;

    @GetMapping("/admin")
    public String admin(){
        return "admin";
    }

    @GetMapping("/get-new-notes")
    public String  getUnreadNotes(Map<String,Object> model){
        List<Note> noteList = noteService.getUnreadNotes();
        model.put("notes",noteList);
        return "admin";
    }
    @PostMapping("/mark-done")
    public String markAsRead(Long id){
       Note note = noteService.getNoteById(id);
       note.setUnread(false);
       noteService.saveNote(note);
       return "admin";
    }
}

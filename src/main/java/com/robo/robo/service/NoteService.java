package com.robo.robo.service;

import com.robo.robo.model.Note;
import com.robo.robo.repository.NoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoteService {
    @Autowired
    private NoteRepository noteRepository;

    public List<Note> getUnreadNotes(){
        return noteRepository.findByUnread(true);
    }
    public Note getNoteById(Long id){
        return noteRepository.getOne(id);
    }
    public void saveNote(Note note){
        noteRepository.save(note);
    }
}

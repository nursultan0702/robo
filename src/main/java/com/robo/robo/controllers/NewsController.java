package com.robo.robo.controllers;

import com.robo.robo.model.News;
import com.robo.robo.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/news")
public class NewsController {
    @Autowired
    private NewsService newsService;

    @GetMapping
    public String news(Model model){
       List<News> newsList = newsService.getNewsList();
       model.addAttribute("newsList",newsList);
        return "news";
    }
    @GetMapping("/edit-news/{news}")
    public String editNews(@PathVariable News news,Model model){
        model.addAttribute("news",news);
        return "editnews";
    }

    @GetMapping("/add-news")
    public String addNews(){
        return "editnews";
    }

    @PostMapping("/save")
    public String saveNews(
            @RequestParam("text") String text,
            @RequestParam("title") String title,
            @RequestParam("image")MultipartFile image,
            @RequestParam("short") String shortText,
            Principal principal
            ) throws IOException {
        newsService.saveNews(shortText,text,title,image,principal);
        return "redirect:/news";
    }
    @PostMapping("/update")
    public String updateNews(
            @RequestParam("id") News news,
            @RequestParam("text") String text,
            @RequestParam("title") String title,
            @RequestParam("image")MultipartFile image,
            @RequestParam("short") String shortText,
            Principal principal
    ) throws IOException {
        newsService.updateNews(news,text,shortText,title,image,principal);
        return "redirect:/news";
    }

}

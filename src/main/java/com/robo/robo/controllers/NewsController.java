package com.robo.robo.controllers;

import com.robo.robo.model.News;
import com.robo.robo.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    @PostMapping("/save")
    public String saveNews(
            @RequestParam("text") String text,
            @RequestParam("title") String title,
            @RequestParam("image")MultipartFile image,
            Principal principal
            ) throws IOException {
        newsService.saveNews(text,title,image,principal);
        return "redirect:/news";
    }

}

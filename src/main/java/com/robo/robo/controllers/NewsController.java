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
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/news")
public class NewsController {
    @Autowired
    private NewsService newsService;

    @GetMapping
    public String news(Model model){
        if(newsService.getNewsList().size()>=3) {
            List<News> newsList = newsService.getNewsList();
            List<News> lNews = new ArrayList<>();
            lNews.add(newsList.get(newsList.size() - 1));
            lNews.add(newsList.get(newsList.size() - 2));
            lNews.add(newsList.get(newsList.size() - 3));
            model.addAttribute("newsList", newsList);
            model.addAttribute("lNewsList", lNews);
        }
        return "news";
    }
    @GetMapping("/edit-news/{news}")
    public String editNews(@PathVariable News news,Model model){
        model.addAttribute("news",news);
        return "editnews";
    }

    @GetMapping("/single-news/{news}")
    public String singleNews(@PathVariable News news,Model model){
        List<News> newsList = newsService.getNewsList();
        if(newsService.getNewsList().size()>=3) {
            List<News> lNews = new ArrayList<>();
            lNews.add(newsList.get(newsList.size() - 1));
            lNews.add(newsList.get(newsList.size() - 2));
            lNews.add(newsList.get(newsList.size() - 3));
            model.addAttribute("lNewsList", lNews);
        }
        model.addAttribute("news",news);
        return "single-news";
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
    @PostMapping("/delete/{news}")
    public String deleteNews(@PathVariable News news){
        newsService.delete(news);
        return "redirect:/news";
    }

    @GetMapping("/like/{news}")
    public void likeNews(@PathVariable News news){
        newsService.addLike(news);
    }

}

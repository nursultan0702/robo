package com.robo.robo.service;

import com.robo.robo.model.News;
import com.robo.robo.model.Task;
import com.robo.robo.model.User;
import com.robo.robo.repository.NewsRepository;
import com.robo.robo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

@Service
public class NewsService {
    @Autowired
    private NewsRepository newsRepository;
    @Autowired
    private UserService userService;
    @Value("${upload.image.path}")
    private String imgPath;

    public void saveNews(String shortText, String text, String title, MultipartFile image, Principal principal) throws IOException {
        News news = new News();
        User author = userService.getByUsername(principal.getName());
        if(image != null && !image.getOriginalFilename().isEmpty()){
            File uploadDir = new File(imgPath);

            if(!uploadDir.exists() && !image.getOriginalFilename().isEmpty()) {
                uploadDir.mkdir();
            }

            String  uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + image.getOriginalFilename();
            image.transferTo(new File(imgPath + "/" + resultFileName));
            news.setImgName("/img/" + resultFileName);
        }
        news.setTitle(title);
        news.setAuthor(author);
        news.setText(text);
        news.setShortText(shortText);
        newsRepository.save(news);
    }
    public void updateNews( News news, String shortText, String text, String title, MultipartFile image, Principal principal) throws IOException {
        User author = userService.getByUsername(principal.getName());
        if(image != null && !image.getOriginalFilename().isEmpty()){
            File uploadDir = new File(imgPath);

            if(!uploadDir.exists() && !image.getOriginalFilename().isEmpty()) {
                uploadDir.mkdir();
            }

            String  uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + image.getOriginalFilename();
            image.transferTo(new File(imgPath + "/" + resultFileName));
            news.setImgName("/img/" + resultFileName);
        }
        news.setTitle(title);
        news.setAuthor(author);
        news.setText(text);
        news.setShortText(shortText);
        newsRepository.save(news);
    }

    public List<News> getNewsList() {
        return newsRepository.findAll();
    }
}

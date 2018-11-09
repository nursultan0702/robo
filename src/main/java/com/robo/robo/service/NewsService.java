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

    public void saveNews(String text, String title, MultipartFile image, Principal principal) throws IOException {
        if(image != null){
            File uploadDir = new File(imgPath);
            User author = userService.getByUsername(principal.getName());

            if(!uploadDir.exists() && !image.getOriginalFilename().isEmpty()) {
                uploadDir.mkdir();
            }

            String  uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + image.getOriginalFilename();
            image.transferTo(new File(imgPath + "/" + resultFileName));
            News news = new News();
            news.setTitle(title);
            news.setAuthor(author);
            news.setImgName(resultFileName);
            news.setText(text);
            newsRepository.save(news);

        }
    }

    public List<News> getNewsList() {
        return newsRepository.findAll();
    }
}

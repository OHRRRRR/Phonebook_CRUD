package com.ureca.person.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 여기서 "/images/**" 는 웹 URL 경로이며, "file:/Users/HYERYEONG/uploads/"는 실제 파일 시스템 경로입니다.
        registry.addResourceHandler("/images/**").addResourceLocations("file:/Users/HYERYEONG/uploads/");
    }
}

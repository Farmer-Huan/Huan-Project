package com.farmer.huan.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
 
import com.farmer.huan.MainController;

@Configuration
@ComponentScan(basePackages = { "com.farmer.huan" })
@EnableWebMvc
public class AppConfig extends WebMvcConfigurerAdapter {
 
    @Bean
    public MainController mainController(){
        return new MainController();
    }
     
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // TODO Auto-generated method stub
    	// http://stackoverflow.com/questions/14386383/setting-resource-paths-programatically-in-spring-mvc
//    	super.addResourceHandlers(registry);
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
//        registry.addResourceHandler("/resources/images/**").addResourceLocations("/resources/images/");
        
    }
 
    @Bean
    public ViewResolver getViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }
 
}

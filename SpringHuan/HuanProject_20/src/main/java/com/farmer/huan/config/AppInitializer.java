package com.farmer.huan.config;

import javax.servlet.Filter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
 
public class AppInitializer extends
        AbstractAnnotationConfigDispatcherServletInitializer implements WebApplicationInitializer {
 
    @Override
    protected Class<?>[] getRootConfigClasses() {
        // TODO Auto-generated method stub
        return null;
    }
 
    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class<?>[] { AppConfig.class };
    }
 
    @Override
    protected Filter[] getServletFilters() {
        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceEncoding(true);
 
        return new Filter[] { characterEncodingFilter };
    }
     
    @Override
    protected String[] getServletMappings() {
        return new String[] { "/" };
    }

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		// TODO Auto-generated method stub
//		super.onStartup(servletContext);
//		AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
//	    rootContext.register(AppConfig.class);	// root config
//
//	    servletContext.addListener(new ContextLoaderListener(rootContext));
//
//	    AnnotationConfigWebApplicationContext dispatcherContext = new AnnotationConfigWebApplicationContext();
//	    dispatcherContext.register(AppConfig.class);	// dispatcher config
//
//	    Dynamic netskolaDispatcher = servletContext.addServlet(
//	        "dispatcher",
//	        new DispatcherServlet(dispatcherContext)
//	    );
//	    netskolaDispatcher.setLoadOnStartup(1);
//	    netskolaDispatcher.addMapping("/resources/*");
//	    netskolaDispatcher.addMapping("/resources/images/*");
	}
 
}

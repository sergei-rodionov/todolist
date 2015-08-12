package ru.sergeirodionov.todolist.configuration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.DispatcherType;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import java.util.EnumSet;

/**
 * Created by SergeiRodionov.ru on 07.08.2015.
 */
public class AppInitializer implements WebApplicationInitializer {


    public void onStartup(javax.servlet.ServletContext servletContext) throws ServletException {
        AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();


        // Config Application
        context.register(AppConfig.class);

        // Config Hibernate
        context.register(HibernateConfig.class);

        servletContext.addListener(new ContextLoaderListener(context));


        // filter
        servletContext.addFilter("FormEncodingSetterFilter", FormEncodingSetterFilter.class)
                //.addMappingForUrlPatterns(null,false, "/*");
                // add a mapping not only default DispatcherType.REQUEST, but for DispatcherType.FORWARD, etc.
                .addMappingForUrlPatterns(EnumSet.allOf(DispatcherType.class), false, "/*");


        context.setServletContext(servletContext);
        ServletRegistration.Dynamic servlet =
                servletContext.addServlet("dispatcher", new DispatcherServlet(context));

        servlet.setLoadOnStartup(1);
        servlet.addMapping("/");


    }
}
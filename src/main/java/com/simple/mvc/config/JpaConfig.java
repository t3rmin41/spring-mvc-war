package com.simple.mvc.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class JpaConfig {

    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory(){
        LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
        em.setDataSource(dataSource());
        em.setPackagesToScan(new String[] { "com.simple.mvc.jpa" });
   
        JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
        em.setJpaVendorAdapter(vendorAdapter);
        em.setJpaProperties(additionalProperties());
   
        return em;
     }
   
     @Bean
     public DataSource dataSource(){
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.postgresql.Driver");
        dataSource.setUrl("jdbc:postgresql://localhost:5432/users_db");
        dataSource.setUsername("postgres");
        dataSource.setPassword("postgres");
        return dataSource;
     }
   
     @Bean
     public JpaTransactionManager transactionManager() {
       JpaTransactionManager transactionManager = new JpaTransactionManager();
       transactionManager.setEntityManagerFactory(entityManagerFactory().getObject());
       return transactionManager;
     }

     @Bean
     public PersistenceExceptionTranslationPostProcessor exceptionTranslation(){
        return new PersistenceExceptionTranslationPostProcessor();
     }

     private Properties additionalProperties() {
         Properties properties = new Properties();
         //properties.setProperty("hibernate.hbm2ddl.auto", "update");
         properties.setProperty("hibernate.hbm2ddl.auto", "create-drop");
         //properties.setProperty("hibernate.hbm2ddl.auto", "update-none");
         properties.setProperty("hibernate.hbm2ddl.import_files", "users.sql");
         properties.setProperty("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
         properties.setProperty("show-sql", "true");
         return properties;
      }

}

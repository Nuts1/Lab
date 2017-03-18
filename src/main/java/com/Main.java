package com;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.event.AbstractAuthenticationEvent;
import org.springframework.security.authentication.event.InteractiveAuthenticationSuccessEvent;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.logging.Logger;

@SpringBootApplication(exclude = {SpringDataWebAutoConfiguration.class})
public class Main extends SpringBootServletInitializer {
    static Logger logger = Logger.getLogger(String.valueOf(Main.class));

    public static void main(String[] args) {
        SpringApplication.run(Main.class, args);
    }

    @Override
    protected final SpringApplicationBuilder configure(final SpringApplicationBuilder application) {
        return application.sources(Main.class);
    }

    @Configuration
    protected class DatabaseConfig {
        @Bean
        @Primary
        @ConfigurationProperties(prefix = "spring.datasource")
        public DataSource dataSource() {
            return DataSourceBuilder.create().build();
        }
    }

    @Configuration
    @Order(SecurityProperties.ACCESS_OVERRIDE_ORDER)
    protected static class SecurityConfiguration extends WebSecurityConfigurerAdapter {
        @Autowired
        DataSource dataSource;

        @Override
        protected void configure(HttpSecurity http) throws Exception {
            http
                    .csrf().disable()
                    .httpBasic()
                    .and()
                    .authorizeRequests()
                    .antMatchers("/book/**").permitAll()
                    .antMatchers("/image/**").permitAll()
                    .antMatchers("/admin/**").hasRole("ADMIN")
                    .antMatchers("/admin").hasRole("ADMIN")
                    .antMatchers("/api/**").permitAll()
                    .antMatchers("/index.html").hasRole("ADMIN")
                    .anyRequest()
                    .authenticated()
                    .and()
                    .formLogin()
                    .loginPage("/login.html")
                    .loginProcessingUrl("/j_spring_security_check")
                    .passwordParameter("password")
                    .usernameParameter("email")
                    .defaultSuccessUrl("/")
                    .failureForwardUrl("/errorLogin")
                    .permitAll()
                    .and()
                    .logout().permitAll();
        }

        @Bean
        public PasswordEncoder passwordEncoder() {
            return new BCryptPasswordEncoder(11);
        }

        @Autowired
        public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
            auth.jdbcAuthentication()
                    .dataSource(dataSource)
                    .passwordEncoder(passwordEncoder())
                    .usersByUsernameQuery(
                            "select email, password, 'true' from public.user where email=?")
                    .authoritiesByUsernameQuery(
                            "SELECT u.email, r.role " +
                                    "FROM public.user u, role r " +
                                    "WHERE u.role_id = r.role_id AND u.email=?");
        }
    }

    @Component
    private static class AuthenticationEventListener implements ApplicationListener<AbstractAuthenticationEvent> {

        @Override
        public void onApplicationEvent(AbstractAuthenticationEvent authenticationEvent) {
            if (authenticationEvent instanceof InteractiveAuthenticationSuccessEvent) {
                return;
            }
            Authentication authentication = authenticationEvent.getAuthentication();
            String auditMessage = "Login attempt with username: " + authentication.getName() + "\t\tSuccess: " + authentication.isAuthenticated();
            logger.info(auditMessage);
        }

    }
}

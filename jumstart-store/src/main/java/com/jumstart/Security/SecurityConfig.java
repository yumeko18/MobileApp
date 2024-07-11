package com.jumstart.Security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public UserDetailsService userDetailsService() {
        return new UserDetailsServiceImpl();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    	System.out.println("At Authen configure");
        auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
 
    	System.out.println("At Security configure");
        http
                .formLogin()
                    .loginPage("/login")
                    .loginProcessingUrl("/login")
                    .failureUrl("/login_error")
                    .permitAll()
                    .defaultSuccessUrl("/products", true)
                .and()
                .csrf()
                .and()
                .authorizeRequests()
                    .antMatchers("/").permitAll()
                    .antMatchers("/css/**").permitAll()
                    .antMatchers("/images/**").permitAll()
                    .antMatchers("/js/**").permitAll()
                    .antMatchers(HttpMethod.GET, "/favicon.*").permitAll()
                    .antMatchers(HttpMethod.GET, "/login").permitAll()
                    .antMatchers(HttpMethod.GET, "/products").hasAnyRole("Users","Administrator","Partner")
//                    .antMatchers(HttpMethod.GET, "/profile").hasAnyRole("Users","Administrator","Partner","Riders","Donators")
                    .antMatchers(HttpMethod.GET, "/product_post").hasAnyRole("Partner","Administrator")
                    .antMatchers(HttpMethod.GET, "/all_product").hasAnyRole("Partner","Administrator")
                    .antMatchers(HttpMethod.GET, "/users").hasRole("Administrator")
                    .antMatchers(HttpMethod.GET, "/view").hasRole("Administrator")
                    .antMatchers(HttpMethod.POST, "/edit").hasRole("Administrator")
                    .antMatchers(HttpMethod.GET, "/delete").hasRole("Administrator")
                    .antMatchers(HttpMethod.GET, "/all_riders").hasRole("Administrator")
                    .antMatchers(HttpMethod.GET, "/all_meal").hasAnyRole("Administrator","Partner")
                    .antMatchers(HttpMethod.GET, "/donate").hasAnyRole("Users","Donators")
                    .antMatchers(HttpMethod.GET, "/rider_form").hasRole("Users")
                    .antMatchers(HttpMethod.GET, "/all_orders").hasAnyRole("Administrator","Partner","Riders")
                    .antMatchers(HttpMethod.POST, "/edit_meal").hasAnyRole("Administrator","Partner")
                    .antMatchers(HttpMethod.GET, "/delete_meal").hasAnyRole("Administrator","Partner")
                    .antMatchers(HttpMethod.GET, "/deleteMeal").hasRole("Users")
                .and()
                .logout()
                    .logoutSuccessUrl("/login")
                    .invalidateHttpSession(true);
                  
    }
}

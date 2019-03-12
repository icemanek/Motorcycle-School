package pl.szkolamotocyklowa.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;


    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery("SELECT username, password, enabled FROM User where username=?")
                .authoritiesByUsernameQuery("SELECT username, password, enabled FROM User where username=?");

        auth.inMemoryAuthentication().withUser("emil").password(passwordEncoder().encode("emilPass")).roles("admin");

    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.
    authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/login/**").hasRole("USER").and()
                .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/spring_security_check")
                .usernameParameter("username")
                .passwordParameter("password")
                .permitAll();


        http.logout().logoutSuccessUrl("/");
    }
}

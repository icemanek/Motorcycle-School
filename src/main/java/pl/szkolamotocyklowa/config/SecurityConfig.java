package pl.szkolamotocyklowa.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import pl.szkolamotocyklowa.app.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {


    private DataSource dataSource;

    @Autowired
    private void DataSource(DataSource dataSource){
        this.dataSource = dataSource;
    }


    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery("SELECT username, password, enabled FROM user where username=?")
                .authoritiesByUsernameQuery("SELECT username, password, enabled FROM user where username=?");

        auth.inMemoryAuthentication().withUser("emil").password(passwordEncoder().encode("emilPass")).roles("admin");

    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/confirm-account*").permitAll()
                .antMatchers("/login/**").hasRole("USER").and()
                .formLogin()
                .loginPage("/login").permitAll()
                .loginProcessingUrl("/spring_security_check")
                .usernameParameter("username")
                .passwordParameter("password")
                .permitAll().and()
                .rememberMe().tokenValiditySeconds(24 * 60 * 60)
                .tokenRepository(persistentTokenRepository());

        http.logout().logoutSuccessUrl("/").deleteCookies("JSESSIONID");
    }


    @Bean
    public PersistentTokenRepository persistentTokenRepository() {
        JdbcTokenRepositoryImpl tokenRepository = new JdbcTokenRepositoryImpl();
        tokenRepository.setDataSource(dataSource);
        return tokenRepository;
    }


}
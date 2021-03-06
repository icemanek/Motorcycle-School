package pl.szkolamotocyklowa.config;


import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

@Configuration
@EnableScheduling
@ComponentScan({ "pl.szkolamotocyklowa" })
public class SpringTaskConfig {

}

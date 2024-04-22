package com.csdlpt.CSDLPT.Configuration;

import com.csdlpt.CSDLPT.Validators.UserLoginValidator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class UserLoginConfig {
    @Bean
    public UserLoginValidator validator() {
        return new UserLoginValidator();
    }
}

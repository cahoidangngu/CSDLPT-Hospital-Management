package com.csdlpt.CSDLPT.Validators;

import com.csdlpt.CSDLPT.Models.UserLogin;
import org.thymeleaf.util.StringUtils;

import java.util.Optional;

public class UserLoginValidator {

        public boolean isValid(UserLogin userLogin) {
            return Optional.ofNullable(userLogin)
                    .filter(t -> !StringUtils.isEmpty(t.getUsername())) // Kiểm tra title khác rỗng
                    .filter(t -> !StringUtils.isEmpty(t.getPassword())) // Kiểm tra detail khác rỗng
                    .isPresent(); // Trả về true nếu hợp lệ, ngược lại false
        }
}

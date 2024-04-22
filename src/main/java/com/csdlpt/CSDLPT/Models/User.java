package com.csdlpt.CSDLPT.Models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private String id;
    private String name;
    private String address;
    private String degree;
    private String phone;
    private String departmentId;
    private String dob;
    private String gender;
    private String role;
}

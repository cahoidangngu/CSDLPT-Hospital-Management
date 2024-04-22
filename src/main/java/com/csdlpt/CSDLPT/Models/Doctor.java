package com.csdlpt.CSDLPT.Models;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Doctor{
    private String id;
    private String name;
    private String address;
    private String degree;
    private String phone;
    private String departmentId;
    private String role;
    private String location;
}

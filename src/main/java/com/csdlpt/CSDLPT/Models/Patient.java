package com.csdlpt.CSDLPT.Models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Patient{
    private String id;
    private String name;
    private String address;
    private String phone;
    private String departmentId;
    private String dob;
    private String gender;
    private String role;
    private String location;
}

package com.csdlpt.CSDLPT.Models;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PatientResult {
    private String description;
    private String result;
    private Double price;
}

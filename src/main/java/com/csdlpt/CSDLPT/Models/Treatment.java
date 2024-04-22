package com.csdlpt.CSDLPT.Models;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Treatment {
    private String id;
    private String name;
    private String description;
}

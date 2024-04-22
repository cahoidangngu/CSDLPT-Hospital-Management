package com.csdlpt.CSDLPT.Models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PatientCount {
    private String id;
    private String name;
    private Long numberPatient;
}

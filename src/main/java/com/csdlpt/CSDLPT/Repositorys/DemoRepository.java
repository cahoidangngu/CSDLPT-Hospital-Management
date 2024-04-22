package com.csdlpt.CSDLPT.Repositorys;

import com.csdlpt.CSDLPT.Models.*;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.print.Doc;
import java.util.List;

@Repository
@Slf4j
public class DemoRepository {


    Logger logger = LoggerFactory.getLogger(DemoRepository.class);

    @Autowired
    private JdbcTemplate jdbcTemplate;


    public List<PatientCount> getSumOfPatients() {
        String sql = "EXEC SumOfPatients";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(PatientCount.class));
    }

    public User userLogin(String username, String password, String role, String location) {
        String sql = "EXEC user_login '" + role + "','" + location + "', '" + username + "', '" + password + "'";
        List<User> result = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(User.class));
        return !result.isEmpty() ? result.get(0) : null;
    }

    public Patient updatePatient( String location, String patientId,
                               String name,
                               String address,
                               String phone,
                               String departmentId,
                               String dob,
                               String gender) {
        String sql = "EXEC update_patient_location '" + location + "', '" + patientId + "','" + name + "', '" + address + "', '" + phone + "','" + departmentId + "', '" + dob + "', '" + gender + "'";
        List<Patient> result = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Patient.class));
        return !result.isEmpty() ? result.get(0) : null;
    }

    public Doctor updateDoctor( String location, String doctorId,
                                  String name,
                                  String address,
                                  String phone,
                                  String departmentId,
                                  String degree) {
        String sql = "EXEC update_doctor_location '" + location + "', '" + doctorId + "','" + name + "', '" + address + "', '" + degree + "','" + phone + "', '" + departmentId + "'";
        List<Doctor> result = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Doctor.class));
        return !result.isEmpty() ? result.get(0) : null;
    }



    public List<PatientResult> getPatientResults(String patientId, String location) {
        String sql = "EXEC patient_result '" + location + "', '" + patientId + "'";
        List<PatientResult> results = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(PatientResult.class));
        return !results.isEmpty() ? results : null;
    }

    public List<Patient> doctorPatient(String location, String id, String patientId) {
        String sql = "EXEC doctor_patient '" + location + "', '" + id + "', '"+patientId +"'";
        List<Patient> results = jdbcTemplate.query(sql,BeanPropertyRowMapper.newInstance(Patient.class));
        return !results.isEmpty() ? results : null;
    }

    public List<Patient> adminPatient(String location, String patientId) {
        String sql = "EXEC admin_patient '" + location + "', '"+patientId +"'";
        List<Patient> results = jdbcTemplate.query(sql,BeanPropertyRowMapper.newInstance(Patient.class));
        return !results.isEmpty() ? results : null;
    }

    public List<Doctor> adminDoctor(String location, String doctorId) {
        String sql = "EXEC admin_doctor '" + location + "', '"+doctorId +"'";
        List<Doctor> results = jdbcTemplate.query(sql,BeanPropertyRowMapper.newInstance(Doctor.class));
        return !results.isEmpty() ? results : null;
    }

    public Treatment updateTreatment(String treatmentId,
                                String name,
                                String description) {
        String sql = "EXEC update_treatment '" + treatmentId + "', '" + name + "', '" + description + "'";
        List<Treatment> result = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Treatment.class));
        return !result.isEmpty() ? result.get(0) : null;
    }



    public List<Treatment> getTreatments(String treatmentId){
        String sql = "EXEC admin_treatment '" + treatmentId + "'";
        List<Treatment> results = jdbcTemplate.query(sql,BeanPropertyRowMapper.newInstance(Treatment.class));
        return !results.isEmpty() ? results : null;
    }

    public Patient addPatient(String location, String patientId,
                              String name,
                              String address,
                              String phone,
                              String departmentId,
                              String dob,
                              String gender) {
        String sql = "EXEC admin_patient_add '" + location + "', '" + patientId + "','" + name + "', '" + address + "', '" + phone + "','" + departmentId + "', '" + dob + "', '" + gender + "'";
        List<Patient> results = jdbcTemplate.query(sql,BeanPropertyRowMapper.newInstance(Patient.class));
        return !results.isEmpty() ? results.get(0) : null;
    }

    public Doctor addDoctor(String location, String doctorId,
                             String name,
                             String address,
                             String phone,
                             String departmentId,
                             String degree) {
        String sql = "EXEC admin_doctor_add '" + location + "', '" + doctorId + "','" + name + "', '" + address + "', '" + degree + "','" + phone + "', '" + departmentId + "'";
        List<Doctor> results = jdbcTemplate.query(sql,BeanPropertyRowMapper.newInstance(Doctor.class));
        return !results.isEmpty() ? results.get(0) : null;
    }

    public void delPatient(String patientId) {
        String sql = "EXEC admin_patient_del  '" + patientId + "'";
        try {
            jdbcTemplate.query(sql, rs -> {});
        } catch (Exception e) {
            // Handle the exception
            e.printStackTrace(); // or log the exception
        }
    }

    public void delDoctor(String doctorId) {
        String sql = "EXEC admin_doctor_del  '" + doctorId + "'";
        try {
            jdbcTemplate.query(sql, rs -> {});
        } catch (Exception e) {
            // Handle the exception
            e.printStackTrace(); // or log the exception
        }
    }
}

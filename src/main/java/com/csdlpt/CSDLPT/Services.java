package com.csdlpt.CSDLPT;

import com.csdlpt.CSDLPT.Models.*;
import com.csdlpt.CSDLPT.Repositorys.DemoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.print.Doc;
import java.util.*;

@Service
public class Services {

    @Autowired
    private DemoRepository demoRepository;

    private Set<String> patientIdList;

    private Set<String> doctorIdList;


    private String generateDepartmentId(String location, String department){
        String departmentCode = "";
        switch (department) {
            case "NO":
                departmentCode = "D001";
                break;
            case "NG":
                departmentCode = "D002";
                break;
            case "SA":
                departmentCode = "D003";
                break;
            case "NH":
                departmentCode = "D004";
                break;
        }
        return location+departmentCode;
    }

    private String generateNewId(String location, String department, String role) {
        String newId = null;
        do {
            // Tạo ID mới
            newId = generateRandomId(location, department, role);
            if(Objects.equals(role, "DT"))
                if(!doctorIdList.contains(newId)){
                    doctorIdList.add(newId);
                    break;
                }

            if(Objects.equals(role, "PT"))
                if(!patientIdList.contains(newId)){
                    patientIdList.add(newId);
                    break;
                }
        } while (true);
        return newId;
    }

    private String generateRandomId(String location, String department, String role) {
        Random random = new Random();
        StringBuilder idBuilder = new StringBuilder(location).append(role).append(department);
        for (int i = 0; i < 3; i++) {
            idBuilder.append(random.nextInt(10)); // Thêm ba số ngẫu nhiên vào cuối ID
        }
        return idBuilder.toString();
    }


    private String whichLocation(String username){
        if(username.contains("DN"))return "danang";
        if(username.contains("SG"))return "saigon";
        if(username.contains("admin"))return "main";
        return null;
    }

    private String whichRole(String username) {
        if(username.contains("PT"))return "patient";
        if(username.contains("DT"))return "doctor";
        if(username.contains("admin"))return "admin";
        return null;
    }

    public User login(UserLogin userLogin){
        String location = whichLocation(userLogin.getUsername());

        String role = whichRole(userLogin.getUsername());

        if (role ==null) return null;



        if(role.contains("admin")){
                return User.builder().name(location).role(role).build();
        }





        User user = demoRepository.userLogin(userLogin.getUsername(), userLogin.getPassword(), role, location);

        user.setRole(role);
        return user;
    }

    public List<PatientResult> patientResults(Patient patient){
        return demoRepository.getPatientResults(patient.getId(), whichLocation(patient.getId()));
    }


    public Patient updatePatient(Patient patient) {
        if(patient==null)return null;
        Patient updatePatient = demoRepository.updatePatient(whichLocation(patient.getId()) ,patient.getId(), patient.getName(), patient.getAddress(), patient.getPhone(), patient.getDepartmentId(), patient.getDob(), patient.getGender());
        updatePatient.setRole(whichRole(updatePatient.getId()));
        return updatePatient;
    }

    public Doctor updateDoctor(Doctor doctor) {
        if(doctor==null)return null;
        Doctor updateDoctor = demoRepository.updateDoctor(whichLocation(doctor.getId()) ,doctor.getId(), doctor.getName(), doctor.getAddress(), doctor.getPhone(), doctor.getDepartmentId(), doctor.getDegree());
        updateDoctor.setRole(whichRole(updateDoctor.getId()));
        return updateDoctor;
    }

    public List<Patient> doctorPatient(Doctor doctor ,String patientId) {
        return demoRepository.doctorPatient(whichLocation(doctor.getId()),doctor.getId(), patientId.trim());
    }

    public User findUserById(String patientId) {
        return  demoRepository.userLogin(patientId.trim(), patientId.trim(), whichRole(patientId),whichLocation(patientId));
    }

    public List<Patient> adminPatient(String location, String patientId) {
        List<Patient> patientList = demoRepository.adminPatient(location, patientId.trim());
        if(patientIdList ==null){
            patientIdList = new HashSet<>();
            patientList.stream().forEach(patient -> patientIdList.add(patient.getId()));
        }
        return patientList;
    }

    public List<Doctor> adminDoctor(String location, String doctorId) {
        List<Doctor> doctorList = demoRepository.adminDoctor(location, doctorId.trim());
        if(doctorIdList==null){
            doctorIdList = new HashSet<>();
            doctorList.stream().forEach(doctor -> doctorIdList.add(doctor.getId()));
        }
        return doctorList;
    }

    public Patient addPatient(Patient patient) {
        String id = generateNewId(patient.getLocation(), patient.getDepartmentId(), "PT");
        String departmentId = generateDepartmentId(patient.getLocation(), patient.getDepartmentId());
        patient.setId(id);
        patient.setDepartmentId(departmentId);
        return demoRepository.addPatient(whichLocation(patient.getId()) ,patient.getId(), patient.getName(), patient.getAddress(), patient.getPhone(), patient.getDepartmentId(), patient.getDob(), patient.getGender());
    }

    public Doctor addDoctor(Doctor doctor) {
        String id = generateNewId(doctor.getLocation(), doctor.getDepartmentId(), "DT");
        String departmentId = generateDepartmentId(doctor.getLocation(), doctor.getDepartmentId());
        doctor.setId(id);
        doctor.setDepartmentId(departmentId);
        return demoRepository.addDoctor(whichLocation(doctor.getId()) ,doctor.getId(), doctor.getName(), doctor.getAddress(), doctor.getPhone(), doctor.getDepartmentId(), doctor.getDegree());
    }

    public List<Treatment> getTreatments(String treatmentId){
        return  demoRepository.getTreatments(treatmentId);
    }

    public Treatment updateTreatment(Treatment treatment){
        if(treatment==null)return null;
        return demoRepository.updateTreatment(treatment.getId(), treatment.getName(), treatment.getDescription());
    }

    public void delPatient(String patientId) {
        demoRepository.delPatient(patientId);
    }

    public void delDoctor(String doctorId) {
        demoRepository.delDoctor(doctorId);
    }
}

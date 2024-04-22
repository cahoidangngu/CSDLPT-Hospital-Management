package com.csdlpt.CSDLPT;

import com.csdlpt.CSDLPT.Models.*;
import com.csdlpt.CSDLPT.Repositorys.DemoRepository;
import com.fasterxml.jackson.databind.deser.impl.BeanPropertyMap;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.print.Doc;
import java.util.List;
import java.util.Objects;

@Controller
@Slf4j
public class Controllers {


    Logger logger = LoggerFactory.getLogger(Controllers.class);
    @Autowired
    private Services services;
    private String location;
    private Doctor currentDoctor;
    private Patient currentPatient;

    @Autowired
    private DemoRepository demoRepository;


    @GetMapping("/")
    public String login(Model model) {
        model.addAttribute("userlogin", new UserLogin());
        return "index";
    }


    @PostMapping("/login")
    public String loginHandle(Model model, @ModelAttribute UserLogin userLogin, RedirectAttributes redirectAttributes) {

        model.addAttribute("userlogin", userLogin);
        model.addAttribute("errorMessage", "Wrong username or password");

        User user = services.login(userLogin);
        if (user == null) return "index";
        logger.info("here");
        if (Objects.equals(user.getRole(), "doctor")) {
            currentDoctor = Doctor.builder()
                    .id(user.getId())
                    .address(user.getAddress())
                    .name(user.getName())
                    .phone(user.getPhone())
                    .departmentId(user.getDepartmentId())
                    .role(user.getRole())
                    .degree(user.getDegree())
                    .build();
            logger.info(currentDoctor.toString());
            redirectAttributes.addFlashAttribute("doctor", currentDoctor);
            return "redirect:/doctor/home";
        } else if (Objects.equals(user.getRole(), "patient")) {
            currentPatient = Patient.builder()
                    .id(user.getId())
                    .address(user.getAddress())
                    .name(user.getName())
                    .phone(user.getPhone())
                    .departmentId(user.getDepartmentId())
                    .role(user.getRole())
                    .dob(user.getDob())
                    .gender(user.getGender())
                    .build();
            logger.info(currentPatient.toString());
            redirectAttributes.addFlashAttribute("patient", currentPatient);
            return "redirect:/patient/home";
        } else {
            logger.info("admin");
            location = user.getName();
            return "redirect:/admin/doctor";
        }
    }

    @GetMapping("/patient/home")
    public String patientHome(Model model) {
        if (!model.containsAttribute("patient"))
            model.addAttribute("patient", currentPatient);
        return "patient_home";
    }

    @PostMapping("/patient/update")
    public String patientEdit(RedirectAttributes redirectAttributes, @ModelAttribute Patient patient) {
        logger.info(patient.toString());
        Patient editPatient = services.updatePatient(patient);
        if (editPatient == null) {
            return "redirect:/patient/home";
        }
        currentPatient = editPatient;
        redirectAttributes.addFlashAttribute("patient", currentPatient);
        return "redirect:/patient/home";
    }
    @GetMapping("/patient/result")
    public String patientResult(Model model) {
        List<PatientResult> patientResults = services.patientResults(currentPatient);
        double totalPrice = 0f;
        if(patientResults != null){
            totalPrice = patientResults.stream()
                .mapToDouble(PatientResult::getPrice)
                .sum();
        }
        // Add both patientResultList and totalPrice to the model
        model.addAttribute("patientResult", patientResults);
        model.addAttribute("totalPrice", totalPrice);
        return "patient_result";
    }


    @GetMapping("/doctor/home")
    public String doctorHome(Model model) {
        if (!model.containsAttribute("doctor"))
            model.addAttribute("doctor", currentDoctor);
        return "doctor_home";
    }

    @PostMapping("/doctor/update")
    public String doctorEdit(RedirectAttributes redirectAttributes, @ModelAttribute Doctor doctor) {
        logger.info(doctor.toString());
        Doctor editDoctor = services.updateDoctor(doctor);
        if (editDoctor == null) {
            return "redirect:/doctor/home";
        }
        currentDoctor = editDoctor;
        redirectAttributes.addFlashAttribute("doctor", currentDoctor);
        return "redirect:/doctor/home";
    }

    @PostMapping("/doctor/update/patient")
    public String doctorEditPatient(RedirectAttributes redirectAttributes, @ModelAttribute Patient patient) {
        logger.info(patient.toString());
        Patient editPatient = services.updatePatient(patient);
        if (editPatient == null) {
            return "redirect:/doctor/patient/"+patient.getId();
        }
        return "redirect:/doctor/patient/"+editPatient.getId();

    }

    @GetMapping("/doctor/patient")
    public String doctorPatient(Model model) {
        if (!model.containsAttribute("patientList")) {
            List<Patient> patientList = services.doctorPatient(currentDoctor, "");
            model.addAttribute("patientList", patientList);
        }
        return "doctor_patient";
    }

    @GetMapping("/doctor/patient/{patientId}")
    public String doctorPatient(Model model, @PathVariable("patientId") String patientId) {
        User user =  services.findUserById(patientId);
        Patient patient = Patient.builder()
                .id(user.getId())
                .address(user.getAddress())
                .name(user.getName())
                .phone(user.getPhone())
                .departmentId(user.getDepartmentId())
                .role(user.getRole())
                .dob(user.getDob())
                .gender(user.getGender())
                .build();
        model.addAttribute("patient", patient);
        return "doctor_patient_detail";
    }

    @GetMapping("/doctor/patientId")
    public String doctorFindPatientById(RedirectAttributes redirectAttributes, @RequestParam("patientId") String patientId) {
        logger.info(patientId);
        List<Patient> patientList = services.doctorPatient(currentDoctor, patientId);
        redirectAttributes.addFlashAttribute("patientList", patientList);
        return "redirect:/doctor/patient";
    }

    @GetMapping("/admin/patient")
    public String adminPatient(Model model){
        model.addAttribute("patient", new Patient());
        model.addAttribute("location", location);
        if (!model.containsAttribute("patientList")) {
            List<Patient> patientList = services.adminPatient(location, "");
            model.addAttribute("patientList", patientList);
        }

        return "admin_patient";
    }
    @GetMapping("/admin/patientId")
    public String adminFindPatientById(RedirectAttributes redirectAttributes, @RequestParam("patientId") String patientId) {
        logger.info(patientId);
        List<Patient> patientList = services.adminPatient(location, patientId);
        redirectAttributes.addFlashAttribute("patientList", patientList);
        return "redirect:/admin/patient";
    }


    @GetMapping("/admin/patient/{patientId}")
    public String adminPatient(Model model, @PathVariable("patientId") String patientId) {
        User user =  services.findUserById(patientId);
        Patient patient = Patient.builder()
                .id(user.getId())
                .address(user.getAddress())
                .name(user.getName())
                .phone(user.getPhone())
                .departmentId(user.getDepartmentId())
                .role(user.getRole())
                .dob(user.getDob())
                .gender(user.getGender())
                .build();
        model.addAttribute("patient", patient);
        return "admin_patient_detail";
    }

    @PostMapping("/admin/patient/update")
    public String adminEditPatient(RedirectAttributes redirectAttributes, @ModelAttribute Patient patient) {
        logger.info(patient.toString());
        Patient editPatient = services.updatePatient(patient);
        if (editPatient == null) {
            return "redirect:/admin/patient/"+patient.getId();
        }
        return "redirect:/admin/patient/"+editPatient.getId();

    }

    @PostMapping("/admin/patient/add")
    public String adminPatientAdd(RedirectAttributes redirectAttributes, @ModelAttribute Patient patient){
        Patient newPatient = services.addPatient(patient);
        if (newPatient == null) {
            return "redirect:/admin/patient";
        }
        return "redirect:/admin/patient/"+newPatient.getId();
    }

    @GetMapping("/admin/patient/del/{patientId}")
    public String adminPatientDel(@PathVariable("patientId") String patientId){
        services.delPatient(patientId);
        return "redirect:/admin/patient";
    }

    @GetMapping("/admin/doctor")
    public String adminDoctor(Model model){
        model.addAttribute("doctor", new Doctor());
        model.addAttribute("location", location);
        if (!model.containsAttribute("doctorList")) {
            List<Doctor> doctorList = services.adminDoctor(location,"");
            logger.info(doctorList.toString());
            model.addAttribute("doctorList", doctorList);
        }

        return "admin_doctor";
    }
    @GetMapping("/admin/doctorId")
    public String adminFindDoctorById(RedirectAttributes redirectAttributes, @RequestParam("doctorId") String doctorId) {
        logger.info(doctorId);
        List<Doctor> doctorList = services.adminDoctor(location, doctorId);
        redirectAttributes.addFlashAttribute("doctorList", doctorList);
        return "redirect:/admin/doctor";
    }


    @GetMapping("/admin/doctor/{doctorId}")
    public String adminDoctor(Model model, @PathVariable("doctorId") String doctorId) {
        User user =  services.findUserById(doctorId);
        Doctor doctor = Doctor.builder()
                .id(user.getId())
                .address(user.getAddress())
                .name(user.getName())
                .phone(user.getPhone())
                .departmentId(user.getDepartmentId())
                .role(user.getRole())
                .degree(user.getDegree())
                .build();
        model.addAttribute("doctor", doctor);
        return "admin_doctor_detail";
    }

    @PostMapping("/admin/doctor/update")
    public String adminEditDoctor(RedirectAttributes redirectAttributes, @ModelAttribute Doctor doctor) {
        logger.info(doctor.toString());
        Doctor editDoctor = services.updateDoctor(doctor);
        if (editDoctor == null) {
            return "redirect:/admin/doctor/"+doctor.getId();
        }
        return "redirect:/admin/doctor/"+editDoctor.getId();

    }

    @PostMapping("/admin/doctor/add")
    public String adminDoctorAdd(RedirectAttributes redirectAttributes, @ModelAttribute Doctor doctor){
        Doctor newDoctor = services.addDoctor(doctor);
        if (newDoctor == null) {
            return "redirect:/admin/doctor";
        }
        return "redirect:/admin/doctor/"+newDoctor.getId();
    }

    @GetMapping("/admin/doctor/del/{doctorId}")
    public String adminDoctorDel(@PathVariable("doctorId") String doctorId){
        logger.info(doctorId);
        services.delDoctor(doctorId);
        return "redirect:/admin/doctor";
    }

    @GetMapping("/admin/treatment")
    public String adminTreatment(Model model){
        model.addAttribute("treatment", new Treatment());
        if (!model.containsAttribute("treatmentList")) {
            List<Treatment> treatmentList = services.getTreatments("");
            model.addAttribute("treatmentList", treatmentList);
        }

        return "admin_treatment";
    }
    @GetMapping("/admin/treatmentId")
    public String adminFindTreatmentById(RedirectAttributes redirectAttributes, @RequestParam("treatmentId") String treatmentId) {
        logger.info(treatmentId);
        List<Treatment> treatmentList = services.getTreatments(treatmentId);
        redirectAttributes.addFlashAttribute("treatmentList", treatmentList);
        return "redirect:/admin/treatment";
    }

    @GetMapping("/admin/treatment/{treatmentId}")
    public String adminTreatment(Model model, @PathVariable("treatmentId") String treatmentId) {
        Treatment treatment =  services.getTreatments(treatmentId).get(0);
        model.addAttribute("treatment", treatment);
        return "admin_treatment_detail";
    }

    @PostMapping("/admin/update/treatment")
    public String adminEditTreatment(RedirectAttributes redirectAttributes, @ModelAttribute Treatment treatment) {
        logger.info(treatment.toString());
        Treatment editTreatment = services.updateTreatment(treatment);
        if (editTreatment == null) {
            return "redirect:/admin/treatment/"+treatment.getId();
        }
        return "redirect:/admin/treatment/"+editTreatment.getId();

    }



    @GetMapping("/logout")
    public String logoutHandle() {
        location = null;
        currentDoctor = null;
        currentPatient = null;
        return "redirect:/";
    }

}



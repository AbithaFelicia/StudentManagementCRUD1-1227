
package com.example.demo;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StudentController {

    private final StudentService studentService;

    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    // Display the form to add a student
    @GetMapping("/")
    public String showForm(Model model) {
        model.addAttribute("student", new Student());
        model.addAttribute("isEdit", false);
        return "student-form";
    }

    // Save a new student or update existing details
    @PostMapping("/saveStudent")
    public String saveStudent(
            @ModelAttribute("student") Student student) {

        studentService.saveStudent(student);
        return "redirect:/students";
    }

    // Display all students
    @GetMapping("/students")
    public String getAllStudents(Model model) {
        model.addAttribute(
                "students", studentService.getAllStudents());
        model.addAttribute("searched", false);

        return "student-list";
    }

    // Search using registration number
    @GetMapping("/searchStudent")
    public String searchStudent(
            @RequestParam("regno") Integer regno,
            Model model) {

        List<Student> students = studentService.getAllStudents();

        Optional<Student> result =
                studentService.getStudentById(regno);

        model.addAttribute("students", students);
        model.addAttribute("searched", true);
        model.addAttribute("searchResult", result.orElse(null));

        return "student-list";
    }
    // Open the form to edit an existing student
    @GetMapping("/editStudent/{regno}")
    public String editStudent(
            @PathVariable("regno") Integer regno,
            Model model) {

        Optional<Student> result =
                studentService.getStudentById(regno);

        if (result.isPresent()) {
            model.addAttribute("student", result.get());
            model.addAttribute("isEdit", true);
            return "student-form";
        }
        return "redirect:/students";
    }
    // Delete a student
    @GetMapping("/deleteStudent/{regno}")
    public String deleteStudent(
            @PathVariable("regno") Integer regno) {

        studentService.deleteStudent(regno);
        return "redirect:/students";
    }
}


package com.example.demo;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

@Service
public class StudentService {

    private final StudentRepository studentRepository;

    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    // Save or update a student
    public Student saveStudent(Student student) {
        return studentRepository.save(student);
    }

    // Get all students
    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    // Search student by registration number
    public Optional<Student> getStudentById(Integer regno) {
        return studentRepository.findById(regno);
    }

    // Delete student by registration number
    public void deleteStudent(Integer regno) {
        studentRepository.deleteById(regno);
    }
}

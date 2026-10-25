
package com.example.demo;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Entity
@Table(name = "student")
public class Student {
    @Id
    private Integer regno;
    private String name;
    private double cgpa;

    public Student() {
    }

    public Student(Integer regno, String name, double cgpa) {
        this.regno = regno;
        this.name = name;
        this.cgpa = cgpa;
    }

    public Integer getRegno() {
        return regno;
    }

    public void setRegno(Integer regno) {
        this.regno = regno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getCgpa() {
        return cgpa;
    }

    public void setCgpa(double cgpa) {
        this.cgpa = cgpa;
    }
}

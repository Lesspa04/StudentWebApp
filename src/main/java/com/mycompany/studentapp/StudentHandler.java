package com.mycompany.studentapp;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

public class StudentHandler {
    private String name;
    private String dobString; 
    private LocalDate dateOfBirth;

    public StudentHandler() {
        this.name = null;
        this.dobString = null;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDobString() {
        return dobString;
    }

    public void setDobString(String dobString) {
    this.dobString = dobString;
    try {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        this.dateOfBirth = LocalDate.parse(dobString, formatter);
    } catch (DateTimeParseException e) {
        this.dateOfBirth = null;
    }
}


    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    // Calcula la edad del estudiante. 
    public int getAge() {
        if (dateOfBirth != null) {
            return Period.between(dateOfBirth, LocalDate.now()).getYears();
        }
        return -1; // Indica que la fecha de nacimiento no es válida
    }
}
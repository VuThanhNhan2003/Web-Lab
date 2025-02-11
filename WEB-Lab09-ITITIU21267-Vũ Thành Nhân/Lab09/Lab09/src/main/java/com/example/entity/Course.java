package com.example.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "course")
public class Course {
    @Id
    @Column(length = 255)
    private String id;

    @Column(nullable = false)
    private Integer courseLevelId;

    @Column(nullable = false, length = 255)
    private String name;

    @Column(nullable = false, length = 255)
    private String nameVn;

    @Column(nullable = false)
    private Integer creditTheory;

    @Column(nullable = false)
    private Integer creditLab;

    @Column(length = 500)
    private String description;
}



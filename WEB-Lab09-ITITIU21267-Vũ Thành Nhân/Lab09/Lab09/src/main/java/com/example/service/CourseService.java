package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.example.entity.Course;
import com.example.repository.CourseRepository;

@Service
public class CourseService {

    @Autowired
    private CourseRepository courseRepository;

    public Course createCourse(Course course) {
        return courseRepository.save(course);
    }

    public List<Course> listCourses(Specification<Course> specification) {
        return courseRepository.findAll(specification);
    }

    public Optional<Course> getCourseById(String id) {
        return courseRepository.findById(id);
    }

    public boolean courseExistsById(String id) {
        return courseRepository.existsById(id);
    }

    public Course updateCourse(String id, Course course) {
        course.setId(id);
        return courseRepository.save(course);
    }

    public void deleteCourse(String id) {
        courseRepository.deleteById(id);
    }
}

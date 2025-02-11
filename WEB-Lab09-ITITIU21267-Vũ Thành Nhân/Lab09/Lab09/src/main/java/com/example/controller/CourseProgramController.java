package com.example.controller;

import com.example.entity.CourseProgram;
import com.example.service.CourseProgramService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/course_program")
public class CourseProgramController {

    @Autowired
    private CourseProgramService courseProgramService;

    // Create a new CourseProgram entry
    @PostMapping
    public CourseProgram createCourseProgram(@RequestBody CourseProgram courseProgram) {
        return courseProgramService.createCourseProgram(courseProgram);
    }

    // List all CourseProgram entries by program name with pagination, sorting, and
    // filtering
    @GetMapping("/{programName}")
    public List<CourseProgram> listCoursesByProgramName(
            @PathVariable String programName,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "courseId") String sortBy,
            @RequestParam(defaultValue = "asc") String sortDirection) {
        return courseProgramService.listCoursesByProgramName(programName, page, size, sortBy, sortDirection);
    }

    // Delete a CourseProgram entry by its ID
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCourseProgram(@PathVariable Long id) {
        courseProgramService.deleteCourseProgram(id);
        return ResponseEntity.noContent().build();
    }
}

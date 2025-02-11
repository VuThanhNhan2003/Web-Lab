package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.entity.CourseProgram;
import com.example.repository.CourseProgramRepository;

@Service
public class CourseProgramService {

    @Autowired
    private CourseProgramRepository courseProgramRepository;

    // Fetch CourseProgram entities by program name with sorting and pagination
    public List<CourseProgram> listCoursesByProgramName(String programName, int page, int size, String sortBy, String sortDirection) {
        Sort.Direction direction = Sort.Direction.fromString(sortDirection);
        PageRequest pageRequest = PageRequest.of(page, size, direction, sortBy);
        return courseProgramRepository.findByProgramName(programName, pageRequest);
    }

    // Create a new CourseProgram entry
    public CourseProgram createCourseProgram(CourseProgram courseProgram) {
        return courseProgramRepository.save(courseProgram);
    }

    // Delete a CourseProgram entry by its ID
    public void deleteCourseProgram(Long id) {
        courseProgramRepository.deleteById(id);
    }
}

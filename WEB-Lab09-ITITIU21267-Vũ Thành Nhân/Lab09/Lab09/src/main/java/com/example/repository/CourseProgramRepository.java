package com.example.repository;

import java.util.List;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.entity.CourseProgram;

@Repository
public interface CourseProgramRepository extends JpaRepository<CourseProgram, Long> {

    // Custom query to fetch CoursePrograms by programId and join with Program
    @Query("SELECT cp FROM CourseProgram cp JOIN Program p ON cp.programId = p.id WHERE p.name = :programName")
    List<CourseProgram> findByProgramName(@Param("programName") String programName, PageRequest pageRequest);
}

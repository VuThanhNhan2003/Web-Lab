package com.example.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.example.entity.Program;

@Repository
public interface ProgramRepository extends JpaRepository<Program, Integer>, JpaSpecificationExecutor<Program> {
    Optional<Program> findByName(String name);
}

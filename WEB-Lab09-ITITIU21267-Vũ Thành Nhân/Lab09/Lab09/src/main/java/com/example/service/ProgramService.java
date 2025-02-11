package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.example.entity.Program;
import com.example.repository.ProgramRepository;

@Service
public class ProgramService {

    @Autowired
    private ProgramRepository programRepository;

    public Program createProgram(Program program) {
        return programRepository.save(program);
    }

    public List<Program> listPrograms(Specification<Program> specification) {
        return programRepository.findAll(specification);
    }

    public Optional<Program> getProgramByName(String name) {
        return programRepository.findByName(name);
    }

    public boolean programExistsById(Integer id) {
        return programRepository.existsById(id);
    }

    public Program updateProgram(Integer id, Program program) {
        program.setId(id);
        return programRepository.save(program);
    }

    public void deleteProgram(Integer id) {
        programRepository.deleteById(id);
    }
}

package com.example.controller;

import com.example.entity.Program;
import com.example.service.ProgramService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/program")
public class ProgramController {

    @Autowired
    private ProgramService programService;

    @PostMapping
    public Program createProgram(@RequestBody Program program) {
        return programService.createProgram(program);
    }

    @GetMapping
    public List<Program> listPrograms(
            @RequestParam(required = false) Specification<Program> specification) {
        return programService.listPrograms(specification);
    }


    @GetMapping("/{name}")
    public ResponseEntity<Program> getProgramByName(@PathVariable String name) {
        return programService.getProgramByName(name)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<Program> updateProgram(@PathVariable Integer id, @RequestBody Program program) {
        if (!programService.programExistsById(id)) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(programService.updateProgram(id, program));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteProgram(@PathVariable Integer id) {
        if (!programService.programExistsById(id)) {
            return ResponseEntity.notFound().build();
        }
        programService.deleteProgram(id);
        return ResponseEntity.noContent().build();
    }
}

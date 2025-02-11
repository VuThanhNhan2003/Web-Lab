import { createProgram, getAllPrograms, getProgramByName, updateProgram, deleteProgram } from '../models/programModel.js';

export const createProgramHandler = async (req, res) => {
  const programId = await createProgram(req.body);
  res.status(201).json({ id: programId });
};

export const getAllProgramsHandler = async (req, res) => {
  const filters = req.query.filters ? JSON.parse(req.query.filters) : null;
  const sort = req.query.sort ? JSON.parse(req.query.sort) : null;
  const programs = await getAllPrograms(filters, sort);
  res.json(programs);
};

export const getProgramByNameHandler = async (req, res) => {
  const program = await getProgramByName(req.params.name);
  res.json(program);
};

export const updateProgramHandler = async (req, res) => {
  await updateProgram(req.params.id, req.body);
  res.status(204).send();
};

export const deleteProgramHandler = async (req, res) => {
  await deleteProgram(req.params.id);
  res.status(204).send();
};
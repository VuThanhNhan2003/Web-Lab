import { createCourseProgram, getCoursesByProgramName, deleteCourseProgram } from '../models/courseProgramModel.js';

export const createCourseProgramHandler = async (req, res) => {
  const courseProgramId = await createCourseProgram(req.body);
  res.status(201).json({ id: courseProgramId });
};

export const getCoursesByProgramNameHandler = async (req, res) => {
  const filters = req.query.filters ? JSON.parse(req.query.filters) : null;
  const sort = req.query.sort ? JSON.parse(req.query.sort) : null;
  const courses = await getCoursesByProgramName(filters, sort);
  res.json(courses);
};

export const deleteCourseProgramHandler = async (req, res) => {
  await deleteCourseProgram(req.params.course_id, req.params.program_id);
  res.status(204).send();
};
import { createCourse, getAllCourses, getCourseByName, updateCourse, deleteCourse } from '../models/courseModel.js';

export const createCourseHandler = async (req, res) => {
  const courseId = await createCourse(req.body);
  res.status(201).json({ id: courseId });
};

export const getAllCoursesHandler = async (req, res) => {
  const filters = req.query.filters ? JSON.parse(req.query.filters) : null;
  const sort = req.query.sort ? JSON.parse(req.query.sort) : null;
  const courses = await getAllCourses(filters, sort);
  res.json(courses);
};

export const getCourseByNameHandler = async (req, res) => {
  const course = await getCourseByName(req.params.name);
  res.json(course);
};

export const updateCourseHandler = async (req, res) => {
  await updateCourse(req.params.id, req.body);
  res.status(204).send();
};

export const deleteCourseHandler = async (req, res) => {
  await deleteCourse(req.params.id);
  res.status(204).send();
};
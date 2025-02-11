import { Router } from 'express';
import {
  createCourseHandler,
  getAllCoursesHandler,
  getCourseByNameHandler,
  updateCourseHandler,
  deleteCourseHandler
} from '../handlers/courseHandlers.js';

const router = Router();

router.post('/course', createCourseHandler);
router.get('/courses', getAllCoursesHandler);
router.get('/course/:name', getCourseByNameHandler);
router.put('/course/:id', updateCourseHandler);
router.delete('/course/:id', deleteCourseHandler);

export default router;
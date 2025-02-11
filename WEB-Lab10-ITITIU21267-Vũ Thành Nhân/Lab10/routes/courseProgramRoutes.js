import { Router } from 'express';
import {
  createCourseProgramHandler,
  getCoursesByProgramNameHandler,
  deleteCourseProgramHandler
} from '../handlers/courseProgramHandlers.js';

const router = Router();

router.post('/course_program', createCourseProgramHandler);
router.get('/course_program', getCoursesByProgramNameHandler);
router.delete('/course_program/:course_id/:program_id', deleteCourseProgramHandler);

export default router;
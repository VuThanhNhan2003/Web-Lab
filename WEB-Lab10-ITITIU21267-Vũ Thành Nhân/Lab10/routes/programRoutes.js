import { Router } from 'express';
import {
  createProgramHandler,
  getAllProgramsHandler,
  getProgramByNameHandler,
  updateProgramHandler,
  deleteProgramHandler
} from '../handlers/programHandlers.js';

const router = Router();

router.post('/program', createProgramHandler);
router.get('/programs', getAllProgramsHandler);
router.get('/program/:name', getProgramByNameHandler);
router.put('/program/:id', updateProgramHandler);
router.delete('/program/:id', deleteProgramHandler);

export default router;
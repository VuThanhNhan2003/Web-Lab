import express from 'express';
import courseRoutes from './routes/courseRoutes.js';
import programRoutes from './routes/programRoutes.js';
import courseProgramRoutes from './routes/courseProgramRoutes.js';
import { connectToDatabase } from './DB/index.js';

const app = express();

// Middlewares
app.use(express.json());
app.use('/api/v1', courseRoutes);
app.use('/api/v1', programRoutes);
app.use('/api/v1', courseProgramRoutes);

const PORT = process.env.PORT || 5000;

connectToDatabase()
  .then(() => {
    app.listen(PORT, () => console.log(`Server Open At port: ${PORT}`));
  })
  .catch((err) => {
    console.error('Error occurred with MySQL connection. Error = ', err);
    process.exit(0);
  });
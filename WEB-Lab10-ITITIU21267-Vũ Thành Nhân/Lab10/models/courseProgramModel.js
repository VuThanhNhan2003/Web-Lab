import { pool } from '../DB/index.js';

export const createCourseProgram = async (courseProgram) => {
  const [result] = await pool.query('INSERT INTO Course_Program SET ?', courseProgram);
  return result.insertId;
};

export const getCoursesByProgramName = async (filters, sort) => {
  let query = `
    SELECT cp.*, c.name as course_name, p.name as program_name
    FROM Course_Program cp
    JOIN Course c ON cp.course_id = c.id
    JOIN Program p ON cp.program_id = p.id
    WHERE 1=1
  `;
  const queryParams = [];

  // Apply filters
  if (filters) {
    if (filters.program_name) {
      query += ' AND p.name LIKE ?';
      queryParams.push(`%${filters.program_name}%`);
    }
    if (filters.course_name) {
      query += ' AND c.name LIKE ?';
      queryParams.push(`%${filters.course_name}%`);
    }
    if (filters.course_type_id) {
      query += ' AND cp.course_type_id = ?';
      queryParams.push(filters.course_type_id);
    }
  }

  // Apply sorting
  if (sort) {
    const sortConditions = [];
    if (sort.by) {
      sortConditions.push(`${sort.by} ${sort.order === 'desc' ? 'DESC' : 'ASC'}`);
    }
    if (sortConditions.length > 0) {
      query += ' ORDER BY ' + sortConditions.join(', ');
    }
  }

  const [rows] = await pool.query(query, queryParams);
  return rows;
};

export const deleteCourseProgram = async (courseId, programId) => {
  await pool.query('DELETE FROM Course_Program WHERE course_id = ? AND program_id = ?', [courseId, programId]);
};
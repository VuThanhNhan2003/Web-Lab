import { pool } from '../DB/index.js';

export const createProgram = async (program) => {
  const [result] = await pool.query('INSERT INTO Program SET ?', program);
  return result.insertId;
};

export const getAllPrograms = async (filters, sort) => {
  let query = 'SELECT * FROM Program';
  const queryParams = [];

  // Apply filters
  if (filters) {
    const filterConditions = [];
    if (filters.name) {
      filterConditions.push('name LIKE ?');
      queryParams.push(`%${filters.name}%`);
    }
    if (filters.major_id) {
      filterConditions.push('major_id = ?');
      queryParams.push(filters.major_id);
    }
    if (filterConditions.length > 0) {
      query += ' WHERE ' + filterConditions.join(' AND ');
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

export const getProgramByName = async (name) => {
  const [rows] = await pool.query('SELECT * FROM Program WHERE name = ?', [name]);
  return rows[0];
};

export const updateProgram = async (id, program) => {
  await pool.query('UPDATE Program SET ? WHERE id = ?', [program, id]);
};

export const deleteProgram = async (id) => {
  await pool.query('DELETE FROM Program WHERE id = ?', [id]);
};
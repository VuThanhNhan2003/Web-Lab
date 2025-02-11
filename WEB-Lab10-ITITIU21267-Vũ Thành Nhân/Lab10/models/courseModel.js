import { pool } from '../DB/index.js';

export const createCourse = async (course) => {
  const [result] = await pool.query('INSERT INTO Course SET ?', course);
  return result.insertId;
};

export const getAllCourses = async (filters, sort) => {
  let query = 'SELECT * FROM Course';
  const queryParams = [];

  // Apply filters
  if (filters) {
    const filterConditions = [];
    if (filters.name) {
      filterConditions.push('name LIKE ?');
      queryParams.push(`%${filters.name}%`);
    }
    if (filters.course_level_id) {
      filterConditions.push('course_level_id = ?');
      queryParams.push(filters.course_level_id);
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

export const getCourseByName = async (name) => {
  const [rows] = await pool.query('SELECT * FROM Course WHERE name = ?', [name]);
  return rows[0];
};

export const updateCourse = async (id, course) => {
  await pool.query('UPDATE Course SET ? WHERE id = ?', [course, id]);
};

export const deleteCourse = async (id) => {
  await pool.query('DELETE FROM Course WHERE id = ?', [id]);
};
const pool = require('../db');

const cadastrarMatricula = async (req, res) => {
    const { codigo_curso, codigo_aluno } = req.body;
    try {
        const novaMatricula = await pool.query('INSERT INTO curso_aluno (codigo_curso, codigo_aluno) VALUES ($1, $2) RETURNING *', [codigo_curso, codigo_aluno]);
        return res.status(201).json(novaMatricula.rows[0]);
    } catch (error) {
        return res.status(400).json({ error: 'Erro ao cadastrar matrícula' });
    }
};

const listarMatriculas = async (req, res) => {
    
    try {
        const matriculas = await pool.query(`
            SELECT ca.*, a.nome AS nome_aluno, c.descricao AS nome_curso
            FROM curso_aluno ca
            JOIN aluno a ON ca.codigo_aluno = a.codigo
            JOIN curso c ON ca.codigo_curso = c.codigo
        `);
        return res.status(200).json(matriculas.rows);
    } catch (error) {
        return res.status(400).json({ error: 'Erro ao listar matrículas' });
    }
};

const listarMatriculasCurso = async (req, res) => {
    const { codigo_curso } = req.query;
    try {
        const matriculas = await pool.query(`
            SELECT ca.*, a.nome AS nome_aluno, c.descricao AS nome_curso
            FROM curso_aluno ca
            JOIN aluno a ON ca.codigo_aluno = a.codigo
            JOIN curso c ON ca.codigo_curso = c.codigo
            WHERE ca.codigo_curso = $1`, [codigo_curso]
        );
        return res.status(200).json(matriculas.rows);
    } catch (error) {
        return res.status(400).json({ error: 'Erro ao listar matrículas' });
    }
};


const removerMatricula = async (req, res) => {
    const codigo = parseInt(req.params.codigo);
    try {
        const result = await pool.query('DELETE FROM curso_aluno WHERE codigo = $1', [codigo]);
        if (result.rowCount === 1) {
            return res.status(200).json({ mensagem: 'Matrícula removida com sucesso' });
        } else {
            return res.status(404).json({ error: 'Matrícula não encontrada' });
        }
    } catch (error) {
        return res.status(400).json({ error: 'Erro ao remover matrícula' });
    }
};

module.exports = {
    cadastrarMatricula,
    listarMatriculas,
    removerMatricula,
    listarMatriculasCurso
};

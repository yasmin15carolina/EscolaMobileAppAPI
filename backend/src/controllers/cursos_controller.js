const pool = require('../db');

const listarCursos = async (req, res) => {
    try {
        const { rows } = await pool.query('SELECT * FROM curso');
        return res.status(200).json(rows);
    } catch (error) {
        return res.status(400).json({ error: 'Erro ao listar cursos' });
    }
};

const cadastrarCurso = async (req, res) => {
    const { descricao, ementa } = req.body;
    try {
        const newCurso = await pool.query('INSERT INTO curso (descricao, ementa) VALUES ($1, $2) RETURNING *', [descricao, ementa]);
        return res.status(201).json(newCurso.rows[0]);
    } catch (error) {
        return res.status(400).json({ error: 'Erro ao cadastrar curso' });
    }
};

const atualizarCurso = async (req, res) => {
    const id = parseInt(req.params.id);
    const { descricao, ementa } = req.body;
    try {
        const result = await pool.query('UPDATE curso SET descricao = $1, ementa = $2 WHERE codigo = $3', [descricao, ementa, id]);
        if (result.rowCount === 1) {
            return res.status(200).json({ mensagem: 'Curso atualizado com sucesso' });
        } else {
            return res.status(404).json({ error: 'Curso não encontrado' });
        }
    } catch (error) {
        return res.status(400).json({ error: 'Erro ao atualizar curso' });
    }
};

const deletarCurso = async (req, res) => {
    const codigo = parseInt(req.params.codigo);
    try {
        const result = await pool.query('DELETE FROM curso WHERE codigo = $1', [codigo]);
        if (result.rowCount === 1) {
            return res.status(200).json({ mensagem: 'Curso deletado com sucesso' });
        } else {
            return res.status(404).json({ error: 'Curso não encontrado' });
        }
    } catch (error) {
        return res.status(400).json({ error: 'Erro ao deletar curso' });
    }
};

module.exports = {
    listarCursos,
    cadastrarCurso,
    atualizarCurso,
    deletarCurso,
};

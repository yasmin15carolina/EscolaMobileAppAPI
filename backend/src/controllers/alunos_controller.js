const pool = require('../db');

const listarAlunos = async (req, res) => {
    try {
        const { rows } = await pool.query('SELECT * FROM aluno ORDER BY nome ASC');
        return res.status(200).json(rows);
    } catch (error) {
        return res.status(400).json({ error: 'Erro ao listar alunos' });
    }
};

const cadastrarAluno = async (req, res) => {
    const { nome } = req.body;
    try {
        const novoAluno = await pool.query('INSERT INTO aluno (nome) VALUES ($1) RETURNING *', [nome]);
        return res.status(201).json(novoAluno.rows[0]);
    } catch (error) {
        return res.status(400).json({ error: 'Erro ao cadastrar aluno' });
    }
};

const atualizarAluno = async (req, res) => {
    const codigo = parseInt(req.params.codigo);
    const { nome } = req.body;
    try {
        const result = await pool.query('UPDATE aluno SET nome = $1 WHERE codigo = $2', [nome, codigo]);
        if (result.rowCount === 1) {
            return res.status(200).json({ mensagem: 'Aluno atualizado com sucesso' });
        } else {
            return res.status(404).json({ error: 'Aluno não encontrado' });
        }
    } catch (error) {
        return res.status(400).json({ error: 'Erro ao atualizar aluno' });
    }
};

const deletarAluno = async (req, res) => {
    const codigo = parseInt(req.params.codigo);

    try {
        const result = await pool.query('DELETE FROM aluno WHERE codigo = $1', [codigo]);
        if (result.rowCount === 1) {
            return res.status(200).json({ mensagem: 'Aluno deletado com sucesso' });
        } else {
            return res.status(404).json({ error: 'Aluno não encontrado' });
        }
    } catch (error) {
        return res.status(400).json({ error: 'Erro ao deletar aluno' });
    }
};

module.exports = {
    listarAlunos,
    cadastrarAluno,
    atualizarAluno,
    deletarAluno,
};

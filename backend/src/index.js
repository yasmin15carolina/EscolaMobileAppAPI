const express = require('express');
const { Pool } = require('pg');
require('dotenv').config();

const PORT = 3000

const pool = new Pool({
    connectionString: process.env.POSTGRES_URL
})

const app = express();
app.use(express.json());

app.get('/', (req, res) => {
    return res.json({ mensagem: 'A api funcionando ${}' + process.env.POSTGRES_URL })
});


//CURSOS

//Listar
app.get('/cursos', async (req, res) => {
    try {
        const { rows } = await pool.query('SELECT * FROM curso');
        return res.status(200).send(rows);
    } catch (error) {
        return res.status(400).send(error);
    }
});

//Cadastrar
app.post('/cursos/cadastrar', async (req, res) => {
    console.log(req.body);
    const { descricao, ementa } = req.body;
    try {
        const newCurso = await pool.query('INSERT INTO curso (descricao, ementa) VALUES ($1,$2) RETURNING *', [descricao, [ementa]]);
        return res.status(200).send(newCurso.rows);
    } catch (error) {
        return res.status(400).send(error);
    }
});

//Editar
app.put('/cursos/atualizar/:id', async (req, res) => {
    const id = parseInt(req.params.id);
    const { descricao, ementa } = req.body;
    try {
        //console.log('UPDATE curso SET descricao = $1, ementa = $2 WHERE id = $3', [descricao, ementa, id]);
        const result = await pool.query('UPDATE curso SET descricao = $1, ementa = $2 WHERE codigo = $3', [descricao, ementa, id]);
        if (result.rowCount === 1) {
            return res.status(200).send('Curso Atualizado!');
        } else {
            return res.status(404).send('Curso não encontrado');
        }
    } catch (error) {
        return res.status(400).send(error);
    }
});

//Deletar
app.delete('/cursos/deletar/:codigo', async (req, res) => {
    const codigo = parseInt(req.params.codigo);
    try {
        const result = await pool.query('DELETE FROM curso WHERE codigo = $1', [codigo]);
        if (result.rowCount === 1) {
            return res.status(200).send('Curso Deletado!');
        } else {
            return res.status(404).send('Curso não encontrado');
        }
    } catch (error) {
        return res.status(400).send(error);
    }
});

//ALUNOS
app.get('/alunos', async (req, res) => {
    try {
        const { rows } = await pool.query('SELECT * FROM aluno');
        return res.status(200).send(rows);
    } catch (error) {
        return res.status(400).send(error);
    }
});

//Cadastrar
app.post('/alunos/cadastrar', async (req, res) => {
    console.log(req.body);
    const { nome } = req.body;
    try {
        const newCurso = await pool.query('INSERT INTO aluno (nome) VALUES ($1) RETURNING *', [nome, ]);
        return res.status(200).send(newCurso.rows);
    } catch (error) {
        return res.status(400).send(error);
    }
});

//Editar
app.put('/alunos/atualizar/:codigo', async (req, res) => {
    const codigo = parseInt(req.params.codigo);
    const { nome, } = req.body;
    try {
        const result = await pool.query('UPDATE aluno SET nome = $1 WHERE codigo = $2', [nome, codigo]);
        if (result.rowCount === 1) {
            return res.status(200).send('Aluno Atualizado!');
        } else {
            return res.status(404).send('Aluno não encontrado');
        }
    } catch (error) {
        return res.status(400).send(error);
    }
});

//Deletar
app.delete('/alunos/deletar/:codigo', async (req, res) => {
    const codigo = parseInt(req.params.codigo);

    try {
        const result = await pool.query('DELETE FROM aluno WHERE codigo = $1', [ codigo]);
        if (result.rowCount === 1) {
            return res.status(200).send({'mensagem':'Aluno Deletado!'});
        } else {
            return res.status(404).send('Aluno não encontrado');
        }
    } catch (error) {
        return res.status(400).send(error);
    }
});

//MATRICULA

//Cadastrar
app.post('/matricula/cadastrar', async (req, res) => {
    console.log(req.body);
    const { codigo_curso, codigo_aluno } = req.body;
    try {
        const newCurso = await pool.query('INSERT INTO curso_aluno (codigo_curso, codigo_aluno) VALUES ($1, $2) RETURNING *', [codigo_curso,codigo_aluno, ]);
        return res.status(200).send(newCurso.rows);
    } catch (error) {
        return res.status(400).send(error);
    }
});


app.get('/matricula', async (req, res) => {
    try {
        const newCurso = await pool.query('SELECT * FROM curso_aluno',);
        return res.status(200).send(newCurso.rows);
    } catch (error) {
        return res.status(400).send(error);
    }
});

//remover
app.delete('/matricula/remover/:codigo', async (req, res) => {
    const codigo = parseInt(req.params.codigo);
    try {
        const newCurso = await pool.query('DELETE FROM curso_aluno WHERE codigo = $1',[codigo]);
        return res.status(200).send(newCurso.rows);
    } catch (error) {
        return res.status(400).send(error);
    }
});


app.listen(PORT, () => {
    console.log("sevidor esta funcionando");
})
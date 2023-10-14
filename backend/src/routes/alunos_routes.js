const express = require('express');
const router = express.Router();
const alunosController = require('../controllers/alunos_controller');

// Rota para listar alunos (GET)
router.get('/', alunosController.listarAlunos);

// Rota para cadastrar aluno (POST)
router.post('/cadastrar', alunosController.cadastrarAluno);

// Rota para atualizar aluno (PUT)
router.put('/atualizar/:codigo', alunosController.atualizarAluno);

// Rota para deletar aluno (DELETE)
router.delete('/deletar/:codigo', alunosController.deletarAluno);

module.exports = router;

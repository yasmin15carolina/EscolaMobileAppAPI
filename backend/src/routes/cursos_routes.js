const express = require('express');
const router = express.Router();
const cursosController = require('../controllers/cursos_controller');

router.get('/', cursosController.listarCursos);
router.post('/cadastrar', cursosController.cadastrarCurso);
router.put('/atualizar/:id', cursosController.atualizarCurso);
router.delete('/deletar/:codigo', cursosController.deletarCurso);

module.exports = router;

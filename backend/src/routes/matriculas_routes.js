const express = require('express');
const router = express.Router();
const matriculasController = require('../controllers/matriculas_controller');

// Rota para cadastrar matrícula (POST)
router.post('/cadastrar', matriculasController.cadastrarMatricula);

// Rota para listar matrículas (GET)
router.get('/', matriculasController.listarMatriculas);

// Rota para remover matrícula (DELETE)
router.delete('/remover/:codigo', matriculasController.removerMatricula);

module.exports = router;

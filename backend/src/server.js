const express = require('express');
const app = express();
const cursosRoutes = require('./routes/cursos_routes');
const alunosRoutes = require('./routes/alunos_routes');
const matriculasRoutes = require('./routes/matriculas_routes');

app.use(express.json());
app.use('/cursos', cursosRoutes);
app.use('/alunos', alunosRoutes);
app.use('/matricula', matriculasRoutes);

const PORT = 3000;
app.listen(PORT, () => {
    console.log('Servidor está funcionando');
});

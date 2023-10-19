CREATE TABLE aluno (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE curso (
    codigo SERIAL PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL,
    ementa TEXT
);

CREATE TABLE curso_aluno (
    codigo SERIAL PRIMARY KEY,
    codigo_curso INT NOT NULL,
    codigo_aluno INT NOT NULL,
    FOREIGN KEY (codigo_curso) REFERENCES curso(codigo) ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (codigo_aluno) REFERENCES aluno(codigo) ON DELETE RESTRICT ON UPDATE RESTRICT
);

INSERT INTO aluno (nome) VALUES
    ('João Silva'),
    ('Maria Santos'),
    ('Pedro Oliveira'),
    ('Ana Pereira');

INSERT INTO curso (descricao, ementa) VALUES
    ('Introdução à Programação', 'Este curso aborda os conceitos básicos de programação.'),
    ('Banco de Dados SQL', 'Este curso ensina o uso de SQL para gerenciamento de bancos de dados.'),
    ('Desenvolvimento Web', 'Aprenda a criar aplicativos web com HTML, CSS e JavaScript.');

INSERT INTO curso_aluno (codigo_curso, codigo_aluno) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (1, 4);

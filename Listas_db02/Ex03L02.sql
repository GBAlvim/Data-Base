CREATE TABLE projetos (
    id_projeto INT PRIMARY KEY,
    nome_projeto VARCHAR(100),
    descricao TEXT
);

CREATE TABLE colaboradores (
    id_func INT PRIMARY KEY,
    nome_func VARCHAR(100),
    data_admissao DATE
);


DROP TABLE projetos

CREATE TABLE projetos (
    id_projeto SERIAL PRIMARY KEY,
    nome_projeto VARCHAR(100),
    descricao TEXT
);

DROP TABLE colaboradores

CREATE TABLE colaboradores (
    id_func SERIAL PRIMARY KEY,
    nome_func VARCHAR(100),
    data_admissao DATE
);


CREATE TABLE colaboradores_projetos (
    id_func INT,
    id_projeto INT,
    FOREIGN KEY (id_func) REFERENCES colaboradores(id_func),
    FOREIGN KEY (id_projeto) REFERENCES projetos(id_projeto)
);

SELECT * FROM projetos

INSERT INTO projetos(nome_projeto, descricao) VALUES
('godzilla','iguana gigante'),
('ping pong','david ruim'),
('apm','pague a apm'),
('biblioteca','cadelao'),
('king kong','macaco gigante');

SELECT * FROM colaboradores

INSERT INTO colaboradores (nome_func,data_admissao) VALUES
('cadelao','01/01/2000'),
('caina','02/10/2017'),
('andre','01/01/2013'),
('gabriel','01/10/2018')

SELECT * FROM funcionarios_projetos

INSERT INTO funcionarios_projetos VALUES
(1,2),(2,1),(3,3),(4,1),(1,3)
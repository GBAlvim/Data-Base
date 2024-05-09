CREATE TABLE Alunos (
    RA INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    idade INT,
    endereco VARCHAR(255),
    contato VARCHAR(100)
);

CREATE TABLE Cursos (
    id_curso INT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);

CREATE TABLE Departamentos (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(100) NOT NULL
);

CREATE TABLE Disciplinas (
    id_disciplina INT PRIMARY KEY,
    nome_disciplina VARCHAR(100) NOT NULL
);

CREATE TABLE Disciplinas_Cursos (
    id_disciplina INT,
    id_curso INT,
    PRIMARY KEY (id_disciplina, id_curso),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY,
    RA INT,
    id_disciplina INT,
    FOREIGN KEY (RA) REFERENCES Alunos(RA),
    FOREIGN KEY (id_disciplina) REFERENCES Disciplinas(id_disciplina)
);

CREATE TABLE Status_Aluno (
    RA INT PRIMARY KEY,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (RA) REFERENCES Alunos(RA)
);


--povoando--

INSERT INTO Departamentos (id_departamento, nome_departamento)
VALUES
    (1, 'Saúde'),
    (2, 'Tecnologia'),
    (3, 'Engenharia'),
    (4, 'Humanas');

INSERT INTO Cursos (id_curso, nome_curso, id_departamento)
VALUES
    (1, 'Medicina', 1),
    (2, 'Engenharia Civil', 3),
    (3, 'Ciência da Computação', 2);


INSERT INTO Disciplinas (id_disciplina, nome_disciplina)
VALUES
    (1, 'Anatomia'),
    (2, 'Cálculo'),
    (3, 'Programação Java');


INSERT INTO Alunos (RA, nome, cpf, idade, endereco, contato)
VALUES
    (1001, 'João Silva', '12345678901', 20, 'Rua A, 123', 'joao@email.com'),
    (1002, 'Maria Souza', '98765432109', 22, 'Av. B, 456', 'maria@email.com');


INSERT INTO Disciplinas_Cursos (id_disciplina, id_curso)
VALUES
    (1, 1), -- Anatomia em Medicina
    (2, 2), -- Cálculo em Engenharia Civil
    (2, 3); -- Cálculo em Ciência da Computação


INSERT INTO Matriculas (id_matricula, RA, id_disciplina)
VALUES
    (1, 1001, 1), -- João matriculado em Anatomia
    (2, 1002, 2); -- Maria matriculada em Cálculo


INSERT INTO Status_Aluno (RA, status)
VALUES
    (1001, 'ativo'),
    (1002, 'formado');

--querys--

--Dado o RA ou o Nome do Aluno, buscar no BD todos os demais dados do aluno.--
SELECT * FROM Alunos WHERE RA = 1001;

--Dado o nome de um departamento, exibir o nome de todos os cursos associados a ele.--
SELECT C.nome_curso 
FROM Cursos C
JOIN Departamentos D ON C.id_departamento = D.id_departamento
WHERE D.nome_departamento = 'Tecnologia';

--Dado o nome de uma disciplina, exibir a qual ou quais cursos ela pertence.
SELECT C.nome_curso 
FROM Cursos C
JOIN Disciplinas_Cursos DC ON C.id_curso = DC.id_curso
JOIN Disciplinas D ON DC.id_disciplina = D.id_disciplina
WHERE D.nome_disciplina = 'Programação Java';

--Dado o CPF de um aluno, exibir quais disciplinas ele está cursando.
SELECT D.nome_disciplina 
FROM Disciplinas D
JOIN Matriculas M ON D.id_disciplina = M.id_disciplina
JOIN Alunos A ON M.RA = A.RA
WHERE A.cpf = '12345678901';

--Filtrar todos os alunos matriculados em um determinado curso.
SELECT A.* 
FROM Alunos A
JOIN Matriculas M ON A.RA = M.RA
JOIN Disciplinas_Cursos DC ON M.id_disciplina = DC.id_disciplina
WHERE DC.id_curso = 1;

--Filtrar todos os alunos matriculados em determinada disciplina.
SELECT A.* 
FROM Alunos A
JOIN Matriculas M ON A.RA = M.RA
JOIN Disciplinas D ON M.id_disciplina = D.id_disciplina
WHERE D.nome_disciplina = 'Cálculo';


--Filtrar alunos formados.
SELECT A.* 
FROM Alunos A
JOIN Status_Aluno SA ON A.RA = SA.RA
WHERE SA.status = 'formado';

--Filtrar alunos ativos.
SELECT A.* 
FROM Alunos A
JOIN Status_Aluno SA ON A.RA = SA.RA
WHERE SA.status = 'ativo';

--Apresentar a quantidade de alunos ativos por curso.
SELECT C.nome_curso, COUNT(A.RA) AS qtd_alunos_ativos
FROM Alunos A
JOIN Matriculas M ON A.RA = M.RA
JOIN Disciplinas_Cursos DC ON M.id_disciplina = DC.id_disciplina
JOIN Cursos C ON DC.id_curso = C.id_curso
JOIN Status_Aluno SA ON A.RA = SA.RA
WHERE SA.status = 'ativo'




CREATE TABLE Cursos (
	id_curso int,
	nome_curso varchar(50),
	PRIMARY KEY (id_curso)

);


CREATE TABLE Turmas (
	id_turma int,
	id_curso int,
	professor varchar(50),
	PRIMARY KEY (id_turma),
	FOREIGN KEY (id_curso) REFERENCES Cursos (id_curso)
	

);

CREATE TABLE Alunos (
	id_aluno int,
	nome_aluno varchar(50),
	data_nasc date,
	PRIMARY KEY (id_aluno)
);

ALTER TABLE Alunos ALTER COLUMN data_nasc TYPE date;

CREATE TABLE Turmas_Alunos (
	id_aluno int,
	id_turma int,
	FOREIGN KEY (id_aluno) REFERENCES Alunos (id_aluno),
	FOREIGN KEY (id_turma) REFERENCES Turmas (id_turma)

);

INSERT INTO Cursos VALUES (1, 'Design'),
						  (2, 'Engenharia'),
						  (3, 'Arquitetura'),
						  (4, 'Direito'),
						  (5, 'Matemática'),
						  (6, 'Português'),
						  (7, 'Ed. Fisíca'),
						  (8, 'Mecatrônica'),
						  (9, 'Inglês'),
						  (10, 'Ads');
						  
INSERT INTO Turmas VALUES (1, 1, 'Jõao Augusto'),
						  (2, 2, 'Edgar Master'),
						  (3, 3, 'Eliot Trump'),
						  (4, 4, 'Alberto Delgado'),
						  (5, 5, 'Tamara Vilhosa'),
						  (6, 6, 'Diogines Silva'),
						  (7, 7, 'Paulo Costa'),
						  (8, 8, 'André Souza'),
						  (9, 9, 'Clara Scura'),
						  (10, 10, 'Cainã Antunes');
						  
						  
INSERT INTO Alunos VALUES (1, 'Augusto Cesár', '01/01/2000'),
						  (2, 'Elton Binho', '02/02/2000'),
						  (3, 'Taldo Gilberto', '03/03/2000'),
						  (4, 'Berto Alves', '04/04/2001'),
						  (5, 'TaLin Da Silva', '05/05/2001'),
						  (6, 'Diogo Foz', '06/06/2002'),
						  (7, 'Ana Beatriz Souza', '07/07/2002'),
						  (8, 'Anderson Alves', '08/08/2002'),
						  (9, 'Giovana Antunes', '09/09/2003'),
						  (10, 'Cainã Ribeiro', '10/10/2004');					  
				
 
ALTER TABLE alunos DROP COLUMN data_nasc
ALTER TABLE alunos ADD COLUMN data_nasc date

INSERT INTO Turmas_Alunos VALUES (1,1);
INSERT INTO Turmas_Alunos VALUES (2,2);
INSERT INTO Turmas_Alunos VALUES (3,3);
INSERT INTO Turmas_Alunos VALUES (4,4);
INSERT INTO Turmas_Alunos VALUES (5,5);
INSERT INTO Turmas_Alunos VALUES (6,6);
INSERT INTO Turmas_Alunos VALUES (7,7);
INSERT INTO Turmas_Alunos VALUES (8,8);
INSERT INTO Turmas_Alunos VALUES (9,9);
INSERT INTO Turmas_Alunos VALUES (10,10);




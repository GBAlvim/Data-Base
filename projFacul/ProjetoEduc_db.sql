CREATE TABLE alunos (
	cpf int primary key,
	nome_aluno varchar(50) not null,
	idade int,
	rua text,
	numero varchar(10),
	bairro varchar(20),
	cidade varchar(20),
	estado varchar(20),
	cep int,
	pais varchar(20)

);

ALTER TABLE alunos ALTER COLUMN cpf TYPE varchar(15);

CREATE TABLE telefones (
	cpf varchar(15) REFERENCES alunos,
	ddd int,
	numero int,
	cod_pais int 

);

CREATE TABLE emails(
	cpf varchar(15) REFERENCES alunos,
	email varchar(50),
	dominio varchar(20)

);

ALTER TABLE emails ALTER COLUMN email TYPE varchar(64);

CREATE TABLE departamentos(
	id_dpto serial PRIMARY KEY,
	sigla_dpto varchar(4),
	nome_dpto varchar(10)

);



CREATE TABLE cursos(
	id_curso serial PRIMARY KEY,
	nome_curso varchar(10),
	id_dpto serial REFERENCES departamentos
	

);


CREATE TABLE matriculas(
	ra serial PRIMARY KEY,
	cpf varchar(15) REFERENCES alunos,
	status varchar(10),
	id_curso int REFERENCES cursos
	
);

CREATE TABLE disciplinas(
	id_disciplina serial PRIMARY KEY,
	nome_disciplina varchar(20),
	optativa boolean
	

);


CREATE TABLE cursos_disciplinas(
	id_curso serial REFERENCES cursos,
	id_disciplina serial REFERENCES disciplinas

);


CREATE TABLE matriculas_cursos(
	ra serial REFERENCES matriculas,
	id_disciplina serial REFERENCES disciplinas

);


INSERT INTO alunos (cpf, nome_aluno, idade, rua, numero, bairro, cidade, estado, cep, pais) VALUES
(12345678901, 'João Silva', 20, 'Rua A', '123', 'Centro', 'São Paulo', 'SP', 12345678, 'Brasil'),
(23456789012, 'Maria Santos', 22, 'Rua B', '456', 'Vila Nova', 'Rio de Janeiro', 'RJ', 23456789, 'Brasil'),
(34567890123, 'Carlos Oliveira', 25, 'Rua C', '789', 'Jardim', 'Belo Horizonte', 'MG', 34567890, 'Brasil'),
(45678901234, 'Ana Pereira', 19, 'Rua D', '1011', 'Centro', 'Curitiba', 'PR', 45678901, 'Brasil'),
(56789012345, 'Pedro Souza', 21, 'Rua E', '1213', 'Centro', 'Porto Alegre', 'RS', 56789012, 'Brasil'),
(67890123456, 'Mariana Costa', 24, 'Rua F', '1415', 'Jardim', 'Salvador', 'BA', 67890123, 'Brasil'),
(78901234567, 'Fernando Santos', 26, 'Rua G', '1617', 'Vila Nova', 'Fortaleza', 'CE', 78901234, 'Brasil'),
(89012345678, 'Amanda Oliveira', 20, 'Rua H', '1819', 'Centro', 'Recife', 'PE', 89012345, 'Brasil'),
(90123456789, 'Gustavo Lima', 23, 'Rua I', '2021', 'Jardim', 'Manaus', 'AM', 90123456, 'Brasil');


INSERT INTO departamentos (sigla_dpto, nome_dpto) VALUES ('SAUD', 'SAUDE'),
								 ('TECN','TECNOLOGIA'),
								 ('ENGE', 'ENGENHARIA'),
								 ('HUMA', 'HUMANAS');
								 
								 
					
ALTER TABLE cursos ALTER COLUMN nome_curso TYPE varchar(50);

INSERT INTO cursos (nome_curso, id_dpto) VALUES
('Medicina', 1),
('Enfermagem', 1),
('Nutrição', 1),
('Ciência da Computação', 2),
('Engenharia de Software', 2),
('Inteligência Artificial', 2),
('Engenharia Civil', 3),
('Engenharia Elétrica', 3),
('Engenharia Mecânica', 3),
('Psicologia', 4),
('História', 4),
('Sociologia', 4);


INSERT INTO matriculas (cpf,status,id_curso) VALUES
(12345678901, 'ativo', 1),
(23456789012, 'inativo', 1),
(34567890123, 'formado',3),
(45678901234, 'ativo',5),
(56789012345, 'inativo',5),
(67890123456, 'formado',7),
(78901234567, 'ativo',12),
(89012345678, 'formado',7),
(90123456789, 'inativo',10),
(67890123456, 'formado',10),
(78901234567, 'ativo',11),
(89012345678, 'formado',2),
(90123456789, 'inativo',4);
							
							
						
INSERT INTO disciplinas						
						
							
								 
								 


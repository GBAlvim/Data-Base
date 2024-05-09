CREATE DOMAIN dm_descricao VARCHAR(255);

CREATE TABLE Livros (
	isbn INTEGER NOT NULL,
    titulo VARCHAR(50),
	id_editora INTEGER,
	ano_publicacao INTEGER,
	PRIMARY KEY (isbn)

);

CREATE TABLE Autores (
	id_autor INTEGER NOT NULL,
	nome VARCHAR(255),
	PRIMARY KEY (id_autor)

);

CREATE TABLE Livros_Autores (
    isbn INTEGER,
    id_autor INTEGER,
    FOREIGN KEY (isbn) REFERENCES Livros (isbn),
    FOREIGN KEY (id_autor) REFERENCES Autores (id_autor)
);

ALTER TABLE Livros ADD COLUMN titulo VARCHAR(50);
ALTER TABLE Livros ADD COLUMN editora VARCHAR(100)

INSERT INTO Livros (isbn, titulo, editora, ano_publicacao) VALUES
('001', 'Walt Disney: O Triunfo da imaginação americana', 'Novo Século', '2006'),
('002', 'Neural Networks and Deep Learning', 'Springer', '2018'),
('003', 'Superinteligência: Caminhos, perigos, estratégias', 'DarkSide', '2014');


INSERT INTO Autores (id_autor, nome) VALUES
('121', 'Neal Gabler'),
('112', 'Michael Nielsen'),
('212', 'Nick Bostrom');


INSERT INTO Livros_Autores (isbn, id_autor) VALUES
('001', 121),
('002', 112),
('003', 212);


--A--
SELECT * FROM Livros_Autores;

--B--
SELECT * FROM Livros_Autores WHERE id_autor='212';

--C--
SELECT * FROM Livros_Autores WHERE isbn='003';



CREATE TABLE Departamentos(
	id_Depto int primary key,
	nomeDepto varchar(50)
);


CREATE TABLE funcionarios(
	idFunc int primary key,
	id_Depto int,
	CONSTRAINT fk_Depto FOREIGN KEY (id_Depto) REFERENCES departamentos (id_Depto),
	nomeFunc varchar(100),
	dataAdmissao date,
	cargo varchar(50)
);

SELECT * FROM departamentos
SELECT * FROM funcionarios

INSERT INTO departamentos VALUES (1,'Desenvolvimento de Software'),
								 (2,'Recursos Humanos'),
								 (3,'Marketing'),
								 (4,'Qualidade de Software'),
								 (5,'Contabilidade');							
								 
INSERT INTO funcionarios VALUES (1,1,'Gabriel Barbosa', '20/03/2022', 'Gerente de Desenvolvimento'),
								(2,2,'Éverton Ribeiro', '20/03/2022', 'Gerente de Recursos Humanos'),
								(3,3,'Diego Ribas', '20/03/2022', 'Gerente de Marketing'),
								(4,4,'Gustavo Scarpa', '22/03/2022', 'Gerente de Qualidade de Software'),
								(5,5,'Givanildo Vieira de Souza', '22/03/2022', 'Gerente de Contabilidade'),
								(6,1,'Nacho Fernández', '22/03/2022', 'Desenvolvedor Senior'),
								(7,2,'João Paulo', '22/03/2022', 'Analista de Recursos Humanos'),
								(8,3,'Diego Souza', '12/08/2022', 'Analista de Marketing'),
								(9,4,'Wardell Stephen Curry', '12/08/2022', 'Analista de Qualidade de Software'),
								(10,5,'Wardell Stephen Curry', '12/08/2022', 'Analista Contábil');
								
select * from funcionarios;
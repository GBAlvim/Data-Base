--tabela clientes
CREATE TABLE client (
	idClient int primary key, 
	cpf varchar(14) unique,  
	firstName text not null, 
	lastName text,
	address text
);

--tabela produto
CREATE TABLE product (
	idProduct int primary key,
	client_idClient int,
	foreign key (client_idClient) references client(idClient),
	productName varchar(50),
	brand varchar(20),
	category varchar(50),
	price decimal	
);

--Adicionando colunas
ALTER TABLE client ALTER COLUMN address TYPE varchar(50)

--Vizualizando tabelas
SELECT * FROM client;
SELECT * FROM product;

--Adicionando restrições
ALTER TABLE product ALTER COLUMN productName SET NOT NULL

--Inserindo dados na tabela
INSERT INTO client VALUES(
	1,
	'111.111.111-11',
	'Abel',''
	'Praça Roberto Mange, 50, Sorocaba-SP'
);

--Inserindo dados na tabela
INSERT INTO client (cpf, firstname, idClient, address)
VALUES ('111.111.111-13','Jubile', 3, '')
INSERT INTO product VALUES (1, 1, 'Playstation 5', 'Sony', 'Eletrônicos', 3.800)
INSERT INTO product VALUES (2, 2, 'iPhone', 'Apple', 'Eletrônicos', 4.200)
INSERT INTO product VALUES (3, 3, 'SmarTV', 'Samsung', 'Eletrônicos', 3.100)
--Alterando dados na tabela
UPDATE client SET address='Rua 1' WHERE idClient = 1
UPDATE product SET price=4000 WHERE idProduct = 2
UPDATE product SET price=3800 WHERE idProduct = 1
UPDATE product SET price=3500 WHERE idProduct = 3
UPDATE product SET price=price-10 WHERE price>=4000

DROP TABLE product;
DROP TABLE client CASCADE;

CREATE TABLE clients (
	idclient SERIAL PRIMARY KEY,
	cpf varchar(14),
	firstname text,
	lastname text,
	address text
);

CREATE TABLE products (
	idproduct SERIAL PRIMARY KEY,
	idclient int,
	CONSTRAINT fk_client FOREIGN KEY (idclient) REFERENCES clients (idclient),
	productname varchar(50),
	brand varchar(20),
	category varchar(20),
	discount numeric,
	price numeric
);

INSERT INTO clients (cpf,firstname,lastname,address) VALUES
('000.000.000-00','Rodrigo','Junior','Rua 00, 000, Bairro 0'),
('111.111.111-11','Joao','Silva','Rua 01, 100, Bairro 1'),
('222.222.222-22','Maria','Gomez','Rua 02, 200, Bairro 2'),
('333.333.333-33','José','Andrade','Rua 03, 300, Bairro 3'),
('444.444.444-44','Bruno','Silveira','Rua 04, 400, Bairro 4'),
('555.555.555-55','Ana','Cabral','Rua 05, 500, Bairro 5'),
('666.666.666-66','Lucia','Silva','Rua 06, 600, Bairro 6'),
('777.777.777-77','Antonio','Mange','Rua 07, 700, Bairro 7'),
('888.888.888-88','Nicolas','Silva','Rua 08, 800, Bairro 8'),
('999.999.999-99','Sandra','Fourlan','Rua 09, 900, Bairro 9');

INSERT INTO products (idclient,productname,brand,category,discount,price) VALUES
(2,'Headset','jbl','eletronicos',0.1,195.89),
(1,'notebook','dell','eletronicos',0.12,3500.00),
(10,'cadeira gammer','dragon','imobiliario',0.0,1630.9),
(2,'mesa para computador','dragon','imobiliario',0.0,695.89),
(1,'mouse','dell','eletronicos',0.12,124.79),
(3,'prateleira',null,'imobiliario',0.0,80.9),
(5,'postit','faber castel','papelaria',0.02,5.29),
(8,'lapiseira','pentel','papelaria',0.02,18.9);

--Comandos DQL (Data Query Language)--

--Visualizando a tabela de clientes
SELECT * FROM clients

--Selecionando colunas específicas
SELECT firstname, lastname FROM clients

--Visualizando a tabela products
SELECT * FROM products

--Selecionando colunas específicas
SELECT productname, price, discount, price*discount AS "Desconto em reais" FROM products

--DESAFIO: exibir nome do produto, preço e preço com desconto
SELECT productname, price, price-price*discount AS "Preço com desconto" FROM products

--Seleciona valores sem exibir linhas duplicadas
SELECT DISTINCT brand FROM products

--Calculadora
SELECT 11%2

-- O SELECT também pode ser utilizado para chamar funcões
SELECT random();

--SELECT com claúsula WHERE
--Operadores de comparação: >, <, >=, =, <=, <> ou !=
--Exibir products com valor acima de 100 reais
SELECT productname, price FROM products WHERE price >= 100 

--Operadores lógicos: AND, OR e NOT
--Produtos entre 100 e 800 reais
SELECT productname, price FROM products WHERE price >= 100 AND price <= 800
--Alternativa 
SELECT productname, price FROM products WHERE price BETWEEN 100 AND 800

--DESAFIO: Produtos cujo preço esteja abaixo de 100 e acima de 800
SELECT productname, price FROM products WHERE price <= 100 OR price >= 800

--DESAFIO: listar todos os produtos da marca Dell
SELECT productname, brand FROM products WHERE brand = 'dell'

--DESAFIO: listar todos os produtos comprados por João
SELECT productname FROM products Where idclient = 2   

--DESAFIO: listar todos clientes com id par
SELECT * FROM clients WHERE idclient % 2 = 0
--Alternativa
SELECT idclient, firstname FROM clients WHERE idclient % 2 = 0

--Função COUNT
--Quantos produtos foram vendidos no total
SELECT COUNT (idproduct) FROM products

--Função AVG (média)
--Qual o preço médio dos produtos vendidos
SELECT AVG(price) FROM products

--Função MAX (máximo)
--Qual o maior preço vendido
SELECT MAX(price) FROM products

--Função MIN (mínimo)
--Qual o menor preço vendido
SELECT MIN(price) FROM products

--Funçao SUM (soma)
--Qual valor total vendido
SELECT SUM(price) FROM products

--Função ORDER BY / DESC
SELECT * FROM clients ORDER BY firstname
SELECT * FROM clients ORDER BY lastname DESC

-- Exercícios:

-- 1. Quantos produtos da marca dell foram vendidos?
SELECT COUNT(idproduct) FROM products WHERE brand = 'dell'

-- 2. Quantos produtos João comprou?
SELECT COUNT(idclient) FROM products WHERE idclient = (SELECT idclient FROM clients WHERE firstname = 'João') 

-- 3. Qual o preço médio dos produtos da dell?
SELECT AVG(price) FROM products WHERE brand = 'dell'

-- 4. Qual o produto mais caro vendido?
SELECT MAX(price) FROM products

-- 5. Qual o produto mais barato vendido?
SELECT MIN(price) FROM products

-- 6. Qual o valor total de equipamentos dell vendidos?
SELECT SUM(price) FROM products WHERE brand = 'dell'

-- 7. Quanto Rodrigo já gastou no eCommerce?
SELECT SUM(price) FROM products WHERE idclient = 1

-- 8. Exiba todos os produtos da catergoria eletronicos ordenados do mais barato para o mais caro.
SELECT * FROM products ORDER BY price 

-- 9. Exiba todos os produtos comprados por Rodrigo ordenados do mais caro para o mais barato.
SELECT productname, price FROM products WHERE idclient = 1 ORDER BY price DESC


--****************************--
--         Preparação         --
--****************************--

-- Adicionar produtos que não foram comprados
INSERT INTO products (productname,brand,category,discount,price) VALUES
('impressora','hp','eletronicos',0.12,489.9),
('luminaria','ge','eletronicos',0.5,46.80),
('drone','dji','eletronico',0.12,9856.0)

--Cross Join
SELECT * FROM clients,products
SELECT * FROM clients CROSS JOIN products

--Inner Join (relaciona PK/FK)
SELECT firstname,productname FROM clients INNER JOIN products ON clients.idclient = products.idclient
WHERE firstname='Rodrigo' OR firstname='rodrigo'

SELECT * FROM clients INNER JOIN products USING (idclient)

SELECT * FROM clients NATURAL INNER JOIN products

SELECT clients.firstname, products.productname FROM clients FULL JOIN products USING (idclient);

-- Exercicios:
-- 1. Quais clientes compraram produtos da categoria eletrônicos?
SELECT clients.firstname, products.productname, products.category FROM clients INNER JOIN products USING (idclient) WHERE PRODUCTS.CATEGORY='eletronicos'

-- 2. Quais clientes não compraram nenhum produto?
SELECT clients.firstname, clients.lastname, products.productname FROM clients LEFT JOIN products USING (idclient) WHERE products.idproduct IS NULL

-- 3. Quais produtos não foram vendidos?
SELECT productname FROM products WHERE idclient IS NULL

-- 4. Quais produtos Rodrigo comprou?
SELECT clients.firstname, products.productname FROM clients INNER JOIN products USING (idclient) WHERE clients.firstname = 'Rodrigo' 

-- 5. Quais clientes compraram produtos da marca DELL?
SELECT clients.firstname, products.productname, products.brand FROM clients INNER JOIN products USING (idclient) WHERE brand='dell'






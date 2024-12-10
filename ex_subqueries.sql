/*
  Exercício sobre Subqueries - Banco de Dados
  Nome: André Takeo Miiada Caseiro
  Prontuário: CP3016391
*/

CREATE DATABASE IF NOT EXISTS ex_subqueries;
USE ex_subqueries;

/*
1: Funcionários com Salário Acima da Média
	Você tem uma tabela funcionarios com informações sobre cada funcionário, incluindo o nome e o salário. Seu objetivo é encontrar os funcionários que têm um salário superior à média de todos os funcionários.
*/
CREATE TABLE funcionarios (
id INT PRIMARY KEY,
nome VARCHAR(100),
salario DECIMAL(10, 2)
);

-- Inserir dados de exemplo
INSERT INTO funcionarios (id, nome, salario) VALUES
(1, 'Ana', 3000.00),
(2, 'Carlos', 4500.00),
(3, 'Beatriz', 5000.00),
(4, 'João', 2500.00),
(5, 'Lucas', 3500.00);

-- Escreva uma consulta SQL que retorne o nome e o salário de todos os funcionários cujo salário seja superior à média de todos os salários na tabela.
SELECT nome, salario FROM funcionarios WHERE salario > (SELECT AVG(salario) FROM funcionarios);

/*
2: Departamentos com Mais de 5 Funcionários
	Você tem uma tabela funcionarios com a coluna departamento_id, que relaciona cada funcionário a um departamento, e uma tabela departamentos com o nome do departamento. Seu objetivo é listar os departamentos que têm mais de 5 funcionários.
*/
CREATE TABLE departamentos (
departamento_id INT PRIMARY KEY,
nome_departamento VARCHAR(100)
);

DROP TABLE IF EXISTS funcionarios;

CREATE TABLE funcionarios (
id INT PRIMARY KEY,
nome VARCHAR(100),
departamento_id INT,
salario DECIMAL(10, 2),
FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
);

-- Inserir dados de exemplo
INSERT INTO departamentos (departamento_id, nome_departamento)
VALUES (1, 'Recursos Humanos'),
(2, 'TI'),
(3, 'Marketing');

INSERT INTO funcionarios (id, nome, departamento_id, salario) VALUES
(1, 'Ana', 1, 3000.00),
(2, 'Carlos', 1, 4500.00),
(3, 'Beatriz', 2, 5000.00),
(4, 'João', 2, 2500.00),
(5, 'Lucas', 2, 3500.00),
(6, 'Pedro', 3, 2000.00),
(7, 'Maria', 3, 4500.00),
(8, 'José', 2, 3000.00),
(9, 'Rafael', 2, 4000.00),
(10, 'Renata', 1, 3300.00);

-- Escreva uma consulta SQL que retorne o nome dos departamentos que têm mais de 5 funcionários.
SELECT nome_departamento FROM departamentos WHERE departamento_id IN (SELECT departamento_id FROM funcionarios GROUP BY departamento_id HAVING COUNT(funcionarios.id) >= 5);

/*
3: Funcionário com o Maior Salário em Cada Departamento
	A tabela funcionarios contém informações sobre os funcionários, incluindo o departamento e o salário. Seu objetivo é encontrar o funcionário com o maior salário em cada departamento.
*/

DROP TABLE IF EXISTS departamentos;

CREATE TABLE departamentos (
departamento_id INT PRIMARY KEY,
nome_departamento VARCHAR(100)
);

DROP TABLE IF EXISTS funcionarios;

CREATE TABLE funcionarios (
id INT PRIMARY KEY,
nome VARCHAR(100),
departamento_id INT,
salario DECIMAL(10, 2),
FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id)
);

-- Inserir dados de exemplo
INSERT INTO departamentos (departamento_id, nome_departamento)
VALUES (1, 'Recursos Humanos'),
(2, 'TI'),
(3, 'Marketing');

INSERT INTO funcionarios (id, nome, departamento_id, salario) VALUES
(1, 'Ana', 1, 3000.00),
(2, 'Carlos', 1, 4500.00),
(3, 'Beatriz', 2, 5000.00),
(4, 'João', 2, 2500.00),
(5, 'Lucas', 2, 3500.00),
(6, 'Pedro', 3, 2000.00),
(7, 'Maria', 3, 4500.00),
(8, 'José', 2, 5000.00),
(9, 'Rafael', 2, 4000.00),
(10, 'Renata', 1, 3300.00);

-- Escreva uma consulta SQL que retorne o nome, o departamento e o salário do funcionário que tem o maior salário em cada departamento.
SELECT f.nome, f.salario, d.nome_departamento FROM funcionarios f, departamentos d WHERE f.salario IN (SELECT MAX(f.salario) FROM funcionarios f GROUP BY f.departamento_id) and d.departamento_id = f.departamento_id;

/*
4: Identificar Funcionários que Não Têm Chefes
  A tabela funcionarios possui um campo chefe_id que armazena o ID do chefe de cada funcionário (caso exista). Seu objetivo é listar todos os funcionários que não têm chefe, ou seja, onde o campo chefe_id é NULL
*/

DROP TABLE IF EXISTS funcionarios;

CREATE TABLE funcionarios (
id INT PRIMARY KEY,
nome VARCHAR(100),
salario DECIMAL(10, 2),
chefe_id INT,
FOREIGN KEY (chefe_id) REFERENCES funcionarios(id)
);

-- Inserir dados de exemplo
INSERT INTO funcionarios (id, nome, salario, chefe_id)
VALUES (1, 'Ana', 3000.00, NULL),
(2, 'Carlos', 4500.00, 1),
(3, 'Beatriz', 5000.00, 1),
(4, 'João', 2500.00, NULL),
(5, 'Lucas', 3500.00, 2),
(6, 'Pedro', 2000.00, 2),
(7, 'Maria', 4500.00, 3),
(8, 'José', 3000.00, NULL);

-- Escreva uma consulta SQL que retorne os nomes dos funcionários que não têm chefe (onde chefe_id é NULL).
SELECT nome FROM funcionarios WHERE chefe_id IS NULL;

/*
5: Produtos com Preço Acima da Média por Categoria
	Você tem uma tabela produtos que contém informações sobre produtos vendidos, incluindo o preço e a categoria de cada produto. Seu objetivo é listar os produtos que têm um preço superior à média de preço dentro de sua própria categoria.
*/
CREATE TABLE categorias (
categoria_id INT PRIMARY KEY,
nome_categoria VARCHAR(100)
);

CREATE TABLE produtos (
id INT PRIMARY KEY,
nome_produto VARCHAR(100),
categoria_id INT,
preco DECIMAL(10, 2),
FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id)
);

-- Inserir dados de exemplo
INSERT INTO categorias (categoria_id, nome_categoria)
VALUES (1, 'Eletrônicos'),
(2, 'Móveis'),
(3, 'Roupas');

INSERT INTO produtos (id, nome_produto, categoria_id, preco)
VALUES (1, 'Celular', 1, 1500.00),
(2, 'TV', 1, 2500.00),
(3, 'Sofá', 2, 1200.00),
(4, 'Mesa', 2, 800.00),
(5, 'Camiseta', 3, 50.00),
(6, 'Calça Jeans', 3, 120.00),
(7, 'Notebook', 1, 3500.00),
(8, 'Cadeira', 2, 400.00);

-- Escreva uma consulta SQL que retorne o nome, a categoria e o preço de todos os produtos cujo preço seja superior à média de preço dos produtos na mesma categoria.
SELECT p.nome_produto, p.preco, c.nome_categoria FROM produtos p, categorias c WHERE p.preco > (SELECT AVG(preco) FROM produtos) AND c.categoria_id = p.categoria_id;
/*
Exercício Subqueries - Gerenciamento de Banco de Dados
Nome: André Takeo Miiada Caseiro
Prontuário: CP3016391
*/

CREATE DATABASE IF NOT EXISTS ex_subqueries_v2;
USE ex_subqueries_v2;

/*
1) Você está ajudando uma loja de livros a organizar suas vendas.
Tabelas:
autores (id, nome)
*/
CREATE TABLE autores(
	id int primary key,
    nome varchar(30) NOT NULL
);

INSERT INTO autores (id, nome) VALUES
(1, 'J.K. Rowling'),
(2, 'George R.R. Martin'),
(3, 'J.R.R. Tolkien'),
(4, 'Agatha Christie'),
(5, 'Stephen King'),
(6, 'Isaac Asimov'),
(7, 'Mark Twain'),
(8, 'Ernest Hemingway'),
(9, 'F. Scott Fitzgerald'),
(10, 'Jane Austen'),
(11, 'Charles Dickens'),
(12, 'Leo Tolstoy'),
(13, 'H.G. Wells'),
(14, 'Ray Bradbury'),
(15, 'Harper Lee'),
(16, 'Toni Morrison'),
(17, 'Gabriel García Márquez'),
(18, 'Kurt Vonnegut'),
(19, 'Virginia Woolf'),
(20, 'Franz Kafka'),
(21, 'Margaret Atwood'),
(22, 'Dante Alighieri'),
(23, 'Herman Melville'),
(24, 'Oscar Wilde'),
(25, 'John Steinbeck'),
(26, 'C.S. Lewis'),
(27, 'Philip K. Dick'),
(28, 'Neil Gaiman'),
(29, 'Chuck Palahniuk'),
(30, 'David Foster Wallace'),
(31, 'Zadie Smith'),
(32, 'Salman Rushdie'),
(33, 'Alice Walker'),
(34, 'Cormac McCarthy'),
(35, 'John Grisham'),
(36, 'Dan Brown'),
(37, 'Michael Connelly'),
(38, 'Patricia Highsmith'),
(39, 'Elena Ferrante'),
(40, 'Colson Whitehead'),
(41, 'Jhumpa Lahiri'),
(42, 'Chimamanda Ngozi Adichie'),
(43, 'Stephen Hawking'),
(44, 'Richard Dawkins'),
(45, 'Bill Bryson'),
(46, 'Malcolm Gladwell'),
(47, 'Yuval Noah Harari'),
(48, 'Brene Brown'), 
(49, 'Ruth Ozeki'), 
(50, 'Terry Pratchett');

-- livros (id, titulo, preco, autor_id)
CREATE TABLE livros(
	id int primary key,
    titulo varchar(30) NOT NULL,
	preco decimal(5,2) NOT NULL,
    autor_id int,
    foreign key (autor_id) references autores(id)
);

INSERT INTO livros (id, titulo, preco, autor_id) VALUES
(1 , 'Dom Casmurro', 39.90 , 1),
(2 , 'O Guarani', 39.90 , 1),
(3 , 'Memórias Póstumas de Brás', 39.90 , 1),
(4 , 'A Moreninha', 39.90 , 1),
(5 , 'O Primo Basílio', 39.90 , 1),
(6 , 'A Hora da Estrela', 49.90 , 2),
(7 , 'Grande Sertão: Veredas', 49.90 , 2),
(8 , 'Capitães da Areia', 49.90 , 2),
(9 , 'Iracema', 49.90 , 2),
(10,'Senhora', 49.90 , 2),
(11,'O Cortiço', 59.90 , 3),
(12,'A Escrava Isaura', 59.90 , 3),
(13,'O Alienista', 59.90 , 3),
(14,'Os Sertões', 29.90 , 4),
(15,'A Moreninha', 29.90 , 4),
(16,'O Guarani', 29.90 , 4),
(17,'A Metamorfose', 39.90 , 5),
(18,'O Tempo e o Vento', 39.90 , 5),
(19,'O Sítio do Picapau Amarelo', 39.90 , 5),
(20,'Memórias de um Sargento', 29.90 , 6),
(21,'O Casamento de Pequena Fera', 29.90 , 6),
(22,'A Casa dos Espíritos', 29.90 , 6),
(23,'Fogo Morto', 19.90 , 7),
(24,'Vidas em Cruz', 19.90 , 7),
(25,'O Mundo é das Mulheres', 24.90 , 8),
 (26,'As Meninas',24.90 ,8 ),
 (27,'O Filho da Mãe',34.90 ,9 ),
 (28,'O Encontro Marcado',34.90 ,9 ),
 (29,'A Paixão Segundo G.H.',29.90 ,10 ),
 (30,'A Cidade e as Serras',29.90 ,10 ),
 (31,'Cem Anos de Solidão',29.90 ,11 ),
 (32,'Crônica de uma Morte Anunciada',29.90 ,11), 
 (33,'Dom Quixote das Crianças',19.90 ,12), 
 (34,'O Pequeno Príncipe Brasileiro',19.90 ,12), 
 (35,'O Menino Maluquinho',24.90 ,13), 
 (36,'Fazendo Meu Filme',24.90 ,13), 
 (37,'A Bolsa Amarela',29.90 ,14), 
 (38,'O Diário de Anne Frank',29.90 ,14), 
 (39,'A Menina que Roubava Livros',24.90 ,15), 
 (40,'O Último dos Moicanos',24.90 ,15), 
 (41,'As Aventuras de Tom Sawyer',34.90 ,16), 
 (42,'Trem Noturno para Lisboa',34.90 ,16), 
 (43,'A Revolução dos Bichos',39.90 ,17), 
 (44,'1984 Brasileiro',39.90 ,17), 
 (45,'Coração Andarilho',24.90 ,18), 
 (46,'A Árvore das Palavras',24.90 ,18), 
 (47,'Morte e Vida Severina',29.90 ,19), 
 (48,'O Livro dos Espíritos ',29.90 ,19), 
 (49,'Capitães da Areia ',19.90 ,20), 
 (50,'Os Miseráveis',19.90 ,20);

-- vendas (id, livro_id, quantidade)
CREATE TABLE vendas(
	id int primary key,
    livro_id int,
    quantidade int NOT NULL,
    foreign key (livro_id) references livros(id)
);

INSERT INTO vendas (id, livro_id, quantidade) VALUES
(1,   1,   2),
(2,   2,   3),
(3,   3,   1),
(4,   4,   5),
(5,   5,   4),
(6,   6,   2),
(7,   7,   1),
(8,   8,   3),
(9,   9,   6),
(10,10,   2),
(11,11,   3),
(12,12,   1),
(13,13,   4),
(14,14,   5),
(15,15,   2),
(16,16,   3),
(17,17,   1),
(18,18,   4),
(19,19,   6),
(20,20,   2),
(21,21,   5), 
(22,22,   3), 
(23,23,   2), 
(24,24,   1), 
(25,25,   4), 
(26,26,   6), 
(27,27,   3), 
(28,28,   2), 
(29,29,   5), 
(30,30,   1), 
(31,31,   4), 
(32,32,   2), 
(33,33,   3), 
(34,34,   1), 
(35,35,   4), 
(36,36,5),   
(37,37,2),   
(38,38,3),   
(39,39,1),   
(40,40,6),   
(41,41,3),   
(42,42,5),   
(43,43,2),   
(44,44,4),   
(45,45,1),   
(46,46,7),   
(47,47,3),   
(48,48,5),   
(49,49,2),   
(50,50,8);  

-- Liste os títulos dos livros que já venderam pelo menos 5 unidades. Use uma subquery para calcular o total de unidades vendidas para cada livro.
SELECT titulo FROM livros WHERE id IN (SELECT livro_id FROM vendas GROUP BY livro_id HAVING SUM(quantidade) >= 5);

/*
2) Uma plataforma de streaming quer entender melhor os hábitos de seus
usuários.
Tabelas:
usuarios (id, nome, plano)
*/
CREATE TABLE usuarios(
	id int primary key,
    nome varchar(30) NOT NULL,
    plano varchar(30) NOT NULL
);

INSERT INTO usuarios (id, nome, plano) VALUES
(1, 'Alice Silva', 'Básico'),
(2, 'Bruno Costa', 'Premium'),
(3, 'Carla Oliveira', 'Básico'),
(4, 'Daniel Santos', 'Padrão'),
(5, 'Eduarda Lima', 'Premium'),
(6, 'Fernando Rocha', 'Básico'),
(7, 'Gabriela Martins', 'Padrão'),
(8, 'Henrique Almeida', 'Premium'),
(9, 'Isabella Ferreira', 'Básico'),
(10, 'João Pedro', 'Padrão'),
(11, 'Karina Mendes', 'Premium'),
(12, 'Lucas Ribeiro', 'Básico'),
(13, 'Mariana Souza', 'Padrão'),
(14, 'Nicolas Pereira', 'Premium'),
(15, 'Olivia Dias', 'Básico'),
(16, 'Paulo Gomes', 'Padrão'),
(17, 'Quiteria Nunes', 'Premium'),
(18, 'Rafael Teixeira', 'Básico'),
(19, 'Sofia Alves', 'Padrão'),
(20, 'Tiago Martins', 'Premium');

-- filmes (id, titulo, genero)
CREATE TABLE filmes(
	id int primary key,
    titulo varchar(50) NOT NULL,
    genero varchar(20) NOT NULL
);

INSERT INTO filmes (id, titulo, genero) VALUES
(1, 'A Origem', 'Ação'),
(2, 'O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia'),
(3, 'Matrix', 'Ficção Científica'),
(4, 'O Rei Leão', 'Animação'),
(5, 'Os Vingadores', 'Ação'),
(6, 'Titanic', 'Romance'),
(7, 'Jurassic Park', 'Aventura'),
(8, 'Star Wars: Uma Nova Esperança', 'Ficção Científica'),
(9, 'Coco', 'Animação'),
(10, 'O Silêncio dos Inocentes', 'Suspense'),
(11, 'Gladiador', 'Ação'),
(12, 'Forrest Gump', 'Drama'),
(13, 'O Exorcista', 'Terror'),
(14, 'Harry Potter e a Pedra Filosofal', 'Fantasia'),
(15, "A Bela e a Fera", "Animação"),
(16, "Os Incríveis", "Animação"),
(17, "Mad Max: Estrada da Fúria", "Ação"),
(18, "O Lobo de Wall Street", "Drama"),
(19, "Parasita", "Drama"),
(20, "Avatar", "Ficção Científica");

-- visualizacoes (id, usuario_id, filme_id, data_visualizacao)
CREATE TABLE visualizacoes(
	id int primary key,
    usuario_id int,
    filme_id int,
    data_visualizacao date NOT NULL,
    foreign key (usuario_id) references usuarios(id),
    foreign key (filme_id) references filmes(id)
);

INSERT INTO visualizacoes (id, usuario_id, filme_id, data_visualizacao) VALUES
(1, 3, 7, '2023-05-15'), 
(2, 1, 2, '2023-06-20'), 
(3, 4, 5, '2023-07-10'), 
(4, 2, 1, '2023-08-05'), 
(5, 6, 9, '2023-09-12'), 
(6, 8, 4, '2023-11-22'), 
(7, 5, 8, '2023-10-15'), 
(8, 7, 3, '2024-01-01'), 
(9, 10, 6, '2024-01-18'), 
(10, 9, 10,'2023-03-03'), 
(11, 2 ,11,'2023-12-25'), 
(12 ,1 ,12,'2024-01-04'), 
(13 ,5 ,8,'2023-04-28'), 
(14 ,14 ,14,'2024-01-10'), 
(15 ,15 ,15,'2023-02-19'), 
(16 ,16 ,17,'2023-12-30'), 
(17 ,18 ,20,'2024-01-15'), 
(18 ,19 ,19,'2023-09-29'), 
(19 ,20 ,1,'2023-11-11'), 
(20 ,1 ,6 ,'2024-01-03');

-- Encontre o título dos filmes assistidos por usuários com plano "Premium", mas que não foram assistidos por nenhum usuário com plano "Básico". Use subqueries para identificar os filmes que atendem a essa condição.
SELECT titulo FROM filmes WHERE id IN (SELECT v.filme_id FROM visualizacoes v, usuarios u WHERE u.plano = 'Premium' AND v.usuario_id = u.id);

/*
3) Uma agência de viagens quer analisar quais destinos são
mais populares entre os clientes VIPs.
Tabelas:
clientes (id, nome, tipo_cliente) — tipo_cliente pode ser 'Normal' ou 'VIP'.
*/
CREATE TABLE clientes(
	id int primary key,
    nome varchar(30) NOT NULL,
    tipo_cliente varchar(6) NOT NULL,
    CONSTRAINT chk_tipo_cliente CHECK (tipo_cliente = 'Normal' OR tipo_cliente = 'VIP')
);

INSERT INTO clientes (id, nome, tipo_cliente) VALUES
(1, 'Alice Silva', 'Normal'),
(2, 'Bruno Costa', 'VIP'),
(3, 'Carla Mendes', 'Normal'),
(4, 'Daniel Oliveira', 'VIP'),
(5, 'Eduarda Santos', 'Normal'),
(6, 'Fernando Lima', 'VIP'),
(7, 'Gabriela Rocha', 'Normal'),
(8, 'Henrique Pereira', 'VIP'),
(9, 'Isabela Martins', 'Normal'),
(10, 'João Souza', 'VIP'),
(11, 'Karina Almeida', 'Normal'),
(12, 'Lucas Ferreira', 'VIP'),
(13, 'Mariana Nascimento', 'Normal'),
(14, 'Nicolas Ribeiro', 'VIP'),
(15, 'Olivia Cardoso', 'Normal'),
(16, 'Paulo Santos', 'VIP'),
(17, 'Quésia Lima', 'Normal'),
(18, 'Rafael Gomes', 'VIP'),
(19, 'Sofia Almeida', 'Normal'),
(20, 'Tiago Silva', 'VIP');

-- destinos (id, cidade, pais)
CREATE TABLE destinos(
	id int primary key,
    cidade varchar(30) NOT NULL,
    pais varchar(30) NOT NULL
);

INSERT INTO destinos (id, cidade, pais) VALUES
(1, 'Rio de Janeiro', 'Brasil'),
(2, 'São Paulo', 'Brasil'),
(3, 'Lisboa', 'Portugal'),
(4, 'Nova Iorque', 'Estados Unidos'),
(5, 'Paris', 'França'),
(6, 'Tóquio', 'Japão'),
(7, 'Londres', 'Reino Unido'),
(8, 'Buenos Aires', 'Argentina'),
(9, 'Cancún', 'México'),
(10, 'Dubai', 'Emirados Árabes Unidos'),
(11, 'Roma', 'Itália'),
(12, 'Barcelona', 'Espanha'),
(13, 'Praga', 'República Tcheca'),
(14, 'Amsterdã', 'Países Baixos'),
(15, 'Moscou', 'Rússia'),
(16, 'Cairo', 'Egito'),
(17, 'Bangkok', 'Tailândia'),
(18, 'Sydney', 'Austrália'),
(19, 'Vancouver', 'Canadá'),
(20, 'Seul', 'Coreia do Sul');

-- viagens (id, cliente_id, destino, preco)
CREATE TABLE viagens(
	id int primary key,
    cliente_id int,
    destino_id int,
    preco decimal(7,2) NOT NULL,
    foreign key (cliente_id) references clientes(id),
    foreign key (destino_id) references destinos(id)
);

INSERT INTO viagens (id, cliente_id, destino_id, preco) VALUES
(1, 1, 3, 1500.00),
(2, 2, 5, 3000.00),
(3, 3, 8, 1200.50),
(4, 4, 2, 2500.75),
(5, 5, 7, 1800.00),
(6, 1, 10, 4000.00),
(7, 2, 1, 2200.25),
(8, 3, 6, 1600.80),
(9, 4, 9, 2000.00),
(10, 5, 4, 3500.00),
(11, 1, 12, 1300.60),
(12, 2 ,11 ,2700.90),
(13 ,3 ,15 ,1100.40),
(14 ,4 ,17 ,3400.00),
(15 ,5 ,19 ,1900.50),
(16 ,1 ,20 ,3100.75),
(17 ,2 ,13 ,2500.25),
(18 ,3 ,18 ,3300.00),
(19 ,4 ,16 ,2700.60),
(20 ,5 ,14 ,3800.00);

-- Liste os destinos (cidade e país) que foram visitados por todos os clientes VIPs, mas que não aparecem em nenhuma viagem de clientes do tipo "Normal". Utilize subqueries para comparar as listas de destinos.
SELECT cidade, pais FROM destinos WHERE id IN (SELECT v.destino_id FROM viagens v, clientes c WHERE c.tipo_cliente = 'VIP' AND v.cliente_id = c.id);
-- =========================================
-- CRIAÇÃO DAS TABELAS
-- =========================================
CREATE TABLE clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cidade VARCHAR(100) NOT NULL,
idade INT NOT NULL,
status_cliente VARCHAR(20) NOT NULL
);
CREATE TABLE produtos (
id_produto INT AUTO_INCREMENT PRIMARY KEY,
nome_produto VARCHAR(100) NOT NULL,
categoria VARCHAR(50) NOT NULL,
preco DECIMAL(10,2) NOT NULL,
estoque INT NOT NULL
);
CREATE TABLE pedidos (
id_pedido INT AUTO_INCREMENT PRIMARY KEY,
id_cliente INT NOT NULL,
id_produto INT NOT NULL,
quantidade INT NOT NULL,
valor_total DECIMAL(10,2) NOT NULL,
status_pedido VARCHAR(20) NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
-- =========================================
-- INSERÇÃO DE DADOS - CLIENTES
-- =========================================
INSERT INTO clientes (nome, cidade, idade, status_cliente) VALUES
('Ana Souza', 'Campinas', 22, 'Ativo'),
('Bruno Lima', 'São Paulo', 30, 'Ativo'),
('Carla Mendes', 'Sorocaba', 19, 'Inativo'),
('Diego Alves', 'Campinas', 41, 'Ativo'),
('Eduarda Silva', 'Jundiaí', 27, 'Ativo'),
('Felipe Costa', 'São Paulo', 35, 'Inativo'),
('Gabriela Rocha', 'Valinhos', 24, 'Ativo'),
('Henrique Martins', 'Vinhedo', 29, 'Ativo'),
('Isabela Fernandes', 'Campinas', 32, 'Inativo'),
('João Pedro', 'Americana', 21, 'Ativo');
-- =========================================
-- INSERÇÃO DE DADOS - PRODUTOS
-- =========================================
INSERT INTO produtos (nome_produto, categoria, preco, estoque) VALUES
('Caderno', 'Papelaria', 15.50, 50),
('Caneta Azul', 'Papelaria', 3.00, 120),
('Mochila', 'Acessórios', 89.90, 15),
('Mouse', 'Informática', 45.00, 25),
('Teclado', 'Informática', 120.00, 18),
('Garrafa', 'Utilidades', 28.90, 40),
('Livro de Matemática', 'Livros', 65.00, 12),
('Agenda', 'Papelaria', 22.00, 35),
('Fone de Ouvido', 'Informática', 79.90, 20),
('Calculadora', 'Eletrônicos', 55.00, 10);
-- =========================================
-- INSERÇÃO DE DADOS - PEDIDOS
-- =========================================
INSERT INTO pedidos (id_cliente, id_produto, quantidade, valor_total,
status_pedido) VALUES
(1, 1, 2, 31.00, 'Entregue'),
(2, 3, 1, 89.90, 'Pendente'),
(3, 2, 5, 15.00, 'Cancelado'),
(4, 4, 1, 45.00, 'Entregue'),
(5, 6, 2, 57.80, 'Pendente'),
(6, 5, 1, 120.00, 'Entregue'),
(7, 8, 3, 66.00, 'Pendente'),
(8, 7, 1, 65.00, 'Entregue'),
(9, 9, 2, 159.80, 'Cancelado'),
(10, 10, 1, 55.00, 'Pendente');
-- =========================================
-- CONSULTAS PARA VISUALIZAR OS DADOS
-- =========================================
SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM pedidos;
-- =========================================
-- EXERCÍCIOS DE UPDATE
-- =========================================
-- Altere a cidade do cliente 'Ana Souza' para 'Hortolândia'.
UPDATE clientes
SET cidade = 'Hortolândia'
Where nome = 'Ana Souza';
-- Altere o preço do produto 'Caneta Azul' para 3.50.
update produtos
set preco = '3.50'
where nome_produto = 'Caneta Azul';
-- Altere o status do pedido de id_pedido = 2 para 'Entregue'.
update pedidos
set status_pedido = 'Entregue'
where id_pedido = 2;
-- Aumente em 10.00 o preço de todos os produtos da categoria 'Papelaria'.
update produtos
set preco = preco + 10
where categoria = 'Papelaria';
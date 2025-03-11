CREATE DATABASE inventario;

USE inventario;

CREATE TABLE produtos(
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE fornecedores(
	id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    categoria VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE estoque(
	id_estoque INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor),
    quantidade INT DEFAULT 0,
    data_entrada TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inserindo dados na tabela produtos
INSERT INTO produtos (nome, preco) VALUES
('Notebook Dell', 2500.00),
('Mouse Logitech', 50.00),
('Teclado HyperX', 150.00),
('Monitor Samsung', 800.00),
('Headset Redragon', 200.00);

-- Inserindo dados na tabela fornecedores
INSERT INTO fornecedores (nome, endereco, telefone, email, categoria) VALUES
('Dell Brasil', 'Av. Paulista, 1000 - SP', '(11) 12345678', 'dell@exemplo.com', 'Informática'),
('Logitech Inc.', 'Rua Augusta, 500 - SP', '(11) 98765432', 'logitech@exemplo.com', 'Periféricos'),
('HyperX Brasil', 'Av. Brigadeiro, 200 - RJ', '(21) 11223344', 'hyperx@exemplo.com', 'Games'),
('Samsung Tech', 'Rua da Praia, 300 - BA', '(71) 55667788', 'samsung@exemplo.com', 'Eletrônicos'),
('Redragon Ltda.', 'Rua do Sol, 400 - PE', '(81) 99009900', 'redragon@exemplo.com', 'Games');

-- Inserindo dados na tabela estoque
INSERT INTO estoque (id_produto, id_fornecedor, quantidade) VALUES
(1, 1, 10),
(2, 2, 50),
(3, 3, 20),
(4, 4, 15),
(5, 5, 30);

-- Combinação de linhas de duas ou mais tabelas, mesmo que não haja correspondência direta. --

SELECT
    produtos.nome AS nome_produto,
    fornecedores.nome AS nome_fornecedor
FROM
    produtos
LEFT JOIN
    fornecedores ON produtos.id_produto = fornecedores.id_fornecedor

UNION

SELECT
    produtos.nome AS nome_produto,
    fornecedores.nome AS nome_fornecedor
FROM
    produtos
RIGHT JOIN
    fornecedores ON produtos.id_produto = fornecedores.id_fornecedor
WHERE produtos.id_produto IS NULL;

-- Agrupando produtos por preço: --
SELECT
    preco,
    COUNT(*) AS quantidade_produtos
FROM
    produtos
GROUP BY
    preco;
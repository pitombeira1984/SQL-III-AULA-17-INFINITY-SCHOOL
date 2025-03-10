CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE clientes(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telefone VARCHAR(40) NOT NULL
);

INSERT INTO clientes(nome,email,telefone) VALUES
	("Tiago","tiago@gmail.com","(85)98888.8888"),
    ("WAleska","waleska@gmail.com","(85)97777.7777"),
    ("DAniel","daniel@gmail.com","(85)94444.4444");

CREATE TABLE produtos(
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,    
    categoria ENUM("eletrônico","cozinha","vestuário"),
    estoque INT DEFAULT 0
);

INSERT INTO produtos(nome,preco,categoria,estoque) VALUES
	("teclado",29.90,"eletrônico",5),
    ("caçarola",19.90,"cozinha",10),
    ("camiseta",14.90,"vestuário",8);

CREATE TABLE pedidos(
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    data_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10,2) NOT NULL    
);

INSERT INTO pedidos(id_cliente,valor_total) VALUES
	(2, 200.00),
    (1, 135.84),
    (3, 149.74);

CREATE  TABLE itens_pedido(
	id_itens_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    id_produto INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    quantidade INT NOT NULL DEFAULT 0    
);

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
    (1, 1, 2),
    (1, 3, 1),
    (2, 2, 3),
    (3, 1, 1),
    (3, 2, 2);

CREATE TABLE formas_pagamento(
	id_formas_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL
);

INSERT INTO formas_pagamento (nome) VALUES
    ('Cartão de crédito'),
    ('Boleto bancário'),
    ('PIX'),
    ('Transferência bancária'),
    ('Cartão de débito');

CREATE TABLE pagamento(
	id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    id_formas_pagamento INT,
    FOREIGN KEY (id_formas_pagamento) REFERENCES formas_pagamento(id_formas_pagamento),
    status_pagamento ENUM("pendente","aprovado","recusado") NOT NULL
);

INSERT INTO pagamento (id_pedido, id_formas_pagamento, status_pagamento) VALUES
    (1, 1, 'aprovado'),
    (2, 3, 'pendente'),
    (3, 2, 'aprovado'),
    (1, 5, 'aprovado'),
    (2, 4, 'recusado');



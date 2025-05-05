CREATE DATABASE n8n;

-- Tabela de Clientes
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    endereco VARCHAR(255)
);

-- Tabela de Produtos
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL
);

-- Tabela de Vendas
CREATE TABLE vendas (
    id SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id) ON DELETE CASCADE,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL
);


-- Inserir dados na tabela de Clientes
INSERT INTO clientes (nome, email, telefone, endereco)
VALUES
    ('João Silva', 'joao.silva@example.com', '987654321', 'Rua A, 123, São Paulo'),
    ('Maria Oliveira', 'maria.oliveira@example.com', '988765432', 'Rua B, 456, Rio de Janeiro'),
    ('Pedro Santos', 'pedro.santos@example.com', '992345678', 'Rua C, 789, Belo Horizonte'),
    ('Ana Costa', 'ana.costa@example.com', '999876543', 'Rua D, 1011, Porto Alegre');

-- Inserir dados na tabela de Produtos
INSERT INTO produtos (nome, descricao, preco, estoque)
VALUES
    ('Camiseta', 'Camiseta 100% algodão, disponível em diversas cores.', 49.90, 100),
    ('Calça Jeans', 'Calça jeans masculina, tamanho 42 a 48.', 99.90, 50),
    ('Tênis Esportivo', 'Tênis ideal para corrida e atividades físicas.', 179.90, 30),
    ('Relógio Digital', 'Relógio com monitoramento de atividades e notificações.', 299.90, 20);

-- Inserir dados na tabela de Vendas
INSERT INTO vendas (id_cliente, total)
VALUES
    (1, 349.70),  -- João Silva
    (2, 199.80),  -- Maria Oliveira
    (3, 79.90),   -- Pedro Santos
    (4, 579.70);  -- Ana Costa
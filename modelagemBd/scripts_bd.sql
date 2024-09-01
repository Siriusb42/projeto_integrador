USE gerencia_gastos;
CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(255) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    avatar VARCHAR(255),
    senha VARCHAR(255) NOT NULL
);

USE gerencia_gastos;
CREATE TABLE receita (
    id INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(10, 2) NOT NULL,
    data DATE NOT NULL,
    descricao VARCHAR(255),
    usuario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE
);

USE gerencia_gastos;
CREATE TABLE cartao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(16) NOT NULL,
    tipo TINYINT NOT NULL,
    bandeira VARCHAR(50) NOT NULL,
    limite DECIMAL(10, 2) NOT NULL,
    valor_atual DECIMAL(10, 2) DEFAULT 0.00,
    dia_fechamento INT NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE
);

USE gerencia_gastos;
CREATE TABLE categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

USE gerencia_gastos;
CREATE TABLE despesa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(10, 2) NOT NULL,
    data DATE NOT NULL,
    descricao VARCHAR(255),
    forma_pagamento TINYINT NOT NULL,
    numero_parcelas INT NOT NULL,
    paga BOOLEAN DEFAULT FALSE,
    categoria_id INT NOT NULL,
    usuario_id INT NOT NULL,
    cartao_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE,
    FOREIGN KEY (categoria_id) REFERENCES categoria(id),
    FOREIGN KEY (cartao_id) REFERENCES cartao(id)
);

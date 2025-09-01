-- Semana 3 - CRUD RESTful (Base: "Produtos")
-- Compatível com MySQL 8.0+ (Workbench)
-- Cria o banco, tabela 'produtos' e alguns dados de exemplo.

DROP DATABASE IF EXISTS semana3_rest;
CREATE DATABASE semana3_rest CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE semana3_rest;

-- Tabela principal
CREATE TABLE produtos (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(120) NOT NULL,
  descricao TEXT NULL,
  preco DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  estoque INT NOT NULL DEFAULT 0,
  ativo TINYINT(1) NOT NULL DEFAULT 1,
  criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX idx_produtos_nome (nome)
) ENGINE=InnoDB;

-- Dados de exemplo
INSERT INTO produtos (nome, descricao, preco, estoque, ativo) VALUES
('Lente Prime 1.56', 'Lente visão simples índice 1.56 com AR básico.', 129.90, 25, 1),
('Lente FreeForm Premium', 'Progressiva FreeForm com campos amplos e AR premium.', 899.00, 10, 1),
('Óculos Solar Clássico', 'Armação acetato + lentes solares UV400.', 249.00, 15, 1),
('Kit Limpeza', 'Spray + flanela microfibra.', 39.90, 100, 1),
('Lente Fotossensível', 'Transições com escurecimento rápido.', 699.00, 8, 1);

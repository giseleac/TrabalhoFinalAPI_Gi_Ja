CREATE DATABASE biblioteca_GIJA;

USE biblioteca_GIJA;

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    provider_oauth VARCHAR(50),
    oauth_id VARCHAR(100)
);


CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    editora VARCHAR(100),
    ano_publicacao INT,
    quantidade INT DEFAULT 1,
    id_categoria INT NOT NULL,

    CONSTRAINT fk_livro_categoria
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);
ALTER TABLE livros
ADD COLUMN id_autor INT;
ALTER TABLE livros
ADD CONSTRAINT fk_livro_autor
FOREIGN KEY (id_autor)REFERENCES autores(id_autor);

CREATE TABLE emprestimos (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    data_retirada DATE NOT NULL,
    data_prevista_devolucao DATE NOT NULL,
    data_devolucao DATE,
    status ENUM('EMPRESTADO','DEVOLVIDO','ATRASADO')
           DEFAULT 'EMPRESTADO',

    CONSTRAINT fk_emp_usuario
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),

    CONSTRAINT fk_emp_livro
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);

INSERT INTO categorias (descricao) VALUES
('Romance'),
('Ação'),
('Drama'),
('Suspense'),
('Terror'),
('Fantasia'),
('Ficção Científica'),
('Biografia'),
('Tecnologia'),
('Infantil');

INSERT INTO livros
(titulo, autor, editora, ano_publicacao, quantidade, id_categoria)
VALUES
('Dom Casmurro', 'Machado de Assis', 'Nova Fronteira', 1899, 5, 1),
('Harry Potter e a Pedra Filosofal', 'J. K. Rowling', 'Rocco', 1997, 3, 6),
('O Código Da Vinci', 'Dan Brown', 'Arqueiro', 2003, 2, 4);

UPDATE livros
SET id_autor = 1
WHERE autor = 'Machado de Assis';

UPDATE livros
SET id_autor = 2
WHERE autor = 'J. K. Rowling';

UPDATE livros
SET id_autor = 3
WHERE autor = 'Dan Brown';

//usuarios testes
INSERT INTO usuarios (nome, email, provider_oauth, oauth_id)
VALUES
('Janina de Siqueira', 'janina@email.com', 'google', '123456789'),
('Gisele Almeida', 'gisele@email.com', 'google', '987654321'),
('Pedro Henrique', 'pedro@email.com', NULL, NULL);

//teste emprestimo

INSERT INTO emprestimos
(id_usuario, id_livro, data_retirada, data_prevista_devolucao, data_devolucao, status)
VALUES
(1, 1, '2026-06-20', '2026-07-04', NULL, 'EMPRESTADO'),

(2, 2, '2026-06-15', '2026-06-29', '2026-06-28', 'DEVOLVIDO'),

(3, 3, '2026-06-01', '2026-06-15', NULL, 'ATRASADO');


INSERT INTO autores (nome)
VALUES
('Stephen King'),
('Suzanne Collins'),
('John Green'),
('Frank Herbert'),
('Walter Isaacson'),
('Robert C. Martin'),
('Antoine de Saint-Exupéry'),
('Machado de Assis'), 
('J. K. Rowling'), 
('Dan Brown');


INSERT INTO livros
(titulo, id_autor, editora, ano_publicacao, quantidade, id_categoria)
VALUES
('Dom Casmurro', 1, 'Nova Fronteira', 1899, 5, 1),
('Harry Potter e a Pedra Filosofal', 2, 'Rocco', 1997, 3, 6),
('O Código Da Vinci', 3, 'Arqueiro', 2003, 2, 4),
('It - A Coisa', 4, 'Suma', 1986, 4, 5),
('Jogos Vorazes', 5, 'Rocco', 2008, 6, 2),
('A Culpa é das Estrelas', 6, 'Intrínseca', 2012, 5, 3),
('Duna', 7, 'Aleph', 1965, 3, 7),
('Steve Jobs', 8, 'Companhia das Letras', 2011, 2, 8),
('Código Limpo', 9, 'Alta Books', 2008, 4, 9),
('O Pequeno Príncipe', 10, 'Agir', 1943, 7, 10);
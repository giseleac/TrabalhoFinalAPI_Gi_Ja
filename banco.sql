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
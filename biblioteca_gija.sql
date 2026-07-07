-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07/07/2026 às 04:15
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `biblioteca_gija`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `autores`
--

CREATE TABLE `autores` (
  `id_autor` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `autores`
--

INSERT INTO `autores` (`id_autor`, `nome`) VALUES
(1, 'Machado de Assis'),
(2, 'J. K. Rowling'),
(3, 'Dan Brown'),
(4, 'Stephen King'),
(5, 'Suzanne Collins'),
(6, 'John Green'),
(7, 'Frank Herbert'),
(8, 'Walter Isaacson'),
(9, 'Robert C. Martin'),
(10, 'Antoine de Saint-Exupéry');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `descricao`) VALUES
(2, 'Ação'),
(8, 'Biografia'),
(3, 'Drama'),
(6, 'Fantasia'),
(7, 'Ficção Científica'),
(11, 'História'),
(10, 'Infantil'),
(1, 'Romance'),
(4, 'Suspense'),
(9, 'Tecnologia'),
(5, 'Terror');

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `id_emprestimo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL,
  `data_retirada` date NOT NULL,
  `data_prevista_devolucao` date NOT NULL,
  `data_devolucao` date DEFAULT NULL,
  `status` enum('EMPRESTADO','DEVOLVIDO','ATRASADO') DEFAULT 'EMPRESTADO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `emprestimos`
--

INSERT INTO `emprestimos` (`id_emprestimo`, `id_usuario`, `id_livro`, `data_retirada`, `data_prevista_devolucao`, `data_devolucao`, `status`) VALUES
(1, 1, 1, '2026-06-20', '2026-07-04', NULL, 'EMPRESTADO'),
(2, 2, 2, '2026-06-15', '2026-06-29', '2026-06-28', 'DEVOLVIDO'),
(3, 3, 3, '2026-06-01', '2026-06-15', NULL, 'ATRASADO'),
(5, 1, 4, '2026-07-06', '2026-07-20', NULL, 'EMPRESTADO');

-- --------------------------------------------------------

--
-- Estrutura para tabela `livros`
--

CREATE TABLE `livros` (
  `id_livro` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `editora` varchar(100) DEFAULT NULL,
  `ano_publicacao` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT 1,
  `id_categoria` int(11) NOT NULL,
  `id_autor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `livros`
--

INSERT INTO `livros` (`id_livro`, `titulo`, `editora`, `ano_publicacao`, `quantidade`, `id_categoria`, `id_autor`) VALUES
(1, 'Dom Casmurro', 'Nova Fronteira', 1899, 5, 1, 1),
(2, 'Harry Potter e a Pedra Filosofal', 'Rocco', 1997, 3, 6, 2),
(3, 'O Código Da Vinci', 'Arqueiro', 2003, 2, 4, 3),
(4, 'It - A Coisa', 'Suma', 1986, 4, 5, 4),
(5, 'Jogos Vorazes', 'Rocco', 2008, 6, 2, 5),
(6, 'A Culpa é das Estrelas', 'Intrínseca', 2012, 5, 3, 6),
(7, 'Duna', 'Aleph', 1965, 3, 7, 7),
(8, 'Steve Jobs', 'Companhia das Letras', 2011, 2, 8, 8),
(9, 'Código Limpo', 'Alta Books', 2008, 4, 9, 9),
(10, 'O Pequeno Príncipe', 'Agir', 1943, 7, 10, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `provider_oauth` varchar(50) DEFAULT NULL,
  `oauth_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nome`, `email`, `senha`, `provider_oauth`, `oauth_id`) VALUES
(1, 'Janina de Siqueira', 'janina@email.com', '$2b$10$JrL0S3dt7dWc2C40hnmz..8xdbSG6KjarBtHjLfgQh3B85QIIILdu', 'google', '123456789'),
(2, 'Gisele Araújo', 'gicostamasanhudo@gmail.com', '$2b$10$kD8Kkexi4BX.EUFdtqPlFO8b0x92Lp700DzSWLplIZXP.KPSBSQBe', 'google', '987654321'),
(3, 'Pedro Henrique', 'pedro@email.com', '$2b$10$34YWNDo9z90T1l4Y1.oRVOnn1ivslwFne931wQtlk1nhvCnNsEdPe', NULL, NULL),
(4, 'Marcelo Silva', 'marcelo@email.com', '$2b$10$Yov/TQTOwbEl8vg7GAMnC.6OofaUEAeqp.EEqyL0bpbqFc21aEDEK', 'google', '897654321');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id_autor`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `descricao` (`descricao`);

--
-- Índices de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`id_emprestimo`),
  ADD KEY `fk_emp_usuario` (`id_usuario`),
  ADD KEY `fk_emp_livro` (`id_livro`);

--
-- Índices de tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id_livro`),
  ADD KEY `fk_livro_categoria` (`id_categoria`),
  ADD KEY `fk_livro_autor` (`id_autor`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `autores`
--
ALTER TABLE `autores`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `id_emprestimo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id_livro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD CONSTRAINT `fk_emp_livro` FOREIGN KEY (`id_livro`) REFERENCES `livros` (`id_livro`),
  ADD CONSTRAINT `fk_emp_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Restrições para tabelas `livros`
--
ALTER TABLE `livros`
  ADD CONSTRAINT `fk_livro_autor` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id_autor`),
  ADD CONSTRAINT `fk_livro_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

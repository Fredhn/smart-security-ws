-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 13-Dez-2017 às 02:55
-- Versão do servidor: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `securitycenter`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `contatos`
--

CREATE TABLE `contatos` (
  `id_contato` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `telefone` int(13) DEFAULT NULL,
  `telefone2` int(13) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contrato`
--

CREATE TABLE `contrato` (
  `id_contrato` int(11) NOT NULL,
  `documento` int(11) DEFAULT NULL,
  `dataVigencia` date NOT NULL,
  `qtdUsuarios` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `contrato`
--

INSERT INTO `contrato` (`id_contrato`, `documento`, `dataVigencia`, `qtdUsuarios`) VALUES
(0, 2211, '2017-03-30', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `controleacesso`
--

CREATE TABLE `controleacesso` (
  `id_ca` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `controleacesso`
--

INSERT INTO `controleacesso` (`id_ca`, `id_usuario`, `id_modulo`) VALUES
(1, 19, 1),
(2, 19, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modulo`
--

CREATE TABLE `modulo` (
  `id_modulo` int(11) NOT NULL,
  `id_moduloContrato` int(11) NOT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `dominio` varchar(50) DEFAULT NULL,
  `moduloDescricao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `modulo`
--

INSERT INTO `modulo` (`id_modulo`, `id_moduloContrato`, `endereco`, `dominio`, `moduloDescricao`) VALUES
(1, 0, 'Rua Lisboa 161', 'Casa.com', 'Modulo domestico'),
(2, 0, 'Rua Lisboa 161', 'Portao.com', 'Modulo Garagem');

-- --------------------------------------------------------

--
-- Estrutura da tabela `rastreabilidade`
--

CREATE TABLE `rastreabilidade` (
  `id_rastreabilidade` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL,
  `descricao` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `rastreabilidade`
--

INSERT INTO `rastreabilidade` (`id_rastreabilidade`, `id_usuario`, `id_modulo`, `descricao`) VALUES
(1, 19, 1, 'Casa.com'),
(2, 19, 1, 'Casa.com'),
(3, 19, 1, 'Casa.com'),
(4, 19, 1, 'Casa.com'),
(5, 19, 1, 'Casa.com'),
(6, 19, 1, 'Casa.com'),
(7, 19, 1, 'Casa.com'),
(8, 19, 1, 'Casa.com'),
(9, 19, 1, 'Casa.com'),
(10, 19, 1, 'Casa.com'),
(11, 19, 1, 'Casa.com'),
(12, 19, 1, 'Casa.com'),
(13, 19, 1, 'Casa.com'),
(14, 19, 1, 'Casa.com'),
(15, 19, 1, 'Casa.com'),
(16, 19, 1, 'Casa.com'),
(17, 19, 1, 'Casa.com'),
(18, 19, 1, 'Casa.com'),
(19, 19, 1, 'Casa.com'),
(20, 19, 1, 'Casa.com'),
(21, 19, 1, 'Casa.com'),
(22, 19, 1, 'Casa.com'),
(23, 19, 1, 'Casa.com'),
(24, 19, 1, 'Casa.com'),
(25, 19, 1, 'Casa.com'),
(26, 19, 1, 'Casa.com'),
(27, 19, 1, 'Casa.com'),
(28, 19, 2, 'Portao.com'),
(29, 19, 1, 'Casa.com'),
(30, 19, 2, 'Portao.com'),
(31, 19, 1, 'Casa.com'),
(32, 19, 2, 'Portao.com'),
(33, 19, 2, 'Portao.com'),
(34, 19, 1, 'Casa.com'),
(35, 19, 2, 'Portao.com'),
(36, 19, 1, 'Casa.com'),
(37, 19, 2, 'Portao.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_usuarioContrato` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `login` char(8) NOT NULL,
  `senha` varchar(12) NOT NULL,
  `mac_dispositivo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_usuarioContrato`, `nome`, `cpf`, `login`, `senha`, `mac_dispositivo`) VALUES
(19, 0, 'Fred', '99999999999', 'user1', '123456', 12345678);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contatos`
--
ALTER TABLE `contatos`
  ADD PRIMARY KEY (`id_contato`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`id_contrato`);

--
-- Indexes for table `controleacesso`
--
ALTER TABLE `controleacesso`
  ADD PRIMARY KEY (`id_ca`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_modulo` (`id_modulo`);

--
-- Indexes for table `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id_modulo`),
  ADD KEY `id_moduloContrato` (`id_moduloContrato`);

--
-- Indexes for table `rastreabilidade`
--
ALTER TABLE `rastreabilidade`
  ADD PRIMARY KEY (`id_rastreabilidade`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_modulo` (`id_modulo`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_usuarioContrato` (`id_usuarioContrato`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contatos`
--
ALTER TABLE `contatos`
  MODIFY `id_contato` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contrato`
--
ALTER TABLE `contrato`
  MODIFY `id_contrato` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `controleacesso`
--
ALTER TABLE `controleacesso`
  MODIFY `id_ca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id_modulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `rastreabilidade`
--
ALTER TABLE `rastreabilidade`
  MODIFY `id_rastreabilidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `contatos`
--
ALTER TABLE `contatos`
  ADD CONSTRAINT `contatos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Limitadores para a tabela `controleacesso`
--
ALTER TABLE `controleacesso`
  ADD CONSTRAINT `controleacesso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `controleacesso_ibfk_2` FOREIGN KEY (`id_modulo`) REFERENCES `modulo` (`id_modulo`);

--
-- Limitadores para a tabela `modulo`
--
ALTER TABLE `modulo`
  ADD CONSTRAINT `modulo_ibfk_1` FOREIGN KEY (`id_moduloContrato`) REFERENCES `contrato` (`id_contrato`);

--
-- Limitadores para a tabela `rastreabilidade`
--
ALTER TABLE `rastreabilidade`
  ADD CONSTRAINT `rastreabilidade_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `rastreabilidade_ibfk_2` FOREIGN KEY (`id_modulo`) REFERENCES `modulo` (`id_modulo`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_usuarioContrato`) REFERENCES `contrato` (`id_contrato`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

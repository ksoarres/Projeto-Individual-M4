CREATE TABLE `instituicao` (
  `cnpj` varchar(255) PRIMARY KEY NOT NULL,
  `endereco` varchar(255),
  `nome_empresa` varchar(255)
);

CREATE TABLE `secretaria` (
  `id_secretaria` varchar(255) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `id_curso` varchar(255),
  `cnpj` int
);

CREATE TABLE `funcionarios` (
  `id_funcionario` int PRIMARY KEY NOT NULL,
  `cnpj` varchar(255),
  `nome_funcionario` varchar(255),
  `data_nascimento` int,
  `genero_funcionario` varchar(255)
);

CREATE TABLE `curso` (
  `id_curso` varchar(255) PRIMARY KEY NOT NULL,
  `nome` varchar(255),
  `turno` varchar(255),
  `grade` varchar(255)
);

CREATE TABLE `turma` (
  `id_turma` varchar(255) PRIMARY KEY NOT NULL,
  `id_aluno` varchar(255),
  `cnpj` int
);

CREATE TABLE `historico` (
  `id_nota` int PRIMARY KEY NOT NULL,
  `id_aluno` varchar(255),
  `id_curso` varchar(255)
);

CREATE TABLE `aluno` (
  `id_aluno` varchar(255) PRIMARY KEY NOT NULL,
  `id_nota` int,
  `id_sala` varchar(255),
  `id_turma` varchar(255),
  `id_curso` varchar(255)
);

CREATE TABLE `salas` (
  `id_sala` int PRIMARY KEY NOT NULL,
  `id_turma` varchar(255),
  `id_aluno` varchar(255)
);

ALTER TABLE `secretaria` ADD FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`);

ALTER TABLE `secretaria` ADD FOREIGN KEY (`cnpj`) REFERENCES `instituicao` (`cnpj`);

ALTER TABLE `funcionarios` ADD FOREIGN KEY (`cnpj`) REFERENCES `instituicao` (`cnpj`);

ALTER TABLE `turma` ADD FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_aluno`);

ALTER TABLE `turma` ADD FOREIGN KEY (`cnpj`) REFERENCES `instituicao` (`cnpj`);

ALTER TABLE `historico` ADD FOREIGN KEY (`id_aluno`) REFERENCES `turma` (`id_aluno`);

ALTER TABLE `historico` ADD FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`);

ALTER TABLE `aluno` ADD FOREIGN KEY (`id_nota`) REFERENCES `historico` (`id_nota`);

ALTER TABLE `aluno` ADD FOREIGN KEY (`id_sala`) REFERENCES `salas` (`id_sala`);

ALTER TABLE `aluno` ADD FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id_turma`);

ALTER TABLE `aluno` ADD FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`);

ALTER TABLE `salas` ADD FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id_turma`);

ALTER TABLE `salas` ADD FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_aluno`);

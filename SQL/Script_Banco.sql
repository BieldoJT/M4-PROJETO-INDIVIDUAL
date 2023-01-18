CREATE TABLE `cursos` (
  `id_curso` int PRIMARY KEY,
  `nome_curso` varchar(255),
  `categoria` varchar(255),
  `valor_curso` int,
  `duracao_curso` int
);

CREATE TABLE `turmas` (
  `id_turma` int PRIMARY KEY,
  `id_aluno` int,
  `id_professor` int
);

CREATE TABLE `alunos` (
  `id_aluno` int PRIMARY KEY,
  `nome_aluno` varchar(255),
  `cpf_aluno` int,
  `endereco_aluno` varchar(255),
  `numero_aluno` varchar(11),
  `data_nascimento_aluno` datetime,
  `pontuacao_aluno` int,
  `frequencia` float
);

CREATE TABLE `tema` (
  `id_tema` int PRIMARY KEY,
  `id_curso` int,
  `nome_tema` varchar(255),
  `duracao_tema` int,
  `conteudo_tema` blob
);

CREATE TABLE `notas` (
  `id_aluno` int PRIMARY KEY,
  `id_tema` int,
  `nota` int
);

CREATE TABLE `professores` (
  `id_professor` int PRIMARY KEY,
  `nome_professor` varchar(255),
  `cpf_professor` int,
  `numero_professor` varchar(11)
);

CREATE TABLE `monitor` (
  `id_monitor` int PRIMARY KEY,
  `nome_monitor` varchar(255),
  `cpf_monitor` varchar(255),
  `numero_monitor` varchar(11)
);

CREATE TABLE `monitoria` (
  `horario_monitoria` timestamptz PRIMARY KEY,
  `id_monitor` int,
  `id_aluno` int,
  `id_tema` int
);

CREATE TABLE `tabela_de_presensa` (
  `data_aula` datetime,
  `id_aluno` int,
  `presensa` boolean
);

CREATE TABLE `aula` (
  `data_aula` datetime PRIMARY KEY,
  `id_tema` int,
  `id_turma` int
);

ALTER TABLE `tema` ADD FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`);

ALTER TABLE `aula` ADD FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id_tema`);

ALTER TABLE `aula` ADD FOREIGN KEY (`id_turma`) REFERENCES `turmas` (`id_turma`);

ALTER TABLE `tabela_de_presensa` ADD FOREIGN KEY (`data_aula`) REFERENCES `aula` (`data_aula`);

ALTER TABLE `tabela_de_presensa` ADD FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`);

ALTER TABLE `turmas` ADD FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`);

ALTER TABLE `turmas` ADD FOREIGN KEY (`id_professor`) REFERENCES `professores` (`id_professor`);

ALTER TABLE `notas` ADD FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`);

ALTER TABLE `notas` ADD FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id_tema`);

ALTER TABLE `monitoria` ADD FOREIGN KEY (`id_monitor`) REFERENCES `monitor` (`id_monitor`);

ALTER TABLE `monitoria` ADD FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`);

ALTER TABLE `monitoria` ADD FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id_tema`);

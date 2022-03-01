CREATE TABLE tb_departamentos (
id_departamento SERIAL NOT NULL,
nome_departamento varchar (255),
PRIMARY KEY(id_departamento)
);

CREATE TABLE tb_cursos (
id_curso SERIAL NOT NULL,
nome_curso varchar (45) NULL,
meses_duracao int NULL,
carga_horaria int NULL,
requisitos text NULL,
modalidade varchar (50) NULL,
PRIMARY KEY(id_curso)
);

CREATE TABLE tb_turmas (
id_turma SERIAL NOT NULL,
id_curso bigint unsigned NULL ,
nome_turma varchar (10) NULL,
PRIMARY KEY(id_turma),
	CONSTRAINT fk_tb_cursos
      FOREIGN KEY(id_curso) 
	  REFERENCES tb_cursos(id_curso)
);

CREATE TABLE tb_alunos (
matricula_aluno SERIAL NOT NULL,
id_turma bigint unsigned NOT NULL,
nome_aluno varchar (255) NULL,
sexo_aluno char (10) NULL,
idade_aluno int NULL,
email_aluno varchar (255) NULL,
PRIMARY KEY(matricula_aluno),
	CONSTRAINT fk_tb_turmas
      FOREIGN KEY(id_turma) 
	  REFERENCES tb_turmas(id_turma)
);

CREATE TABLE tb_modulos (
id_modulo SERIAL NOT NULL,
id_curso bigint unsigned not null,
nome_modulo varchar (255),
caracteristica text,
descricao_tech text,
descricao_soft text,
PRIMARY KEY (id_modulo),
	CONSTRAINT fk_tb_cursos1
      FOREIGN KEY(id_curso) 
	  REFERENCES tb_cursos(id_curso)
);

CREATE TABLE tb_facilitadores (
matricula_facilitador SERIAL NOT NULL,
id_departamento bigint unsigned not null,
nome_fac varchar (255),
sexo_fac char (10),
idade_fac int,
email_fac varchar (255),
disciplina_fac varchar (25),
PRIMARY KEY(matricula_facilitador),
	CONSTRAINT fk_tb_departamentos
      FOREIGN KEY(id_departamento) 
	  REFERENCES tb_departamentos(id_departamento)
);

CREATE TABLE tb_facilitador_turma (
id_turma bigint unsigned NULL,
matricula_facilitador bigint unsigned NOT NULL,
	CONSTRAINT fk_tb_turmas_fac
      FOREIGN KEY(id_turma) 
	  REFERENCES tb_turmas(id_turma),
	CONSTRAINT fk_tb_facilitadores
      FOREIGN KEY(matricula_facilitador) 
	  REFERENCES tb_facilitadores(matricula_facilitador)
);

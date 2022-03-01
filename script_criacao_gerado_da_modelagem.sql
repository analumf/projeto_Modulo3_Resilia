-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema resilia_antt
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema resilia_atual
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema resilia_atual
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `resilia_atual` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema resilia0
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema resilia0
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `resilia0` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `resilia_atual` ;

-- -----------------------------------------------------
-- Table `resilia_atual`.`tb_cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resilia_atual`.`tb_cursos` (
  `id_curso` BIGINT NOT NULL,
  `nome_curso` VARCHAR(45) NULL DEFAULT NULL,
  `meses_duracao` INT NULL DEFAULT NULL,
  `carga_horaria` INT NULL DEFAULT NULL,
  `requisitos` TEXT NULL DEFAULT NULL,
  `modalidade` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_curso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resilia_atual`.`tb_turmas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resilia_atual`.`tb_turmas` (
  `id_turma` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_curso` BIGINT NULL DEFAULT NULL,
  `nome_turma` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id_turma`),
  UNIQUE INDEX `id_turma` (`id_turma` ASC) VISIBLE,
  INDEX `fk_tb_cursos` (`id_curso` ASC) VISIBLE,
  CONSTRAINT `fk_tb_cursos`
    FOREIGN KEY (`id_curso`)
    REFERENCES `resilia_atual`.`tb_cursos` (`id_curso`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resilia_atual`.`tb_alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resilia_atual`.`tb_alunos` (
  `matricula_aluno` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_turma` BIGINT UNSIGNED NOT NULL,
  `nome_aluno` VARCHAR(255) NULL DEFAULT NULL,
  `sexo_aluno` CHAR(10) NULL DEFAULT NULL,
  `idade_aluno` INT NULL DEFAULT NULL,
  `email_aluno` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`matricula_aluno`),
  UNIQUE INDEX `matricula_aluno` (`matricula_aluno` ASC) VISIBLE,
  INDEX `fk_tb_turmas` (`id_turma` ASC) VISIBLE,
  CONSTRAINT `fk_tb_turmas`
    FOREIGN KEY (`id_turma`)
    REFERENCES `resilia_atual`.`tb_turmas` (`id_turma`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resilia_atual`.`tb_departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resilia_atual`.`tb_departamentos` (
  `id_departamento` BIGINT NOT NULL,
  `nome_departamento` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_departamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resilia_atual`.`tb_facilitadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resilia_atual`.`tb_facilitadores` (
  `matricula_facilitador` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_departamento` BIGINT NULL DEFAULT NULL,
  `nome_fac` VARCHAR(255) NULL DEFAULT NULL,
  `sexo_fac` CHAR(10) NULL DEFAULT NULL,
  `idade_fac` INT NULL DEFAULT NULL,
  `email_fac` VARCHAR(255) NULL DEFAULT NULL,
  `disciplina_fac` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`matricula_facilitador`),
  UNIQUE INDEX `matricula_facilitador` (`matricula_facilitador` ASC) VISIBLE,
  INDEX `fk_tb_departamentos` (`id_departamento` ASC) VISIBLE,
  CONSTRAINT `fk_tb_departamentos`
    FOREIGN KEY (`id_departamento`)
    REFERENCES `resilia_atual`.`tb_departamentos` (`id_departamento`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resilia_atual`.`tb_facilitador_turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resilia_atual`.`tb_facilitador_turma` (
  `id_turma` BIGINT UNSIGNED NULL DEFAULT NULL,
  `matricula_facilitador` BIGINT UNSIGNED NOT NULL,
  INDEX `fk_tb_turmas_fac` (`id_turma` ASC) VISIBLE,
  INDEX `fk_tb_facilitadores` (`matricula_facilitador` ASC) VISIBLE,
  CONSTRAINT `fk_tb_facilitadores`
    FOREIGN KEY (`matricula_facilitador`)
    REFERENCES `resilia_atual`.`tb_facilitadores` (`matricula_facilitador`),
  CONSTRAINT `fk_tb_turmas_fac`
    FOREIGN KEY (`id_turma`)
    REFERENCES `resilia_atual`.`tb_turmas` (`id_turma`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resilia_atual`.`tb_modulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resilia_atual`.`tb_modulos` (
  `id_modulo` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_curso` BIGINT NOT NULL,
  `nome_modulo` VARCHAR(255) NULL DEFAULT NULL,
  `caracteristica` TEXT NULL DEFAULT NULL,
  `descricao_tech` TEXT NULL DEFAULT NULL,
  `descricao_soft` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_modulo`),
  UNIQUE INDEX `id_modulo` (`id_modulo` ASC) VISIBLE,
  INDEX `fk_tb_cursos1` (`id_curso` ASC) VISIBLE,
  CONSTRAINT `fk_tb_cursos1`
    FOREIGN KEY (`id_curso`)
    REFERENCES `resilia_atual`.`tb_cursos` (`id_curso`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb3;

USE `resilia0` ;

-- -----------------------------------------------------
-- Table `resilia0`.`tb_cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resilia0`.`tb_cursos` (
  `id_curso` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome_curso` VARCHAR(45) NULL DEFAULT NULL,
  `meses_duracao` INT NULL DEFAULT NULL,
  `carga_horaria` INT NULL DEFAULT NULL,
  `requisitos` TEXT NULL DEFAULT NULL,
  `modalidade` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_curso`),
  UNIQUE INDEX `id_curso` (`id_curso` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `resilia0`.`tb_turmas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resilia0`.`tb_turmas` (
  `id_turma` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_curso` BIGINT UNSIGNED NULL DEFAULT NULL,
  `nome_turma` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id_turma`),
  UNIQUE INDEX `id_turma` (`id_turma` ASC) VISIBLE,
  INDEX `fk_tb_cursos` (`id_curso` ASC) VISIBLE,
  CONSTRAINT `fk_tb_cursos`
    FOREIGN KEY (`id_curso`)
    REFERENCES `resilia0`.`tb_cursos` (`id_curso`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `resilia0`.`tb_alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resilia0`.`tb_alunos` (
  `matricula_aluno` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_turma` BIGINT UNSIGNED NOT NULL,
  `nome_aluno` VARCHAR(255) NULL DEFAULT NULL,
  `sexo_aluno` CHAR(10) NULL DEFAULT NULL,
  `idade_aluno` INT NULL DEFAULT NULL,
  `email_aluno` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`matricula_aluno`),
  UNIQUE INDEX `matricula_aluno` (`matricula_aluno` ASC) VISIBLE,
  INDEX `fk_tb_turmas` (`id_turma` ASC) VISIBLE,
  CONSTRAINT `fk_tb_turmas`
    FOREIGN KEY (`id_turma`)
    REFERENCES `resilia0`.`tb_turmas` (`id_turma`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `resilia0`.`tb_departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resilia0`.`tb_departamentos` (
  `id_departamento` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome_departamento` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_departamento`),
  UNIQUE INDEX `id_departamento` (`id_departamento` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `resilia0`.`tb_facilitadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resilia0`.`tb_facilitadores` (
  `matricula_facilitador` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_departamento` BIGINT UNSIGNED NOT NULL,
  `nome_fac` VARCHAR(255) NULL DEFAULT NULL,
  `sexo_fac` CHAR(10) NULL DEFAULT NULL,
  `idade_fac` INT NULL DEFAULT NULL,
  `email_fac` VARCHAR(255) NULL DEFAULT NULL,
  `disciplina_fac` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`matricula_facilitador`),
  UNIQUE INDEX `matricula_facilitador` (`matricula_facilitador` ASC) VISIBLE,
  INDEX `fk_tb_departamentos` (`id_departamento` ASC) VISIBLE,
  CONSTRAINT `fk_tb_departamentos`
    FOREIGN KEY (`id_departamento`)
    REFERENCES `resilia0`.`tb_departamentos` (`id_departamento`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `resilia0`.`tb_facilitador_turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resilia0`.`tb_facilitador_turma` (
  `id_turma` BIGINT UNSIGNED NULL DEFAULT NULL,
  `matricula_facilitador` BIGINT UNSIGNED NOT NULL,
  INDEX `fk_tb_turmas_fac` (`id_turma` ASC) VISIBLE,
  INDEX `fk_tb_facilitadores` (`matricula_facilitador` ASC) VISIBLE,
  CONSTRAINT `fk_tb_facilitadores`
    FOREIGN KEY (`matricula_facilitador`)
    REFERENCES `resilia0`.`tb_facilitadores` (`matricula_facilitador`),
  CONSTRAINT `fk_tb_turmas_fac`
    FOREIGN KEY (`id_turma`)
    REFERENCES `resilia0`.`tb_turmas` (`id_turma`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `resilia0`.`tb_modulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `resilia0`.`tb_modulos` (
  `id_modulo` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_curso` BIGINT UNSIGNED NOT NULL,
  `nome_modulo` VARCHAR(255) NULL DEFAULT NULL,
  `caracteristica` TEXT NULL DEFAULT NULL,
  `descricao_tech` TEXT NULL DEFAULT NULL,
  `descricao_soft` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_modulo`),
  UNIQUE INDEX `id_modulo` (`id_modulo` ASC) VISIBLE,
  INDEX `fk_tb_cursos1` (`id_curso` ASC) VISIBLE,
  CONSTRAINT `fk_tb_cursos1`
    FOREIGN KEY (`id_curso`)
    REFERENCES `resilia0`.`tb_cursos` (`id_curso`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

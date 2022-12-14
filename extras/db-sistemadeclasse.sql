-- MySQL Script generated by MySQL Workbench
-- qua 28 set 2022 18:53:54
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_sistemadeclasse
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_sistemadeclasse
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_sistemadeclasse` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci ;
USE `db_sistemadeclasse` ;

-- -----------------------------------------------------
-- Table `db_sistemadeclasse`.`tbl_professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sistemadeclasse`.`tbl_professor` (
  `id` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL,
  `senha` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL,
  `email` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sistemadeclasse`.`tbl_escola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sistemadeclasse`.`tbl_escola` (
  `id` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL,
  `email` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL,
  `fk_tbl_professor_id` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tbl_escola_pertence_professor` USING BTREE (`fk_tbl_professor_id`) VISIBLE,
  CONSTRAINT `fk_tbl_professor_id`
    FOREIGN KEY (`fk_tbl_professor_id`)
    REFERENCES `db_sistemadeclasse`.`tbl_professor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sistemadeclasse`.`tbl_disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sistemadeclasse`.`tbl_disciplina` (
  `id` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL,
  `fk_tbl_professor_id2` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `tbl_disciplina_pertence_professor` (`fk_tbl_professor_id2` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_disciplina_tbl_professor2`
    FOREIGN KEY (`fk_tbl_professor_id2`)
    REFERENCES `db_sistemadeclasse`.`tbl_professor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sistemadeclasse`.`tbl_classe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sistemadeclasse`.`tbl_classe` (
  `id` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL,
  `ano` DATE NOT NULL,
  `periodo` CHAR(2) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL,
  `fk_tbl_disciplina_id` INT ZEROFILL NOT NULL,
  `fk_tbl_escola_id` INT ZEROFILL NOT NULL,
  `fk_tbl_professor_id1` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `tbl_classe_pertence_escola` (`fk_tbl_escola_id` ASC) VISIBLE,
  INDEX `tbl_classe_pertence_professor` (`fk_tbl_professor_id1` ASC) VISIBLE,
  INDEX `tbl_classe_aplica_disciplina` (`fk_tbl_disciplina_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_professor_id1`
    FOREIGN KEY (`fk_tbl_professor_id1`)
    REFERENCES `db_sistemadeclasse`.`tbl_professor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_escola_id2`
    FOREIGN KEY (`fk_tbl_escola_id`)
    REFERENCES `db_sistemadeclasse`.`tbl_escola` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_classe_tbl_disciplina`
    FOREIGN KEY (`fk_tbl_disciplina_id`)
    REFERENCES `db_sistemadeclasse`.`tbl_disciplina` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_sistemadeclasse`.`tbl_aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sistemadeclasse`.`tbl_aluno` (
  `id` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL,
  `sexualidade` CHAR(2) NULL,
  `nascimento` DATE NULL,
  `fk_tbl_classe_id1` INT ZEROFILL NOT NULL,
  `fk_tbl_professor_id3` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `tbl_aluno_pertence_professor` (`fk_tbl_professor_id3` ASC) VISIBLE,
  INDEX `fk_tbl_aluno_tbl_classe1` (`fk_tbl_classe_id1` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_professor_id3`
    FOREIGN KEY (`fk_tbl_professor_id3`)
    REFERENCES `db_sistemadeclasse`.`tbl_professor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_aluno_tbl_classe1`
    FOREIGN KEY (`fk_tbl_classe_id1`)
    REFERENCES `db_sistemadeclasse`.`tbl_classe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `db_sistemadeclasse`.`tbl_atividade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sistemadeclasse`.`tbl_atividade` (
  `id` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL,
  `valor` DOUBLE NOT NULL,
  `fk_tbl_professor_id4` INT ZEROFILL NOT NULL,
  `fk_tbl_classe_id2` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tbl_atividade_feita_professor` (`fk_tbl_professor_id4` ASC) VISIBLE,
  INDEX `fk_tbl_atividade_tbl_classe2` (`fk_tbl_classe_id2` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_atividade_tbl_professor4`
    FOREIGN KEY (`fk_tbl_professor_id4`)
    REFERENCES `db_sistemadeclasse`.`tbl_professor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_atividade_tbl_classe1`
    FOREIGN KEY (`fk_tbl_classe_id2`)
    REFERENCES `db_sistemadeclasse`.`tbl_classe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sistemadeclasse`.`tbl_nota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sistemadeclasse`.`tbl_nota` (
  `id` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `nota` DOUBLE ZEROFILL NOT NULL,
  `fk_tbl_aluno_id1` INT ZEROFILL NOT NULL,
  `fk_tbl_atividade_id` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `tbl_nota_complementa_tbl_aluno` (`fk_tbl_aluno_id1` ASC) VISIBLE,
  INDEX `tbl_nota_contem_atividade` (`fk_tbl_atividade_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_nota_tbl_aluno1`
    FOREIGN KEY (`fk_tbl_aluno_id1`)
    REFERENCES `db_sistemadeclasse`.`tbl_aluno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_nota_tbl_atividade1`
    FOREIGN KEY (`fk_tbl_atividade_id`)
    REFERENCES `db_sistemadeclasse`.`tbl_atividade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sistemadeclasse`.`tbl_frequencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sistemadeclasse`.`tbl_frequencia` (
  `id` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `dia` DATE NOT NULL,
  `presenca` CHAR(2) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL,
  `falta` CHAR(2) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL,
  `fk_tbl_aluno_id2` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `tbl_frequencia_complementa_tbl_aluno` (`fk_tbl_aluno_id2` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_frequencia_tbl_aluno1`
    FOREIGN KEY (`fk_tbl_aluno_id2`)
    REFERENCES `db_sistemadeclasse`.`tbl_aluno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

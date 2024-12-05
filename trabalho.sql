-- MySQL Script generated by MySQL Workbench
-- 11/01/24 13:31:01
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema qtgostoso
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema qtgostoso
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `qtgostoso` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `qtgostoso` ;

-- -----------------------------------------------------
-- Table `qtgostoso`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qtgostoso`.`usuario` (
  `idusuario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(85) NOT NULL,
  `email` VARCHAR(85) NOT NULL,
  `dataNascimento` DATE NOT NULL,
  `senha_hash` VARCHAR(300) NOT NULL,       -- Hash da senha usando Argon2 ou bcrypt
  `senha_salt` VARCHAR(32) NOT NULL,        -- Salt único para cada usuário
  `dataCriacao` DATETIME NOT NULL DEFAULT current_timestamp(),
  `ultimaAlteracaoSenha` DATETIME NOT NULL, -- Data da última alteração de senha
  `tentativasFalhas` TINYINT UNSIGNED NOT NULL DEFAULT 0, -- Contador de tentativas falhas de login
  `ultimoLogin` DATETIME,                   -- Data do último login
  `mfaHabilitado` TINYINT UNSIGNED NOT NULL DEFAULT 0, -- Indica MFA habilitado
  `genero` TINYINT UNSIGNED NULL,
  `telefone` VARCHAR(15) NULL,
  `ativo` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE INDEX `idusuario_UNIQUE` (`idusuario` ASC))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `qtgostoso`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qtgostoso`.`categoria` (
  `idcategoria` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(50) NOT NULL,
  `ativo` TINYINT NOT NULL,
  PRIMARY KEY (`idcategoria`),
  UNIQUE INDEX `idcategoria_UNIQUE` (`idcategoria` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `qtgostoso`.`refeicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qtgostoso`.`refeicao` (
  `idrefeicao` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `refeicao` VARCHAR(50) NOT NULL,
  `ativo` TINYINT NOT NULL,
  PRIMARY KEY (`idrefeicao`),
  UNIQUE INDEX `idcategoria_UNIQUE` (`idrefeicao` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `qtgostoso`.`dificuldade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qtgostoso`.`dificuldade` (
  `iddificuldade` INT NOT NULL,
  `dificuldade` VARCHAR(45) NOT NULL,
  `ativo` TINYINT NOT NULL,
  PRIMARY KEY (`iddificuldade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `qtgostoso`.`preparo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qtgostoso`.`preparo` (
  `idpreparo` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `preparo` LONGTEXT NOT NULL,
  `urlVideo` VARCHAR(45) NULL,
  PRIMARY KEY (`idpreparo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `qtgostoso`.`cozinha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qtgostoso`.`cozinha` (
  `idcozinha` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cozinha` VARCHAR(85) NOT NULL,
  `ativo` TINYINT NOT NULL,
  PRIMARY KEY (`idcozinha`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `qtgostoso`.`receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qtgostoso`.`receita` (
  `idreceita` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(85) NOT NULL,
  `descricao` TINYTEXT NULL,
  `imagem` LONGBLOB NULL,
  `dificuldade_iddificuldade` INT NOT NULL,
  `preparo_idpreparo` INT UNSIGNED NOT NULL,
  `cozinha_idcozinha` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idreceita`),
  UNIQUE INDEX `idreceita_UNIQUE` (`idreceita` ASC),
  INDEX `fk_receita_dificuldade1_idx` (`dificuldade_iddificuldade` ASC),
  INDEX `fk_receita_preparo1_idx` (`preparo_idpreparo` ASC),
  INDEX `fk_receita_cozinha1_idx` (`cozinha_idcozinha` ASC),
  CONSTRAINT `fk_receita_dificuldade1`
    FOREIGN KEY (`dificuldade_iddificuldade`)
    REFERENCES `qtgostoso`.`dificuldade` (`iddificuldade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_receita_preparo1`
    FOREIGN KEY (`preparo_idpreparo`)
    REFERENCES `qtgostoso`.`preparo` (`idpreparo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_receita_cozinha1`
    FOREIGN KEY (`cozinha_idcozinha`)
    REFERENCES `qtgostoso`.`cozinha` (`idcozinha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `qtgostoso`.`receita_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qtgostoso`.`receita_usuario` (
  `idcomentario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `receita_idreceita` INT UNSIGNED NOT NULL,
  `usuario_idusuario` INT UNSIGNED NOT NULL,
  `comentario` LONGTEXT NULL,
  `nota` TINYINT UNSIGNED NOT NULL,
  `dataComentario` DATE NOT NULL DEFAULT current_timestamp(),
  INDEX `fk_receita_has_usuario_usuario1_idx` (`usuario_idusuario` ASC),
  INDEX `fk_receita_has_usuario_receita_idx` (`receita_idreceita` ASC),
  PRIMARY KEY (`idcomentario`),
  CONSTRAINT `fk_receita_has_usuario_receita`
    FOREIGN KEY (`receita_idreceita`)
    REFERENCES `qtgostoso`.`receita` (`idreceita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_receita_has_usuario_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `qtgostoso`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `qtgostoso`.`ingrediente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qtgostoso`.`ingrediente` (
  `idingrediente` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ingrediente` VARCHAR(85) NOT NULL,
  PRIMARY KEY (`idingrediente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `qtgostoso`.`dosagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qtgostoso`.`dosagem` (
  `iddosagem` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dosagem` VARCHAR(85) NOT NULL,
  `abreviaçcao` VARCHAR(45) NULL,
  PRIMARY KEY (`iddosagem`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `qtgostoso`.`receita_ingrediente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qtgostoso`.`receita_ingrediente` (
  `receita_idreceita` INT UNSIGNED NOT NULL,
  `ingrediente_idingrediente` INT UNSIGNED NOT NULL,
  `dosagem_iddosagem` INT UNSIGNED NOT NULL,
  `quantidade` FLOAT NULL,
  INDEX `fk_receita_has_ingrediente_ingrediente1_idx` (`ingrediente_idingrediente` ASC),
  INDEX `fk_receita_has_ingrediente_receita1_idx` (`receita_idreceita` ASC),
  INDEX `fk_receita_has_ingrediente_dosagem1_idx` (`dosagem_iddosagem` ASC),
  PRIMARY KEY (`receita_idreceita`, `ingrediente_idingrediente`),
  CONSTRAINT `fk_receita_has_ingrediente_receita1`
    FOREIGN KEY (`receita_idreceita`)
    REFERENCES `qtgostoso`.`receita` (`idreceita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_receita_has_ingrediente_ingrediente1`
    FOREIGN KEY (`ingrediente_idingrediente`)
    REFERENCES `qtgostoso`.`ingrediente` (`idingrediente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_receita_has_ingrediente_dosagem1`
    FOREIGN KEY (`dosagem_iddosagem`)
    REFERENCES `qtgostoso`.`dosagem` (`iddosagem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `qtgostoso`.`refeicao_receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qtgostoso`.`refeicao_receita` (
  `refeicao_idrefeicao` INT UNSIGNED NOT NULL,
  `receita_idreceita` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`refeicao_idrefeicao`, `receita_idreceita`),
  INDEX `fk_refeicao_has_receita_receita1_idx` (`receita_idreceita` ASC),
  INDEX `fk_refeicao_has_receita_refeicao1_idx` (`refeicao_idrefeicao` ASC),
  CONSTRAINT `fk_refeicao_has_receita_refeicao1`
    FOREIGN KEY (`refeicao_idrefeicao`)
    REFERENCES `qtgostoso`.`refeicao` (`idrefeicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_refeicao_has_receita_receita1`
    FOREIGN KEY (`receita_idreceita`)
    REFERENCES `qtgostoso`.`receita` (`idreceita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `qtgostoso`.`categoria_receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `qtgostoso`.`categoria_receita` (
  `categoria_idcategoria` INT UNSIGNED NOT NULL,
  `receita_idreceita` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`categoria_idcategoria`, `receita_idreceita`),
  INDEX `fk_categoria_has_receita_receita1_idx` (`receita_idreceita` ASC),
  INDEX `fk_categoria_has_receita_categoria1_idx` (`categoria_idcategoria` ASC),
  CONSTRAINT `fk_categoria_has_receita_categoria1`
    FOREIGN KEY (`categoria_idcategoria`)
    REFERENCES `qtgostoso`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categoria_has_receita_receita1`
    FOREIGN KEY (`receita_idreceita`)
    REFERENCES `qtgostoso`.`receita` (`idreceita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
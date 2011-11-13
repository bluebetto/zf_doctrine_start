SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `imob` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `imob` ;

-- -----------------------------------------------------
-- Table `imob`.`acesso`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `imob`.`acesso` (
  `id_acesso` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `usuario` VARCHAR(255) NULL ,
  `senha` VARCHAR(40) NULL ,
  `cadastrado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id_acesso`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imob`.`corretor_situacao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `imob`.`corretor_situacao` (
  `id_situacao` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `situacao` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id_situacao`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imob`.`corretor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `imob`.`corretor` (
  `id_corretor` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `id_acesso` BIGINT(20) NOT NULL ,
  `id_situacao` BIGINT(20) NOT NULL ,
  `nome` VARCHAR(255) NOT NULL ,
  `cpf` INT(11) ZEROFILL NULL ,
  `rg` INT(11) NULL ,
  `crm` VARCHAR(255) NULL ,
  `data_nascimento` DATE NULL ,
  `endereco` VARCHAR(255) NULL ,
  `complemento` VARCHAR(255) NULL ,
  `bairro` VARCHAR(255) NULL ,
  `cidade` VARCHAR(255) NULL ,
  `uf` VARCHAR(2) NULL ,
  `escolaridade` VARCHAR(255) NULL ,
  `email` VARCHAR(255) NULL ,
  `telefone` VARCHAR(11) NULL ,
  `cadastrado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `removido` DATETIME NULL ,
  PRIMARY KEY (`id_corretor`) ,
  INDEX `fk_corretor_acesso1` (`id_acesso` ASC) ,
  INDEX `fk_corretor_corretor_situacao1` (`id_situacao` ASC) ,
  CONSTRAINT `fk_corretor_acesso1`
    FOREIGN KEY (`id_acesso` )
    REFERENCES `imob`.`acesso` (`id_acesso` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_corretor_corretor_situacao1`
    FOREIGN KEY (`id_situacao` )
    REFERENCES `imob`.`corretor_situacao` (`id_situacao` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imob`.`imovel_tipo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `imob`.`imovel_tipo` (
  `id_tipo` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id_tipo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imob`.`imovel`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `imob`.`imovel` (
  `id_imovel` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `id_corretor` BIGINT(20) NOT NULL ,
  `id_tipo` BIGINT(20) NOT NULL ,
  `codigo` VARCHAR(255) NULL ,
  `endereco` VARCHAR(255) NOT NULL ,
  `complemento` VARCHAR(255) NULL ,
  `bairro` VARCHAR(255) NOT NULL ,
  `cidade` VARCHAR(255) NOT NULL ,
  `uf` VARCHAR(2) NOT NULL ,
  `valor_venda` DECIMAL(12,2) NULL ,
  `valor_aluguel` DECIMAL(12,2) NULL ,
  `area_terreno` DECIMAL(7,1) NULL ,
  `area_construida` DECIMAL(7,1) NULL ,
  `descricao` TEXT NULL ,
  `visualizado` VARCHAR(255) NOT NULL DEFAULT 0 ,
  `cadastrado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `removido` DATETIME NULL ,
  `aluguel` INT(1) NOT NULL DEFAULT 1 ,
  `venda` INT(1) NOT NULL DEFAULT 0 ,
  `temporada` INT(1) NOT NULL DEFAULT 0 ,
  `reservado` DATE NULL ,
  PRIMARY KEY (`id_imovel`) ,
  INDEX `fk_imovel_imovel_tipo1` (`id_tipo` ASC) ,
  INDEX `fk_imovel_corretor1` (`id_corretor` ASC) ,
  CONSTRAINT `fk_imovel_imovel_tipo1`
    FOREIGN KEY (`id_tipo` )
    REFERENCES `imob`.`imovel_tipo` (`id_tipo` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_imovel_corretor1`
    FOREIGN KEY (`id_corretor` )
    REFERENCES `imob`.`corretor` (`id_corretor` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imob`.`item`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `imob`.`item` (
  `id_item` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `descricao` VARCHAR(255) NOT NULL ,
  `valor_padrao` VARCHAR(255) NULL ,
  PRIMARY KEY (`id_item`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imob`.`imovel_imagem`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `imob`.`imovel_imagem` (
  `id_imagem` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `id_imovel` BIGINT(20) NOT NULL ,
  `arquivo` VARCHAR(255) NOT NULL ,
  `descricao` VARCHAR(255) NULL ,
  PRIMARY KEY (`id_imagem`) ,
  INDEX `fk_imovel_imagem_imovel1` (`id_imovel` ASC) ,
  CONSTRAINT `fk_imovel_imagem_imovel1`
    FOREIGN KEY (`id_imovel` )
    REFERENCES `imob`.`imovel` (`id_imovel` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imob`.`imovel_video`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `imob`.`imovel_video` (
  `id_video` BIGINT(20) NOT NULL AUTO_INCREMENT ,
  `id_imovel` BIGINT(20) NOT NULL ,
  `caminho` VARCHAR(255) NOT NULL ,
  `titulo` VARCHAR(255) NULL ,
  PRIMARY KEY (`id_video`) ,
  INDEX `fk_imovel_video_imovel` (`id_imovel` ASC) ,
  CONSTRAINT `fk_imovel_video_imovel`
    FOREIGN KEY (`id_imovel` )
    REFERENCES `imob`.`imovel` (`id_imovel` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imob`.`item_imovel`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `imob`.`item_imovel` (
  `id_item` BIGINT(20) NOT NULL ,
  `id_imovel` BIGINT(20) NOT NULL ,
  `valor` VARCHAR(255) NULL ,
  PRIMARY KEY (`id_item`, `id_imovel`) ,
  INDEX `fk_item_has_imovel_imovel1` (`id_imovel` ASC) ,
  CONSTRAINT `fk_item_has_imovel_item1`
    FOREIGN KEY (`id_item` )
    REFERENCES `imob`.`item` (`id_item` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_item_has_imovel_imovel1`
    FOREIGN KEY (`id_imovel` )
    REFERENCES `imob`.`imovel` (`id_imovel` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `imob`.`relatorios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `imob`.`relatorios` (
  `id_relatorio` BIGINT(20) NOT NULL ,
  `id_corretor` BIGINT(20) NOT NULL ,
  `id_imovel` BIGINT(20) NOT NULL ,
  `data` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `descricao` MEDIUMTEXT NULL ,
  `reserva` DATE NULL ,
  PRIMARY KEY (`id_relatorio`) ,
  INDEX `fk_relatorios_corretor1` (`id_corretor` ASC) ,
  INDEX `fk_relatorios_imovel1` (`id_imovel` ASC) ,
  CONSTRAINT `fk_relatorios_corretor1`
    FOREIGN KEY (`id_corretor` )
    REFERENCES `imob`.`corretor` (`id_corretor` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_relatorios_imovel1`
    FOREIGN KEY (`id_imovel` )
    REFERENCES `imob`.`imovel` (`id_imovel` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `imob`.`corretor_situacao`
-- -----------------------------------------------------
SET AUTOCOMMIT=0;
USE `imob`;
INSERT INTO `imob`.`corretor_situacao` (`id_situacao`, `situacao`) VALUES ('1', 'Ativo');
INSERT INTO `imob`.`corretor_situacao` (`id_situacao`, `situacao`) VALUES ('2', 'Bloqueado');

COMMIT;

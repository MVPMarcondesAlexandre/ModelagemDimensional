-- MySQL Script generated by MySQL Workbench
-- Mon Mar  5 19:47:40 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema BolsaFamilaDW
-- -----------------------------------------------------
-- Data Warehouse para o programa Bolsa Familia
DROP SCHEMA IF EXISTS `BolsaFamilaDW` ;

-- -----------------------------------------------------
-- Schema BolsaFamilaDW
--
-- Data Warehouse para o programa Bolsa Familia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BolsaFamilaDW` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `BolsaFamilaDW` ;

-- -----------------------------------------------------
-- Table `DimTempo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DimTempo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `DimTempo` (
  `idDimTempo` INT NOT NULL AUTO_INCREMENT,
  `ANO` INT NOT NULL,
  `MES` INT NOT NULL,
  `DIA` INT NOT NULL,
  PRIMARY KEY (`idDimTempo`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `DimMunicipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DimMunicipio` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `DimMunicipio` (
  `idDimCidade` INT NOT NULL AUTO_INCREMENT,
  `COD_SIAFI` BIGINT(255) NOT NULL,
  `MUNICIPIO` VARCHAR(45) NOT NULL,
  `ESTADO` VARCHAR(20) NOT NULL,
  `REGIAO` VARCHAR(20) NOT NULL,
  `UF` CHAR(2) NOT NULL,
  PRIMARY KEY (`idDimCidade`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `DimFavorecido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DimFavorecido` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `DimFavorecido` (
  `idDimFavorecido` INT NOT NULL AUTO_INCREMENT,
  `NIS` VARCHAR(45) NOT NULL,
  `NOME` VARCHAR(45) NULL,
  PRIMARY KEY (`idDimFavorecido`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `DimFuncao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DimFuncao` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `DimFuncao` (
  `idDimFuncao` INT NOT NULL AUTO_INCREMENT,
  `COD_FUNCAO` BIGINT(255) NOT NULL,
  `COD_SUBFUNCAO` BIGINT(255) NOT NULL,
  `COD_ACAO` BIGINT(255) NOT NULL,
  PRIMARY KEY (`idDimFuncao`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `DimFonte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DimFonte` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `DimFonte` (
  `idDimFonte` INT NOT NULL AUTO_INCREMENT,
  `FONTE` VARCHAR(45) NOT NULL,
  `FINALIDADE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDimFonte`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `FatBolsaFamilia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FatBolsaFamilia` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `FatBolsaFamilia` (
  `idDimCidade` INT NOT NULL,
  `idDimFavorecido` INT NOT NULL,
  `idDimFuncao` INT NOT NULL,
  `idDimFonte` INT NOT NULL,
  `idDimTempo` INT NOT NULL,
  `VALOR_PARCELA` DECIMAL(5, 2) NOT NULL)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

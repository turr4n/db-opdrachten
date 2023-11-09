-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbfirst` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `dbfirst` ;

-- -----------------------------------------------------
-- Table `dbfirst`.`map`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`map` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`map` (
  `map_id` INT UNSIGNED NOT NULL,
  `names` VARCHAR(45) NOT NULL,
  `size` INT NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`map_id`),
  UNIQUE INDEX `map_id_UNIQUE` (`map_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`players`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`players` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`players` (
  `players_id` INT UNSIGNED NOT NULL,
  `cosmetics` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `size` INT NOT NULL,
  PRIMARY KEY (`players_id`),
  UNIQUE INDEX `players_id_UNIQUE` (`players_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`wapens`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`wapens` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`wapens` (
  `wapens_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `levels` INT NOT NULL,
  `attachments` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`wapens_id`),
  UNIQUE INDEX `wapens_id_UNIQUE` (`wapens_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`Games`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`Games` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`Games` (
  `idGames` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGames`),
  UNIQUE INDEX `idGames_UNIQUE` (`idGames` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbfirst`.`Gamer_Achievements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`Gamer_Achievements` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`Gamer_Achievements` (
  `idgameraccount` INT UNSIGNED NOT NULL,
  `Gamer_id` INT NOT NULL,
  `Achievements_id` INT NOT NULL,
  `Games_idGames` INT UNSIGNED NOT NULL,
  UNIQUE INDEX `idGamer_Achievements_UNIQUE` (`idgameraccount` ASC) VISIBLE,
  PRIMARY KEY (`idgameraccount`),
  INDEX `fk_Gamer_Achievements_Games_idx` (`Games_idGames` ASC) VISIBLE,
  CONSTRAINT `fk_Gamer_Achievements_Games`
    FOREIGN KEY (`Games_idGames`)
    REFERENCES `dbfirst`.`Games` (`idGames`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbfirst`.`gameraccount`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`gameraccount` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`gameraccount` (
  `idgameraccount` INT UNSIGNED NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `Gamer_Achievements_idgameraccount` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idgameraccount`),
  UNIQUE INDEX `idgameraccount_UNIQUE` (`idgameraccount` ASC) VISIBLE,
  INDEX `fk_gameraccount_Gamer_Achievements1_idx` (`Gamer_Achievements_idgameraccount` ASC) VISIBLE,
  CONSTRAINT `fk_gameraccount_Gamer_Achievements1`
    FOREIGN KEY (`Gamer_Achievements_idgameraccount`)
    REFERENCES `dbfirst`.`Gamer_Achievements` (`idgameraccount`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbfirst`.`Achievements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`Achievements` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`Achievements` (
  `idAchievements` INT UNSIGNED NOT NULL,
  `Achievement_name` VARCHAR(45) NOT NULL,
  `Gamer_Achievements_idgameraccount` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idAchievements`),
  UNIQUE INDEX `idAchievements_UNIQUE` (`idAchievements` ASC) VISIBLE,
  INDEX `fk_Achievements_Gamer_Achievements1_idx` (`Gamer_Achievements_idgameraccount` ASC) VISIBLE,
  CONSTRAINT `fk_Achievements_Gamer_Achievements1`
    FOREIGN KEY (`Gamer_Achievements_idgameraccount`)
    REFERENCES `dbfirst`.`Gamer_Achievements` (`idgameraccount`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

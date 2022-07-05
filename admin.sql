
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema capstone
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema capstone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `capstone` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `capstone` ;

-- -----------------------------------------------------
-- Table `capstone`.`coupons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone`.`coupons` (
  `CouponID` INT NOT NULL AUTO_INCREMENT,
  `CouponName` VARCHAR(50) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  PRIMARY KEY (`CouponID`))
ENGINE = MyISAM
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_german2_ci;


-- -----------------------------------------------------
-- Table `capstone`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone`.`users` (
  `UserID` INT NOT NULL AUTO_INCREMENT,
  `UserEmail` VARCHAR(500) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  `UserPassword` VARCHAR(500) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  `UserFirstName` VARCHAR(50) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  `UserLastName` VARCHAR(50) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  `UserCity` VARCHAR(90) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  `UserState` VARCHAR(20) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  `UserZip` VARCHAR(12) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  `UserEmailVerified` TINYINT(1) NULL DEFAULT '0',
  `UserRegistrationDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `UserVerificationCode` VARCHAR(20) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  `UserIP` VARCHAR(50) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  `UserPhone` VARCHAR(20) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  `UserFax` VARCHAR(20) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  `UserCountry` VARCHAR(20) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  `UserAddress` VARCHAR(100) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  `UserAddress2` VARCHAR(50) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`UserID`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_german2_ci;


-- -----------------------------------------------------
-- Table `capstone`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone`.`products` (
  `ProductID` INT NOT NULL AUTO_INCREMENT,
  `ProductSKU` VARCHAR(50) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `ProductName` VARCHAR(100) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `ProductPrice` FLOAT NOT NULL,
  `ProductWeight` FLOAT NOT NULL,
  `ProductCartDesc` VARCHAR(250) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `ProductShortDesc` VARCHAR(1000) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `ProductLongDesc` TEXT CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `ProductThumb` VARCHAR(100) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `ProductImage` VARCHAR(100) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `ProductCategoryID` INT NULL DEFAULT NULL,
  `ProductUpdateDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ProductStock` FLOAT NULL DEFAULT NULL,
  `ProductLive` TINYINT(1) NULL DEFAULT '0',
  `ProductUnlimited` TINYINT(1) NULL DEFAULT '1',
  `ProductLocation` VARCHAR(250) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = MyISAM
AUTO_INCREMENT = 991
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_german2_ci;


-- -----------------------------------------------------
-- Table `capstone`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone`.`admin` (
  `AdminID` INT NOT NULL AUTO_INCREMENT,
  `AdminEmail` VARCHAR(500) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  `AdminPassword` VARCHAR(500) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  `AdminFirstName` VARCHAR(50) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  `AdminLastName` VARCHAR(50) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  `coupons_CouponID` INT NOT NULL,
  `users_UserID` INT NOT NULL,
  `products_ProductID` INT NOT NULL,
  PRIMARY KEY (`AdminID`, `coupons_CouponID`, `users_UserID`, `products_ProductID`),
  INDEX `fk_admin_coupons1_idx` (`coupons_CouponID` ASC) VISIBLE,
  INDEX `fk_admin_users1_idx` (`users_UserID` ASC) VISIBLE,
  INDEX `fk_admin_products1_idx` (`products_ProductID` ASC) VISIBLE)
ENGINE = MyISAM
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_german2_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

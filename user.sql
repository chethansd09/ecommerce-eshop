

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
-- Table `capstone`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone`.`orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `OrderUserID` INT NOT NULL,
  `OrderAmount` FLOAT NOT NULL,
  `OrderShipName` VARCHAR(100) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `OrderShipAddress` VARCHAR(100) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `OrderShipAddress2` VARCHAR(100) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `OrderCity` VARCHAR(50) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `OrderState` VARCHAR(50) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `OrderZip` VARCHAR(20) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `OrderCountry` VARCHAR(50) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `OrderPhone` VARCHAR(20) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `OrderFax` VARCHAR(20) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `OrderShipping` FLOAT NOT NULL,
  `OrderTax` FLOAT NOT NULL,
  `OrderEmail` VARCHAR(100) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `OrderDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OrderShipped` TINYINT(1) NOT NULL DEFAULT '0',
  `OrderTrackingNumber` VARCHAR(80) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NULL DEFAULT NULL,
  `orders_OrderID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_orders_users1_idx` (`OrderUserID` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_german2_ci;


-- -----------------------------------------------------
-- Table `capstone`.`productcategories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone`.`productcategories` (
  `CategoryID` INT NOT NULL AUTO_INCREMENT,
  `CategoryName` VARCHAR(50) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  PRIMARY KEY (`CategoryID`))
ENGINE = MyISAM
AUTO_INCREMENT = 7
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
  PRIMARY KEY (`ProductID`),
  INDEX `fk_products_productcategories1_idx` (`ProductCategoryID` ASC) VISIBLE)
ENGINE = MyISAM
AUTO_INCREMENT = 991
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_german2_ci;


-- -----------------------------------------------------
-- Table `capstone`.`orderdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone`.`orderdetails` (
  `DetailID` INT NOT NULL AUTO_INCREMENT,
  `DetailOrderID` INT NOT NULL,
  `DetailProductID` INT NOT NULL,
  `DetailName` VARCHAR(250) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `DetailPrice` FLOAT NOT NULL,
  `DetailSKU` VARCHAR(50) CHARACTER SET 'latin1' COLLATE 'latin1_german2_ci' NOT NULL,
  `DetailQuantity` INT NOT NULL,
  PRIMARY KEY (`DetailID`),
  INDEX `fk_orderdetails_orders1_idx` (`DetailOrderID` ASC) VISIBLE,
  INDEX `fk_orderdetails_products1_idx` (`DetailProductID` ASC) VISIBLE)
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_german2_ci;


-- -----------------------------------------------------
-- Table `capstone`.`Cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone`.`Cart` (
  `users_UserID` INT NOT NULL,
  `products_ProductID` INT NOT NULL,
  PRIMARY KEY (`users_UserID`),
  INDEX `fk_Cart_products1_idx` (`products_ProductID` ASC) VISIBLE,
  CONSTRAINT `fk_Cart_users1`
    FOREIGN KEY (`users_UserID`)
    REFERENCES `capstone`.`users` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cart_products1`
    FOREIGN KEY (`products_ProductID`)
    REFERENCES `capstone`.`products` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

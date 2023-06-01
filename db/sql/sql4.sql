CREATE SCHEMA IF NOT EXISTS `travelagency` DEFAULT CHARACTER SET utf8 ;
USE `travelagency` ;

CREATE TABLE IF NOT EXISTS `travelagency`.`Role` (
  `idRole` INT NOT NULL AUTO_INCREMENT,
  `roleName` VARCHAR(20) NULL,
  PRIMARY KEY (`idRole`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travelagency`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelagency`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(25) NOT NULL,
  `password` VARCHAR(40) NOT NULL,
  `enabled` TINYINT NULL DEFAULT 1,
  `idRole` INT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  INDEX `fk_User_Role1_idx` (`idRole` ASC) VISIBLE,
  CONSTRAINT `fk_User_Role1`
    FOREIGN KEY (`idRole`)
    REFERENCES `travelagency`.`Role` (`idRole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travelagency`.`Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelagency`.`Country` (
  `idCountry` INT NOT NULL AUTO_INCREMENT,
  `countryName` VARCHAR(40) NULL,
  PRIMARY KEY (`idCountry`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travelagency`.`Hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelagency`.`Hotel` (
  `idHotel` INT NOT NULL AUTO_INCREMENT,
  `hotelName` VARCHAR(40) NOT NULL,
  `idCountry` INT NOT NULL,
  PRIMARY KEY (`idHotel`),
  INDEX `fk_Hotel_Country1_idx` (`idCountry` ASC) VISIBLE,
  CONSTRAINT `fk_Hotel_Country1`
    FOREIGN KEY (`idCountry`)
    REFERENCES `travelagency`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travelagency`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelagency`.`Room` (
  `idRoom` INT NOT NULL AUTO_INCREMENT,
  `idHotel` INT NOT NULL,
  `capacity` INT NULL,
  PRIMARY KEY (`idRoom`),
  INDEX `fk_Room_Hotel1_idx` (`idHotel` ASC) VISIBLE,
  CONSTRAINT `fk_Room_Hotel1`
    FOREIGN KEY (`idHotel`)
    REFERENCES `travelagency`.`Hotel` (`idHotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travelagency`.`Booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travelagency`.`Booking` (
  `idBooking` INT NOT NULL AUTO_INCREMENT,
  `idRoom` INT NOT NULL,
  `idUser` INT NOT NULL,
  `startDate` DATE NULL,
  `endDate` DATE NULL,
  PRIMARY KEY (`idBooking`),
  INDEX `fk_Booking_Room1_idx` (`idRoom` ASC) VISIBLE,
  INDEX `fk_Booking_User1_idx` (`idUser` ASC) VISIBLE,
  CONSTRAINT `fk_Booking_Room1`
    FOREIGN KEY (`idRoom`)
    REFERENCES `travelagency`.`Room` (`idRoom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_User1`
    FOREIGN KEY (`idUser`)
    REFERENCES `travelagency`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Data for table `travelagency`.`Role`
-- -----------------------------------------------------
START TRANSACTION;
USE `travelagency`;
INSERT INTO `travelagency`.`Role` (`idRole`, `roleName`) VALUES (1, 'admin');
INSERT INTO `travelagency`.`Role` (`idRole`, `roleName`) VALUES (2, 'user');
INSERT INTO `travelagency`.`Role` (`idRole`, `roleName`) VALUES (3, 'guest');

COMMIT;


-- -----------------------------------------------------
-- Data for table `travelagency`.`User`
-- -----------------------------------------------------
START TRANSACTION;
USE `travelagency`;
INSERT INTO `travelagency`.`User` (`idUser`, `username`, `password`, `enabled`, `idRole`) VALUES (1, 'TEST1', 'test1', true, 1);
INSERT INTO `travelagency`.`User` (`idUser`, `username`, `password`, `enabled`, `idRole`) VALUES (2, 'test2', 'test2', false, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `travelagency`.`Country`
-- -----------------------------------------------------
START TRANSACTION;
USE `travelagency`;
INSERT INTO `travelagency`.`Country` (`idCountry`, `countryName`) VALUES (1, 'Ukraine');
INSERT INTO `travelagency`.`Country` (`idCountry`, `countryName`) VALUES (2, 'USA');
INSERT INTO `travelagency`.`Country` (`idCountry`, `countryName`) VALUES (3, 'Poland');

COMMIT;


-- -----------------------------------------------------
-- Data for table `travelagency`.`Hotel`
-- -----------------------------------------------------
START TRANSACTION;
USE `travelagency`;
INSERT INTO `travelagency`.`Hotel` (`idHotel`, `hotelName`, `idCountry`) VALUES (1, 'testHotel', 1);
INSERT INTO `travelagency`.`Hotel` (`idHotel`, `hotelName`, `idCountry`) VALUES (2, 'testGotel', 3);
INSERT INTO `travelagency`.`Hotel` (`idHotel`, `hotelName`, `idCountry`) VALUES (3, 'GrandHotel3', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `travelagency`.`Room`
-- -----------------------------------------------------
START TRANSACTION;
USE `travelagency`;
INSERT INTO `travelagency`.`Room` (`idRoom`, `idHotel`, `capacity`) VALUES (1, 1, 4);
INSERT INTO `travelagency`.`Room` (`idRoom`, `idHotel`, `capacity`) VALUES (2, 1, 3);
INSERT INTO `travelagency`.`Room` (`idRoom`, `idHotel`, `capacity`) VALUES (3, 1, 2);
INSERT INTO `travelagency`.`Room` (`idRoom`, `idHotel`, `capacity`) VALUES (4, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `travelagency`.`Booking`
-- -----------------------------------------------------
START TRANSACTION;
USE `travelagency`;
INSERT INTO `travelagency`.`Booking` (`idBooking`, `idRoom`, `idUser`, `startDate`, `endDate`) VALUES (1, 1, 1, '2023-05-27', '2023-06-01');
INSERT INTO `travelagency`.`Booking` (`idBooking`, `idRoom`, `idUser`, `startDate`, `endDate`) VALUES (2, 2, 1, '2023-06-01', '2023-06-06');

COMMIT;


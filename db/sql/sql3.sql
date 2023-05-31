CREATE SCHEMA IF NOT EXISTS `travelagency` DEFAULT CHARACTER SET utf8 ;
USE `travelagency` ;

CREATE TABLE IF NOT EXISTS `Role` (
  `idRole` INT NOT NULL,
  `roleName` VARCHAR(20) NULL,
  PRIMARY KEY (`idRole`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `User` (
  `idUser` INT NOT NULL,
  `username` VARCHAR(25) NOT NULL,
  `password` VARCHAR(40) NOT NULL,
  `enabled` TINYINT NULL DEFAULT 1,
  `idRole` INT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  INDEX `fk_User_Role1_idx` (`idRole` ASC) VISIBLE,
  CONSTRAINT `fk_User_Role1`
    FOREIGN KEY (`idRole`)
    REFERENCES `Role` (`idRole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Country` (
  `idCountry` INT NOT NULL,
  `countryName` VARCHAR(40) NULL,
  PRIMARY KEY (`idCountry`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Hotel` (
  `idHotel` INT NOT NULL,
  `hotelName` VARCHAR(40) NOT NULL,
  `idCountry` INT NOT NULL,
  PRIMARY KEY (`idHotel`),
  INDEX `fk_Hotel_Country1_idx` (`idCountry` ASC) VISIBLE,
  CONSTRAINT `fk_Hotel_Country1`
    FOREIGN KEY (`idCountry`)
    REFERENCES `Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Room` (
  `idRoom` INT NOT NULL,
  `idHotel` INT NOT NULL,
  `capacity` INT NULL,
  PRIMARY KEY (`idRoom`),
  INDEX `fk_Room_Hotel1_idx` (`idHotel` ASC) VISIBLE,
  CONSTRAINT `fk_Room_Hotel1`
    FOREIGN KEY (`idHotel`)
    REFERENCES `Hotel` (`idHotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `Booking` (
  `idBooking` INT NOT NULL,
  `idRoom` INT NOT NULL,
  `idUser` INT NOT NULL,
  `startDate` DATE NULL,
  `endDate` DATE NULL,
  PRIMARY KEY (`idBooking`),
  INDEX `fk_Booking_Room1_idx` (`idRoom` ASC) VISIBLE,
  INDEX `fk_Booking_User1_idx` (`idUser` ASC) VISIBLE,
  CONSTRAINT `fk_Booking_Room1`
    FOREIGN KEY (`idRoom`)
    REFERENCES `Room` (`idRoom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Booking_User1`
    FOREIGN KEY (`idUser`)
    REFERENCES `User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

START TRANSACTION;
USE `travelagency`;
INSERT INTO `Role` (`idRole`, `roleName`) VALUES (1, 'admin');
INSERT INTO `Role` (`idRole`, `roleName`) VALUES (2, 'user');
INSERT INTO `Role` (`idRole`, `roleName`) VALUES (3, 'guest');
COMMIT;

START TRANSACTION;
USE `travelagency`;
INSERT INTO `User` (`idUser`, `username`, `password`, `enabled`, `idRole`) VALUES (1, 'TEST1', 'test1', true, 1);
INSERT INTO `User` (`idUser`, `username`, `password`, `enabled`, `idRole`) VALUES (2, 'test2', 'test2', false, 2);
COMMIT;

START TRANSACTION;
USE `travelagency`;
INSERT INTO `Country` (`idCountry`, `countryName`) VALUES (1, 'Ukraine');
INSERT INTO `Country` (`idCountry`, `countryName`) VALUES (2, 'USA');
INSERT INTO `Country` (`idCountry`, `countryName`) VALUES (3, 'Poland');
COMMIT;


START TRANSACTION;
USE `travelagency`;
INSERT INTO `Hotel` (`idHotel`, `hotelName`, `idCountry`) VALUES (1, 'testHotel', 1);
INSERT INTO `Hotel` (`idHotel`, `hotelName`, `idCountry`) VALUES (2, 'testGotel', 3);
COMMIT;

START TRANSACTION;
USE `travelagency`;
INSERT INTO `Room` (`idRoom`, `idHotel`, `capacity`) VALUES (1, 1, 4);
INSERT INTO `Room` (`idRoom`, `idHotel`, `capacity`) VALUES (2, 1, 3);
INSERT INTO `Room` (`idRoom`, `idHotel`, `capacity`) VALUES (3, 1, 2);
INSERT INTO `Room` (`idRoom`, `idHotel`, `capacity`) VALUES (4, 1, 1);
COMMIT;

START TRANSACTION;
USE `travelagency`;
INSERT INTO `Booking` (`idBooking`, `idRoom`, `idUser`, `startDate`, `endDate`) VALUES (1, 1, 1, '2023-05-27', '2023-06-01');
INSERT INTO `Booking` (`idBooking`, `idRoom`, `idUser`, `startDate`, `endDate`) VALUES (2, 2, 1, '2023-06-01', '2023-06-06');
COMMIT;


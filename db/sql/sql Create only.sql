CREATE DATABASE IF NOT EXISTS `travelagency` DEFAULT CHARACTER SET utf8 ;
USE `travelagency` ;

CREATE TABLE `role` (
  `idRole` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB ;

CREATE TABLE `user` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(40) NOT NULL,
  `enabled` tinyint DEFAULT NULL,
  `idRole` int NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_User_Role1_idx` (`idRole`),
  CONSTRAINT `fk_User_Role1` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`)
) ENGINE=InnoDB ;

CREATE TABLE `country` (
  `idCountry` int NOT NULL AUTO_INCREMENT,
  `countryName` varchar(40) DEFAULT NULL,
  `enabled` tinyint DEFAULT NULL,
  PRIMARY KEY (`idCountry`)
) ENGINE=InnoDB ;

CREATE TABLE `hotel` (
  `idHotel` int NOT NULL AUTO_INCREMENT,
  `hotelName` varchar(40) DEFAULT NULL,
  `idCountry` int NOT NULL,
  `enabled` tinyint DEFAULT NULL,
  PRIMARY KEY (`idHotel`),
  KEY `fk_Hotel_Country1_idx` (`idCountry`),
  CONSTRAINT `fk_Hotel_Country1` FOREIGN KEY (`idCountry`) REFERENCES `country` (`idCountry`)
) ENGINE=InnoDB ;

CREATE TABLE `booking` (
  `idBooking` int NOT NULL AUTO_INCREMENT,
  `idRoom` int NOT NULL,
  `idUser` int NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`idBooking`),
  KEY `fk_Booking_Room1_idx` (`idRoom`),
  KEY `fk_Booking_User1_idx` (`idUser`),
  CONSTRAINT `fk_Booking_Room1` FOREIGN KEY (`idRoom`) REFERENCES `room` (`idRoom`),
  CONSTRAINT `fk_Booking_User1` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB ;


CREATE TABLE `room` (
  `idRoom` int NOT NULL AUTO_INCREMENT,
  `idHotel` int NOT NULL,
  `capacity` int DEFAULT NULL,
  `enabled` tinyint DEFAULT NULL,
  PRIMARY KEY (`idRoom`),
  KEY `fk_Room_Hotel1_idx` (`idHotel`),
  CONSTRAINT `fk_Room_Hotel1` FOREIGN KEY (`idHotel`) REFERENCES `hotel` (`idHotel`)
) ENGINE=InnoDB ;


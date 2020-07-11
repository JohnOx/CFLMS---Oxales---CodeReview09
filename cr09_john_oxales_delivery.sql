-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 11. Jul 2020 um 16:56
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_john_oxales_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_john_oxales_delivery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr09_john_oxales_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL,
  `country_code` varchar(11) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `country`
--

INSERT INTO `country` (`country_id`, `zip_code`, `country`, `country_code`, `city`) VALUES
(1, 1400, 'Austria', 'VIE', 'Airport'),
(2, 1230, 'Austria', 'VIE', 'Vienna'),
(3, 11800, 'Mexiko', 'MEX', 'Monterey'),
(4, 1450, 'Russia', 'RUS', 'Moskau'),
(5, 1180, 'China', 'CHN', 'Beijing'),
(6, 1830, 'Colombia', 'COL', 'Bogota');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `street` varchar(80) DEFAULT NULL,
  `fk_country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `street`, `fk_country_id`) VALUES
(1, 'John', 'Donut', 'Super Street', 2),
(2, 'Joanna', 'Donut', 'Super Street', 1),
(3, 'Joshua', 'Twix', 'Double Caramel Street', 3),
(4, 'John', 'Dershey', 'Choco Street', 4),
(5, 'Erica', 'King', 'Sexy Street', 6),
(6, 'Jenny', 'Queen', 'Special Street', 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `deposit`
--

CREATE TABLE `deposit` (
  `deposit_id` int(11) NOT NULL,
  `deposit_time` time DEFAULT NULL,
  `deposit_date` date DEFAULT NULL,
  `deposit_from` varchar(55) DEFAULT NULL,
  `fk_item_id` int(11) DEFAULT NULL,
  `fk_station_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `deposit`
--

INSERT INTO `deposit` (`deposit_id`, `deposit_time`, `deposit_date`, `deposit_from`, `fk_item_id`, `fk_station_id`) VALUES
(1, '10:15:00', '2020-07-01', NULL, 2, 3),
(2, '11:20:05', '2019-05-20', NULL, 2, 3),
(3, '12:30:15', '2018-04-20', NULL, 2, 3),
(4, '13:45:55', '2020-06-07', NULL, 3, 4),
(5, '14:24:24', '2020-10-03', NULL, 6, 6),
(6, '11:27:35', '2020-03-10', NULL, 4, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `destination`
--

CREATE TABLE `destination` (
  `destination_id` int(11) NOT NULL,
  `arrival_date` date DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `fk_country_id` int(11) DEFAULT NULL,
  `fk_route_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `destination`
--

INSERT INTO `destination` (`destination_id`, `arrival_date`, `arrival_time`, `fk_country_id`, `fk_route_id`) VALUES
(1, '2020-07-18', '10:20:05', NULL, NULL),
(2, '2020-06-08', '11:20:05', NULL, NULL),
(3, '2020-05-12', '12:20:05', NULL, NULL),
(4, '2020-04-19', '13:20:05', NULL, NULL),
(5, '2020-03-15', '14:20:05', NULL, NULL),
(6, '2020-02-28', '15:20:05', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `fk_station_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `fk_station_id`) VALUES
(1, 'Worker', 'Alpha', NULL),
(2, 'Worker', 'Bravo', NULL),
(3, 'Worker', 'Charlie', NULL),
(4, 'Worker', 'Delta', NULL),
(5, 'Worker', 'Echo', NULL),
(6, 'Worker', 'Foxtrott', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `item_barcode` int(11) DEFAULT NULL,
  `type_item` varchar(80) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `item`
--

INSERT INTO `item` (`item_id`, `item_barcode`, `type_item`, `fk_customer_id`) VALUES
(1, 1122334455, 'mail', 5),
(2, 2147483647, 'air-mail', 5),
(3, 1234567890, 'parcel', 6),
(4, 987654321, 'express-mail', 1),
(5, 102030405, 'mail', 1),
(6, 2147483647, 'parcel', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `logistics`
--

CREATE TABLE `logistics` (
  `logistics_id` int(11) NOT NULL,
  `type_transportation` varchar(55) DEFAULT NULL,
  `fk_shipment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `logistics`
--

INSERT INTO `logistics` (`logistics_id`, `type_transportation`, `fk_shipment_id`) VALUES
(1, 'AIR', NULL),
(2, 'LAND', NULL),
(3, 'SEA', NULL),
(4, 'BIKE', NULL),
(5, 'ROCKET', NULL),
(6, 'CAR', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `packing_station`
--

CREATE TABLE `packing_station` (
  `station_id` int(11) NOT NULL,
  `station_code` varchar(55) DEFAULT NULL,
  `street` varchar(80) DEFAULT NULL,
  `fk_country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `packing_station`
--

INSERT INTO `packing_station` (`station_id`, `station_code`, `street`, `fk_country_id`) VALUES
(1, 'JO-MDS-VIE', 'Mock up Street', 1),
(2, 'JO-MDS-RUS', 'Mail Street', 5),
(3, 'JO-MDS-AXL', 'Master Street', 6),
(4, 'JO-MDS-COL', 'Monster Street', 4),
(5, 'JO-MDS-CHN', 'Moldaa Street', 4),
(6, 'JO-MDS-MEX', 'Pulp Fiction Street', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `processing`
--

CREATE TABLE `processing` (
  `process_id` int(11) NOT NULL,
  `type_process` varchar(80) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `processing`
--

INSERT INTO `processing` (`process_id`, `type_process`, `fk_employee_id`) VALUES
(1, 'send', NULL),
(2, 're-send', NULL),
(3, 'store', NULL),
(4, 'calculate', NULL),
(5, 'prepare', NULL),
(6, 'dispatch', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `route`
--

CREATE TABLE `route` (
  `route_id` int(11) NOT NULL,
  `route_coude` varchar(55) DEFAULT NULL,
  `fk_logistics_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `route`
--

INSERT INTO `route` (`route_id`, `route_coude`, `fk_logistics_id`) VALUES
(1, 'A-100', NULL),
(2, 'B-200', NULL),
(3, 'C-300', NULL),
(4, 'D-400', NULL),
(5, 'E-500', NULL),
(6, 'F-600', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shipment`
--

CREATE TABLE `shipment` (
  `shipment_id` int(11) NOT NULL,
  `shipment_time` time DEFAULT NULL,
  `shipment_date` date DEFAULT NULL,
  `shipment_to` varchar(55) DEFAULT NULL,
  `shipment_from` varchar(55) DEFAULT NULL,
  `fk_deposit_id` int(11) DEFAULT NULL,
  `fk_process_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `shipment`
--

INSERT INTO `shipment` (`shipment_id`, `shipment_time`, `shipment_date`, `shipment_to`, `shipment_from`, `fk_deposit_id`, `fk_process_id`) VALUES
(1, '10:15:00', '2020-07-01', NULL, NULL, NULL, NULL),
(2, '00:15:00', '2020-07-02', NULL, NULL, NULL, NULL),
(3, '09:15:00', '2020-07-03', NULL, NULL, NULL, NULL),
(4, '03:15:00', '2020-07-04', NULL, NULL, NULL, NULL),
(5, '05:15:00', '2020-07-05', NULL, NULL, NULL, NULL),
(6, '06:15:00', '2020-07-06', NULL, NULL, NULL, NULL);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_country_id` (`fk_country_id`);

--
-- Indizes für die Tabelle `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`deposit_id`),
  ADD KEY `fk_item_id` (`fk_item_id`),
  ADD KEY `fk_station_id` (`fk_station_id`);

--
-- Indizes für die Tabelle `destination`
--
ALTER TABLE `destination`
  ADD PRIMARY KEY (`destination_id`),
  ADD KEY `fk_route_id` (`fk_route_id`),
  ADD KEY `fk_country_id` (`fk_country_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indizes für die Tabelle `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `logistics`
--
ALTER TABLE `logistics`
  ADD PRIMARY KEY (`logistics_id`),
  ADD KEY `fk_shipment_id` (`fk_shipment_id`);

--
-- Indizes für die Tabelle `packing_station`
--
ALTER TABLE `packing_station`
  ADD PRIMARY KEY (`station_id`),
  ADD KEY `fk_country_id` (`fk_country_id`);

--
-- Indizes für die Tabelle `processing`
--
ALTER TABLE `processing`
  ADD PRIMARY KEY (`process_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indizes für die Tabelle `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `fk_logistics_id` (`fk_logistics_id`);

--
-- Indizes für die Tabelle `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`shipment_id`),
  ADD KEY `fk_process_id` (`fk_process_id`),
  ADD KEY `fk_deposit_id` (`fk_deposit_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `deposit`
--
ALTER TABLE `deposit`
  MODIFY `deposit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `destination`
--
ALTER TABLE `destination`
  MODIFY `destination_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `logistics`
--
ALTER TABLE `logistics`
  MODIFY `logistics_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `packing_station`
--
ALTER TABLE `packing_station`
  MODIFY `station_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `processing`
--
ALTER TABLE `processing`
  MODIFY `process_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `route`
--
ALTER TABLE `route`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `shipment`
--
ALTER TABLE `shipment`
  MODIFY `shipment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_country_id`) REFERENCES `country` (`country_id`);

--
-- Constraints der Tabelle `deposit`
--
ALTER TABLE `deposit`
  ADD CONSTRAINT `deposit_ibfk_1` FOREIGN KEY (`fk_item_id`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `deposit_ibfk_2` FOREIGN KEY (`fk_station_id`) REFERENCES `packing_station` (`station_id`),
  ADD CONSTRAINT `deposit_ibfk_3` FOREIGN KEY (`fk_station_id`) REFERENCES `packing_station` (`station_id`);

--
-- Constraints der Tabelle `destination`
--
ALTER TABLE `destination`
  ADD CONSTRAINT `destination_ibfk_1` FOREIGN KEY (`fk_route_id`) REFERENCES `route` (`route_id`),
  ADD CONSTRAINT `destination_ibfk_2` FOREIGN KEY (`fk_country_id`) REFERENCES `country` (`country_id`);

--
-- Constraints der Tabelle `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `logistics`
--
ALTER TABLE `logistics`
  ADD CONSTRAINT `logistics_ibfk_1` FOREIGN KEY (`fk_shipment_id`) REFERENCES `shipment` (`shipment_id`);

--
-- Constraints der Tabelle `packing_station`
--
ALTER TABLE `packing_station`
  ADD CONSTRAINT `packing_station_ibfk_1` FOREIGN KEY (`fk_country_id`) REFERENCES `country` (`country_id`);

--
-- Constraints der Tabelle `processing`
--
ALTER TABLE `processing`
  ADD CONSTRAINT `processing_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints der Tabelle `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`fk_logistics_id`) REFERENCES `logistics` (`logistics_id`);

--
-- Constraints der Tabelle `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`fk_process_id`) REFERENCES `processing` (`process_id`),
  ADD CONSTRAINT `shipment_ibfk_2` FOREIGN KEY (`fk_deposit_id`) REFERENCES `deposit` (`deposit_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
